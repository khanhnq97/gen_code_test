import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_stock_items.dart';
import 'stock_event.dart';
import 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStockItemsUsecase getStockItems;

  StockBloc({required this.getStockItems}) : super(StockInitial()) {
    on<GetStockItemsEvent>((event, emit) async {
      emit(StockLoading());
      final failureOrStockItems = await getStockItems();
      failureOrStockItems.fold(
        (failure) => emit(StockError(message: 'Failed to load stock items')),
        (stockItems) => emit(StockLoaded(stockItems: stockItems)),
      );
    });
  }
}
