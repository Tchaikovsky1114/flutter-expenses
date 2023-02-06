import 'package:expenses/new_transaction.dart';
import 'package:expenses/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
// import 'package:timezone/standalone.dart' as tz1;

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  // final detroit = tz1.getLocation('Asia/Seoul');
  // final localizeDate = tz1.TZDateTime.from(DateTime.now(), detroit);

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

  void addNewTransaction(String txTitle, double amount) {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NewTransaction(
            addTransactionHandler: addNewTransaction,
          ),
          TransactionList(
            userTransaction: userTransaction,
          ),
        ],
      ),
    );
  }
}
