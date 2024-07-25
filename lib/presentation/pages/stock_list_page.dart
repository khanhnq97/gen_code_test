import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stock_bloc.dart';
import '../bloc/stock_event.dart';
import '../bloc/stock_state.dart';
import '../widgets/stock_item_widget.dart';

class StockListPage extends StatelessWidget {
  const StockListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<StockBloc>(context).add(GetStockItemsEvent());
            },
          ),
        ],
      ),
      body: BlocBuilder<StockBloc, StockState>(
        buildWhen: (previousState, state) {
          // return true/false to determine whether or not
          // to rebuild the widget with state
          // if (state is StockInitial) {
          //   return true;
          // } else if (state is StockLoading) {
          //   return true;
          // } else if (state is StockLoaded) {
          //   return true;
          // } else if (state is StockError) {
          //   return true;
          // }
          // return false;
          return previousState != state;
        },
        builder: (context, state) {
          if (state is StockInitial) {
            BlocProvider.of<StockBloc>(context).add(GetStockItemsEvent());
            return const Center(child: CircularProgressIndicator());
          } else if (state is StockLoading) {
            return const Center(child: CircularProgressIndicator());
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
