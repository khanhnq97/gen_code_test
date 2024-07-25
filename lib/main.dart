import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/presentation/bloc/stock_bloc.dart';
import 'package:test_app/presentation/pages/stock_list_page.dart';

import 'data/datasources/local_stock_data_source.dart';
import 'data/datasources/remote_stock_data_source.dart';
import 'data/repositories/stock_repository_impl.dart';
import 'domain/usecases/get_stock_items.dart';
import 'generation_suggest_cache/api_service/api_service_impl.dart';
import 'generation_suggest_cache/generation_suggest_cache.dart';
import 'generation_suggest_cache/local_storage_service/local_storage_service_impl.dart';
import 'generation_suggest_cache/suggest_cache_service/suggest_cache_service_impl.dart';

// Khởi tạo các service
final localStorageService = LocalStorageServiceImpl();
final apiService = ApiServiceImpl(baseUrl: 'https://stock.com');
final suggestCacheService = SuggestCacheServiceImpl();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  // Tạo SuggestCacheGenerator
  SuggestCacheGenerator(
    localStorageService,
    apiService,
    suggestCacheService,
  ).generateSuggestCache();

  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => StockBloc(
          getStockItems: GetStockItemsUsecase(
            StockRepositoryImpl(
              localDataSource: LocalStockDataSourceImpl(
                sharedPreferences: sharedPreferences,
              ),
              remoteDataSource: MockRemoteStockDataSourceImpl(),
            ),
          ),
        ),
        child: const StockListPage(),
      ),
    );
  }
}
