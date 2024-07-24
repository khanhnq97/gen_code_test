import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasources/local_stock_data_source.dart';
import 'data/datasources/remote_stock_data_source.dart';
import 'data/repositories/stock_repository_impl.dart';
import 'domain/usecases/get_stock_items.dart';
import 'presentation/bloc/stock_bloc.dart';
import 'presentation/pages/stock_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => StockBloc(
          getStockItems: GetStockItems(
            StockRepositoryImpl(
              localDataSource: LocalStockDataSourceImpl(
                sharedPreferences: sharedPreferences,
              ),
              remoteDataSource: MockRemoteStockDataSourceImpl(),
            ),
          ),
        ),
        child: StockListPage(),
      ),
    );
  }
}
