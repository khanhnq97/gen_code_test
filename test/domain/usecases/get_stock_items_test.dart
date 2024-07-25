import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/domain/entities/stock_item.dart';
import 'package:test_app/domain/repositories/stock_repository.dart';
import 'package:test_app/domain/usecases/get_stock_items.dart';

class MockStockRepository extends Mock implements StockRepository {}

void main() {
  late GetStockItemsUsecase usecase;
  late MockStockRepository mockStockRepository;

  setUp(() {
    mockStockRepository = MockStockRepository();
    usecase = GetStockItemsUsecase(mockStockRepository);
  });

  final tStockItems = [
    StockItem(name: 'Test Stock', symbol: 'TST', firstKeyword: 'test'),
  ];

  test(
    'should get stock items from the repository',
    () async {
      // arrange
      when(mockStockRepository.getStockItems())
          .thenAnswer((_) async => Right(tStockItems));
      // act
      final result = await usecase();
      // assert
      expect(result, Right(tStockItems));
      verify(mockStockRepository.getStockItems());
      verifyNoMoreInteractions(mockStockRepository);
    },
  );
}
