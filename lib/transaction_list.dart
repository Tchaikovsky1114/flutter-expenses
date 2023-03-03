import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTransaction;
  const TransactionList(
      {required this.userTransaction,
      required this.deleteTransaction,
      super.key});
  @override
  Widget build(BuildContext context) {
    return userTransaction.isEmpty
        ? Column(
            children: [
              Text(
                'No transactions added yet',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: FittedBox(
                        child: Text(
                          '${userTransaction[index].amount.toStringAsFixed(0)}원',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    userTransaction[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat.MMMEd().format(userTransaction[index].date),
                  ),
                  trailing: IconButton(
                      onPressed: () =>
                          deleteTransaction(userTransaction[index].id),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ),
              );
            },
            itemCount: userTransaction.length,
          );
  }
}
