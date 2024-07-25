import 'package:test_app/generation_suggest_cache/create_example_data.dart';
import 'package:test_app/generation_suggest_cache/model.dart';

import 'api_service.dart';

class ApiServiceImpl implements ApiService {
  final String baseUrl;

  ApiServiceImpl({required this.baseUrl});

  @override
  Future<StockMasterResponse?> getStockMaster(String? hash) async {
    // final url = Uri.parse('$baseUrl/SymbolDictionary?Hash=$hash');
    // final response = await http.get(url);
    //
    // if (response.statusCode == 200) {
    //   return StockMasterResponse.fromJson(jsonDecode(response.body));
    // } else {
    //   return null;
    // }

    return createSampleStockMasterResponse();
  }

  @override
  Future<SuggestDictionaryResponse?> getSuggestDictionary(String? hash) async {
    // final url = Uri.parse('$baseUrl/SuggestionDictionary?Hash=$hash');
    // final response = await http.get(url);
    //
    // if (response.statusCode == 200) {
    //   return SuggestDictionaryResponse.fromJson(jsonDecode(response.body));
    // } else {
    //   return null;
    // }

    return createSampleSuggestDictionaryResponse();
  }
}
