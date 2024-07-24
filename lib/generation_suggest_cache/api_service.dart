import 'dart:convert';

import 'package:http/http.dart' as http;

// Interface cho API Service
abstract class ApiService {
  Future<StockMasterResponse?> getStockMaster(String? hash);

  Future<SuggestDictionaryResponse?> getSuggestDictionary(String? hash);
}

class ApiServiceImpl implements ApiService {
  final String baseUrl;

  ApiServiceImpl({required this.baseUrl});

  @override
  Future<StockMasterResponse?> getStockMaster(String? hash) async {
    final url = Uri.parse('$baseUrl/SymbolDictionary?Hash=$hash');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return StockMasterResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  @override
  Future<SuggestDictionaryResponse?> getSuggestDictionary(String? hash) async {
    final url = Uri.parse('$baseUrl/SuggestionDictionary?Hash=$hash');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return SuggestDictionaryResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
