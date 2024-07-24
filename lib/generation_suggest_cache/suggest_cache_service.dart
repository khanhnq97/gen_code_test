// Interface cho Suggest Cache Service
abstract class SuggestCacheService {
  Future<bool> isSuggestCacheComplete();

  Future<void> saveSuggestCache(List<SuggestItem> suggestCache);
}


import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SuggestCacheServiceImpl implements SuggestCacheService {
  static const String _suggestCacheKey = 'suggest_cache';
  static const String _suggestCacheCompleteKey = 'suggest_cache_complete';

  @override
  Future<bool> isSuggestCacheComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_suggestCacheCompleteKey) ?? false;
  }

  @override
  Future<void> saveSuggestCache(List<SuggestItem> suggestCache) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_suggestCacheKey,
        jsonEncode(suggestCache.map((e) => e.toJson()).toList()));
    await prefs.setBool(_suggestCacheCompleteKey, true);
  }
}