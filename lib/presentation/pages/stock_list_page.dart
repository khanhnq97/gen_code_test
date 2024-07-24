import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stock_bloc.dart';
import '../bloc/stock_event.dart';
import '../bloc/stock_state.dart';
import '../widgets/stock_item_widget.dart';

class StockListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock List'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<StockBloc>(context).add(GetStockItemsEvent());
            },
          ),
        ],
      ),
      body: BlocBuilder<StockBloc, StockState>(
        builder: (context, state) {
          if (state is StockInitial) {
            BlocProvider.of<StockBloc>(context).add(GetStockItemsEvent());
            return Center(child: CircularProgressIndicator());
          } else if (state is StockLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is StockLoaded) {
            return ListView.builder(
              itemCount: state.stockItems.length,
              itemBuilder: (context, index) {
                return StockItemWidget(stockItem: state.stockItems[index]);
              },
            );
          } else if (state is StockError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
