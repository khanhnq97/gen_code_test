// Interface cho Suggest Cache Service
import 'package:test_app/generation_suggest_cache/model.dart';

abstract class SuggestCacheService {
  Future<bool> isSuggestCacheComplete();

  Future<void> saveSuggestCache(List<SuggestItem> suggestCache);
}
