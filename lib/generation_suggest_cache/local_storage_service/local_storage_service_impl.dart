import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/generation_suggest_cache/model.dart';

import 'local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  static const String _stockMasterHashKey = 'stock_master_hash';
  static const String _suggestHashKey = 'suggest_hash';
  static const String _stockMasterKey = 'stock_master';
  static const String _suggestDictionaryKey = 'suggest_dictionary';

  @override
  Future<String?> getStockMasterHash() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_stockMasterHashKey);
  }

  @override
  Future<String?> getSuggestHash() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_suggestHashKey);
  }

  @override
  Future<bool> saveStockMasterResponse(StockMasterResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_stockMasterKey, jsonEncode(response.toJson()));
  }

  @override
  Future<bool> saveSuggestDictionaryResponse(
      SuggestDictionaryResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(
        _suggestDictionaryKey, jsonEncode(response.toJson()));
  }

  @override
  Future<bool> saveStockMasterHash(String hash) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_stockMasterHashKey, hash);
  }

  @override
  Future<bool> saveSuggestHash(String hash) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_suggestHashKey, hash);
  }

  @override
  Future<StockMaster?> getStockMaster() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_stockMasterKey);
    return json != null ? StockMaster.fromJson(jsonDecode(json)) : null;
  }

  @override
  Future<SuggestDictionary?> getSuggestDictionary() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_suggestDictionaryKey);
    return json != null ? SuggestDictionary.fromJson(jsonDecode(json)) : null;
  }
}
