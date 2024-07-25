import 'package:test_app/generation_suggest_cache/model.dart';

StockMasterResponse createSampleStockMasterResponse() {
  return StockMasterResponse(
    hash: 'abc123def456',
    updateFlag: true,
    exchangeMap: {
      'TSE': 'Tokyo Stock Exchange',
      'NYSE': 'New York Stock Exchange',
      'NASDAQ': 'NASDAQ Stock Market',
    },
    divisionCodeMap: {
      '1': 'First Section',
      '2': 'Second Section',
      'M': 'Mothers',
    },
    symbolItems: List.generate(5, (index) => createSampleSymbolItem(index)),
  );
}

SymbolItem createSampleSymbolItem(int index) {
  return SymbolItem(
    symbol: '${1000 + index}',
    name: 'Company ${index + 1}',
    sName: 'C${index + 1}',
    nameYomi: 'カンパニー ${index + 1}',
    nameYomiEn: 'Company ${index + 1}',
    category: ['Technology', 'Finance', 'Healthcare'][index % 3],
    mainEx: ['TSE', 'NYSE', 'NASDAQ'][index % 3],
    exInfo: List.generate(2, (i) => createSampleExInfo(i)),
  );
}

ExInfo createSampleExInfo(int index) {
  return ExInfo(
    ex: ['TSE', 'NYSE', 'NASDAQ'][index % 3],
    div: ['1', '2', 'M'][index % 3],
    exName: 'Exchange ${index + 1}',
  );
}

// Sử dụng hàm để tạo dữ liệu mẫu
StockMasterResponse sampleResponse = createSampleStockMasterResponse();

SuggestDictionaryResponse createSampleSuggestDictionaryResponse() {
  return SuggestDictionaryResponse(
    hash: 'abc123def456',
    updateFlag: true,
    keywordItems: List.generate(5, (index) => createSampleKeywordItem(index)),
  );
}

KeywordItem createSampleKeywordItem(int index) {
  return KeywordItem(
    symbol: '${1000 + index}',
    keywordList: List.generate(3, (i) => 'Keyword${index + 1}_${i + 1}'),
  );
}
