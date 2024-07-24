class StockMasterResponse {
  final String hash;
  final bool updateFlag;
  final Map<String, String> exchangeMap;
  final Map<String, String> divisionCodeMap;
  final List<SymbolItem> symbolItems;

  StockMasterResponse({
    required this.hash,
    required this.updateFlag,
    required this.exchangeMap,
    required this.divisionCodeMap,
    required this.symbolItems,
  });

  factory StockMasterResponse.fromJson(Map<String, dynamic> json) {
    return StockMasterResponse(
      hash: json['Hash'],
      updateFlag: json['UpdateFlag'],
      exchangeMap: Map<String, String>.from(json['ExchangeMap']),
      divisionCodeMap: Map<String, String>.from(json['DivisionCodeMap']),
      symbolItems: (json['SymbolItems'] as List)
          .map((item) => SymbolItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Hash': hash,
      'UpdateFlag': updateFlag,
      'ExchangeMap': exchangeMap,
      'DivisionCodeMap': divisionCodeMap,
      'SymbolItems': symbolItems.map((item) => item.toJson()).toList(),
    };
  }
}

class SuggestDictionaryResponse {
  final String hash;
  final bool updateFlag;
  final List<KeywordItem> keywordItems;

  SuggestDictionaryResponse({
    required this.hash,
    required this.updateFlag,
    required this.keywordItems,
  });

  factory SuggestDictionaryResponse.fromJson(Map<String, dynamic> json) {
    return SuggestDictionaryResponse(
      hash: json['Hash'],
      updateFlag: json['UpdateFlag'],
      keywordItems: (json['KeywordItems'] as List)
          .map((item) => KeywordItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Hash': hash,
      'UpdateFlag': updateFlag,
      'KeywordItems': keywordItems.map((item) => item.toJson()).toList(),
    };
  }
}

class StockMaster {
  final String hash;
  final bool updateFlag;
  final Map<String, String> exchangeMap;
  final Map<String, String> divisionCodeMap;
  final List<SymbolItem> symbolItems;

  StockMaster({
    required this.hash,
    required this.updateFlag,
    required this.exchangeMap,
    required this.divisionCodeMap,
    required this.symbolItems,
  });

  factory StockMaster.fromJson(Map<String, dynamic> json) {
    return StockMaster(
      hash: json['Hash'],
      updateFlag: json['UpdateFlag'],
      exchangeMap: Map<String, String>.from(json['ExchangeMap']),
      divisionCodeMap: Map<String, String>.from(json['DivisionCodeMap']),
      symbolItems: (json['SymbolItems'] as List)
          .map((item) => SymbolItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Hash': hash,
      'UpdateFlag': updateFlag,
      'ExchangeMap': exchangeMap,
      'DivisionCodeMap': divisionCodeMap,
      'SymbolItems': symbolItems.map((item) => item.toJson()).toList(),
    };
  }
}

class SuggestDictionary {
  final String hash;
  final bool updateFlag;
  final List<KeywordItem> keywordItems;

  SuggestDictionary({
    required this.hash,
    required this.updateFlag,
    required this.keywordItems,
  });

  factory SuggestDictionary.fromJson(Map<String, dynamic> json) {
    return SuggestDictionary(
      hash: json['Hash'],
      updateFlag: json['UpdateFlag'],
      keywordItems: (json['KeywordItems'] as List)
          .map((item) => KeywordItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Hash': hash,
      'UpdateFlag': updateFlag,
      'KeywordItems': keywordItems.map((item) => item.toJson()).toList(),
    };
  }
}

class SuggestItem {
  final String symbol;
  final String name;
  final String sName;
  final String nameYomi;
  final String nameYomiEn;
  final String category;
  final String mainEx;
  final List<ExInfo> exInfo;
  final List<String> keywordList;

  SuggestItem({
    required this.symbol,
    required this.name,
    required this.sName,
    required this.nameYomi,
    required this.nameYomiEn,
    required this.category,
    required this.mainEx,
    required this.exInfo,
    required this.keywordList,
  });

  factory SuggestItem.fromJson(Map<String, dynamic> json) {
    return SuggestItem(
      symbol: json['Symbol'],
      name: json['Name'],
      sName: json['sName'],
      nameYomi: json['NameYomi'],
      nameYomiEn: json['NameYomiEn'],
      category: json['Category'],
      mainEx: json['MainEx'],
      exInfo: (json['ExInfo'] as List)
          .map((item) => ExInfo.fromJson(item))
          .toList(),
      keywordList: List<String>.from(json['KeywordList']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Symbol': symbol,
      'Name': name,
      'sName': sName,
      'NameYomi': nameYomi,
      'NameYomiEn': nameYomiEn,
      'Category': category,
      'MainEx': mainEx,
      'ExInfo': exInfo.map((item) => item.toJson()).toList(),
      'KeywordList': keywordList,
    };
  }
}

class SymbolItem {
  final String symbol;
  final String name;
  final String sName;
  final String nameYomi;
  final String nameYomiEn;
  final String category;
  final String mainEx;
  final List<ExInfo> exInfo;

  SymbolItem({
    required this.symbol,
    required this.name,
    required this.sName,
    required this.nameYomi,
    required this.nameYomiEn,
    required this.category,
    required this.mainEx,
    required this.exInfo,
  });

  factory SymbolItem.fromJson(Map<String, dynamic> json) {
    return SymbolItem(
      symbol: json['Symbol'],
      name: json['Name'],
      sName: json['sName'],
      nameYomi: json['NameYomi'],
      nameYomiEn: json['NameYomiEn'],
      category: json['Category'],
      mainEx: json['MainEx'],
      exInfo: (json['ExInfo'] as List)
          .map((item) => ExInfo.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Symbol': symbol,
      'Name': name,
      'sName': sName,
      'NameYomi': nameYomi,
      'NameYomiEn': nameYomiEn,
      'Category': category,
      'MainEx': mainEx,
      'ExInfo': exInfo.map((item) => item.toJson()).toList(),
    };
  }
}

class ExInfo {
  final String ex;
  final String div;
  final String exName;

  ExInfo({
    required this.ex,
    required this.div,
    required this.exName,
  });

  factory ExInfo.fromJson(Map<String, dynamic> json) {
    return ExInfo(
      ex: json['Ex'],
      div: json['Div'],
      exName: json['ExName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Ex': ex,
      'Div': div,
      'ExName': exName,
    };
  }
}

class KeywordItem {
  final String symbol;
  final List<String> keywordList;

  KeywordItem({
    required this.symbol,
    required this.keywordList,
  });

  factory KeywordItem.fromJson(Map<String, dynamic> json) {
    return KeywordItem(
      symbol: json['Symbol'],
      keywordList: List<String>.from(json['KeywordList']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Symbol': symbol,
      'KeywordList': keywordList,
    };
  }
}
