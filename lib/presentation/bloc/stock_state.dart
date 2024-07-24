import 'package:equatable/equatable.dart';

import '../../domain/entities/stock_item.dart';

abstract class StockState extends Equatable {
  @override
  List<Object> get props => [];
}

class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<StockItem> stockItems;

  StockLoaded({required this.stockItems});

  @override
  List<Object> get props => [stockItems];
}

class StockError extends StockState {
  final String message;

  StockError({required this.message});

  @override
  List<Object> get props => [message];
}
