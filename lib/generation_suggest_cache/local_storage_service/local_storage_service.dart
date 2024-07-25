// Interface cho Local Storage Service
import 'package:test_app/generation_suggest_cache/model.dart';

abstract class LocalStorageService {
  Future<String?> getStockMasterHash();

  Future<String?> getSuggestHash();

  Future<bool> saveStockMasterResponse(StockMasterResponse response);

  Future<bool> saveSuggestDictionaryResponse(
      SuggestDictionaryResponse response);

  Future<bool> saveStockMasterHash(String hash);

  Future<bool> saveSuggestHash(String hash);

  Future<StockMaster?> getStockMaster();

  Future<SuggestDictionary?> getSuggestDictionary();
}
