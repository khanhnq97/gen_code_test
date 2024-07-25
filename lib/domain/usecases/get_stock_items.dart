import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/stock_item.dart';
import '../repositories/stock_repository.dart';

class GetStockItemsUsecase {
  final StockRepository repository;

  GetStockItemsUsecase(this.repository);

  Future<Either<Failure, List<StockItem>>> call() async {
    return await repository.getStockItems();
  }
}
