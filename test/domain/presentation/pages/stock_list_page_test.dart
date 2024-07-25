import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/domain/entities/stock_item.dart';
import 'package:test_app/presentation/bloc/stock_bloc.dart';
import 'package:test_app/presentation/bloc/stock_state.dart';
import 'package:test_app/presentation/pages/stock_list_page.dart';

class MockStockBloc extends Mock implements StockBloc {}

void main() {
  late MockStockBloc mockStockBloc;

  setUp(() {
    mockStockBloc = MockStockBloc();
  });

  testWidgets('renders CircularProgressIndicator when state is StockLoading',
      (WidgetTester tester) async {
    when(mockStockBloc.state).thenReturn(StockLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<StockBloc>.value(
          value: mockStockBloc,
          child: const StockListPage(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders ListView when state is StockLoaded',
      (WidgetTester tester) async {
    final stockItems = [
      StockItem(name: 'Test Stock', symbol: 'TST', firstKeyword: 'test'),
    ];
    when(mockStockBloc.state).thenReturn(StockLoaded(stockItems: stockItems));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<StockBloc>.value(
          value: mockStockBloc,
          child: const StockListPage(),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Test Stock'), findsOneWidget);
    expect(find.text('TST'), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });
}
