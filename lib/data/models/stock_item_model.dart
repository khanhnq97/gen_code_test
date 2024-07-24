import '../../domain/entities/stock_item.dart';

class StockItemModel extends StockItem {
  StockItemModel({
    required String name,
    required String symbol,
    required String firstKeyword,
  }) : super(name: name, symbol: symbol, firstKeyword: firstKeyword);

  factory StockItemModel.fromJson(Map<String, dynamic> json) {
    return StockItemModel(
      name: json['name'],
      symbol: json['symbol'],
      firstKeyword: (json['keywordList'] as List<String>).isNotEmpty
          ? json['keywordList'][0]
          : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'symbol': symbol,
      'keywordList': [firstKeyword],
    };
  }
}
