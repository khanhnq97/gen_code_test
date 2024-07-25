import '../models/stock_item_model.dart';

abstract class RemoteStockDataSource {
  Future<List<StockItemModel>> getStockItems();
}

class MockRemoteStockDataSourceImpl implements RemoteStockDataSource {
  @override
  Future<List<StockItemModel>> getStockItems() async {
    // Giả lập delay của network request
    await Future.delayed(const Duration(seconds: 1));

    // Trả về một danh sách mẫu các stock item
    return [
      StockItemModel(name: 'Apple Inc', symbol: 'AAPL', firstKeyword: 'tech'),
      StockItemModel(
          name: 'Microsoft Corporation',
          symbol: 'MSFT',
          firstKeyword: 'software'),
      StockItemModel(
          name: 'Amazon.com Inc', symbol: 'AMZN', firstKeyword: 'e-commerce'),
      StockItemModel(
          name: 'Google LLC', symbol: 'GOOGL', firstKeyword: 'search'),
      StockItemModel(
          name: 'Facebook Inc', symbol: 'FB', firstKeyword: 'social'),
    ];
  }
}
