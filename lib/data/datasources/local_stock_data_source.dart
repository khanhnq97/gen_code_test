import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/stock_item_model.dart';

abstract class LocalStockDataSource {
  Future<List<StockItemModel>> getStockItems();

  Future<void> cacheStockItems(List<StockItemModel> stockItemsToCache);
}

class LocalStockDataSourceImpl implements LocalStockDataSource {
  final SharedPreferences sharedPreferences;

  LocalStockDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<StockItemModel>> getStockItems() async {
    final jsonString = sharedPreferences.getString('CACHED_STOCK_ITEMS');
    if (jsonString != null) {
      return (json.decode(jsonString) as List)
          .map((item) => StockItemModel.fromJson(item))
          .toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheStockItems(List<StockItemModel> stockItemsToCache) {
    return sharedPreferences.setString(
      'CACHED_STOCK_ITEMS',
      json.encode(stockItemsToCache.map((item) => item.toJson()).toList()),
    );
  }
}

class CacheException implements Exception {}
