import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:test_app/generation_suggest_cache/suggest_cache_service/suggest_cache_service.dart';

import 'api_service/api_service.dart';
import 'local_storage_service/local_storage_service.dart';
import 'model.dart';

class SuggestCacheGenerator {
  final LocalStorageService _localStorage;
  final ApiService _apiService;
  final SuggestCacheService _suggestCacheService;

  SuggestCacheGenerator(
      this._localStorage, this._apiService, this._suggestCacheService);

  Future<void> generateSuggestCache() async {
    try {
      // 1. Lấy stock master hash từ local storage
      final stockMasterHash = await _localStorage.getStockMasterHash();

      // 2. Gọi Stock Master API
      final stockMasterResponse =
          await _apiService.getStockMaster(stockMasterHash);

      // Kiểm tra lỗi giao tiếp hoặc response null
      if (stockMasterResponse == null) {
        debugPrint('Lỗi khi gọi Stock Master API hoặc response null');
        return;
      }

      // 3. Xử lý response Stock Master API
      if (stockMasterResponse.updateFlag) {
        await _localStorage.saveStockMasterResponse(stockMasterResponse);
        if (await _localStorage.saveStockMasterHash(stockMasterResponse.hash)) {
          debugPrint('Đã lưu Stock Master hash mới');
        }
      }

      // 4. Lấy suggest hash từ local storage
      final suggestHash = await _localStorage.getSuggestHash();

      // 5. Gọi Suggest Dictionary API
      final suggestDictionaryResponse =
          await _apiService.getSuggestDictionary(suggestHash);

      // 6. Xử lý response Suggest Dictionary API (tiếp tục ngay cả khi có lỗi)
      if (suggestDictionaryResponse != null &&
          suggestDictionaryResponse.updateFlag) {
        await _localStorage
            .saveSuggestDictionaryResponse(suggestDictionaryResponse);
        if (await _localStorage
            .saveSuggestHash(suggestDictionaryResponse.hash)) {
          debugPrint('Đã lưu Suggest hash mới');
        }
      }

      // 7. Kiểm tra điều kiện để tạo Suggest Cache
      bool shouldGenerateCache = await _shouldGenerateSuggestCache(
          stockMasterResponse.updateFlag,
          suggestDictionaryResponse?.updateFlag ?? false);

      if (shouldGenerateCache) {
        final stockMaster = await _localStorage.getStockMaster();
        final suggestDictionary = await _localStorage.getSuggestDictionary();

        if (stockMaster != null && suggestDictionary != null) {
          final suggestCache =
              _mergeSuggestCache(stockMaster, suggestDictionary);
          await _suggestCacheService.saveSuggestCache(suggestCache);
          debugPrint('Đã tạo và lưu Suggest Cache mới');
        }
      }
    } catch (e) {
      debugPrint('Lỗi trong quá trình tạo Suggest Cache: $e');
    }
  }

  Future<bool> _shouldGenerateSuggestCache(
      bool stockMasterUpdated, bool suggestDictionaryUpdated) async {
    final isCacheComplete = await _suggestCacheService.isSuggestCacheComplete();
    return !isCacheComplete || stockMasterUpdated || suggestDictionaryUpdated;
  }

  List<SuggestItem> _mergeSuggestCache(
      StockMaster stockMaster, SuggestDictionary suggestDictionary) {
    // Tạo một map từ symbol đến keyword list từ SuggestDictionary
    Map<String, List<String>> keywordMap = {
      for (var item in suggestDictionary.keywordItems)
        item.symbol: item.keywordList
    };

    // Merge dữ liệu và tạo danh sách SuggestItem
    return stockMaster.symbolItems.map((symbolItem) {
      return SuggestItem(
        symbol: symbolItem.symbol,
        name: symbolItem.name,
        sName: symbolItem.sName,
        nameYomi: symbolItem.nameYomi,
        nameYomiEn: symbolItem.nameYomiEn,
        category: symbolItem.category,
        mainEx: symbolItem.mainEx,
        exInfo: symbolItem.exInfo,
        keywordList: keywordMap[symbolItem.symbol] ??
            [], // Sử dụng keyword list từ SuggestDictionary nếu có, nếu không thì dùng list rỗng
      );
    }).toList();
  }
}
