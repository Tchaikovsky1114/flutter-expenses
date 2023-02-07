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
  List<Transaction> userTransaction = [
    Transaction(
      id: 't2',
      title: 'Ring',
      amount: 58580,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Shoes',
      amount: 49900,
      date: DateTime.now(),
    ),
  ];

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Expenses',
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
                  child: const Text(
                    'CHART',
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
