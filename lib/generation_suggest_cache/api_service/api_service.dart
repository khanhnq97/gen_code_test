// Interface cho API Service
import 'package:test_app/generation_suggest_cache/model.dart';

abstract class ApiService {
  Future<StockMasterResponse?> getStockMaster(String? hash);

  Future<SuggestDictionaryResponse?> getSuggestDictionary(String? hash);
}
