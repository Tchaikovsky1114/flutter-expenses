import 'package:expenses/chart.dart';
import 'package:expenses/models/transaction.dart';
import 'package:expenses/new_transaction.dart';
import 'package:expenses/transaction_list.dart';
import 'package:flutter/material.dart';

import 'package:timezone/data/latest.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transaction> userTransaction = [];

  void _addNewTransaction(String txTitle, double amount, DateTime date) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: amount,
      date: date,
    );
    setState(() {
      userTransaction.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  List<Transaction> get _recentTransaction {
    return userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(addTransactionHandler: _addNewTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        'Expenses',
        style: TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            onPressed: () => _startAddNewTransaction(context),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              size: 24,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
    return MaterialApp(
      title: 'Expenses',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontFamily: 'Wandohope',
                fontSize: 32,
              ),
              actionsIconTheme: IconThemeData(
                size: 42,
              )),
          primarySwatch: Colors.amber,
          primaryColor: Colors.pink.shade400,
          primaryColorDark: Colors.deepPurple.shade600,
          primaryTextTheme: TextTheme(
            titleMedium: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 12,
              fontFamily: 'Quicksand',
            ),
            labelLarge: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          fontFamily: 'Wandohope'),
      home: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        appBar.preferredSize.height) *
                    0.4,
                child: Chart(_recentTransaction),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        appBar.preferredSize.height) *
                    0.6,
                child: TransactionList(
                  userTransaction: userTransaction,
                  deleteTransaction: _deleteTransaction,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                  onPressed: () => _startAddNewTransaction(context),
                  child: const Icon(Icons.add),
                )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
