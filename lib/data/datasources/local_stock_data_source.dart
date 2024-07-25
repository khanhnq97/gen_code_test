import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../generation_suggest_cache/model.dart';
import '../../generation_suggest_cache/suggest_cache_service/suggest_cache_service_impl.dart';
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
    final jsonString =
        sharedPreferences.getString(SuggestCacheServiceImpl.suggestCacheKey);
    if (jsonString != null) {
      final suggestItemList = (json.decode(jsonString) as List)
          .map((item) => SuggestItem.fromJson(item))
          .toList();
      return suggestItemsToStockItems(suggestItemList);
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

List<StockItemModel> suggestItemsToStockItems(List<SuggestItem> suggestItems) {
  return suggestItems
      .map((item) => StockItemModel(
            name: item.name,
            symbol: item.symbol,
            firstKeyword: item.keywordList.first,
          ))
      .toList();
}
