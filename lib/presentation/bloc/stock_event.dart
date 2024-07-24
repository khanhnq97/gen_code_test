import 'package:equatable/equatable.dart';

abstract class StockEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetStockItemsEvent extends StockEvent {}
