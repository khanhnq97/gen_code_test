import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/generation_suggest_cache/suggest_cache_service/suggest_cache_service.dart';

import '../model.dart';

class SuggestCacheServiceImpl implements SuggestCacheService {
  static const String suggestCacheKey = 'suggest_cache';
  static const String suggestCacheCompleteKey = 'suggest_cache_complete';

  @override
  Future<bool> isSuggestCacheComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(suggestCacheCompleteKey) ?? false;
  }

  @override
  Future<void> saveSuggestCache(List<SuggestItem> suggestCache) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(suggestCacheKey,
        jsonEncode(suggestCache.map((e) => e.toJson()).toList()));
    await prefs.setBool(suggestCacheCompleteKey, true);
  }
}
