import 'package:expenses/models/transaction.dart';
import 'package:expenses/new_transaction.dart';
import 'package:expenses/transaction_list.dart';
import 'package:flutter/material.dart';

import 'package:timezone/data/latest.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transaction> userTransaction = [];

  void _addNewTransaction(String txTitle, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      userTransaction.add(newTx);
    });
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
          ),
          fontFamily: 'Wandohope'),
      home: Scaffold(
        appBar: AppBar(
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
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.blue.shade600,
                  elevation: 5,
                  child: Text(
                    'CHART',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              TransactionList(userTransaction: userTransaction)
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
