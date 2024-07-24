import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/stock_item.dart';
import '../../domain/repositories/stock_repository.dart';
import '../datasources/local_stock_data_source.dart';
import '../datasources/remote_stock_data_source.dart';

class StockRepositoryImpl implements StockRepository {
  final LocalStockDataSource localDataSource;
  final RemoteStockDataSource remoteDataSource;

  StockRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<StockItem>>> getStockItems() async {
    try {
      final localStockItems = await localDataSource.getStockItems();
      return Right(localStockItems);
    } on CacheException {
      try {
        final remoteStockItems = await remoteDataSource.getStockItems();
        await localDataSource.cacheStockItems(remoteStockItems);
        return Right(remoteStockItems);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }
}
