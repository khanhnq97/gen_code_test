import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/stock_item.dart';

abstract class StockRepository {
  Future<Either<Failure, List<StockItem>>> getStockItems();
}
