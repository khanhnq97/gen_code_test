import 'package:flutter/material.dart';

import '../../domain/entities/stock_item.dart';

class StockItemWidget extends StatelessWidget {
  final StockItem stockItem;

  const StockItemWidget({Key? key, required this.stockItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(stockItem.name),
      subtitle: Text(stockItem.symbol),
      trailing: Text(stockItem.firstKeyword),
    );
  }
}
