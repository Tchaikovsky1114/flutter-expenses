import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;

  const TransactionList({required this.userTransaction, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: userTransaction.isEmpty
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
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: FittedBox(
                        child: Text(
                          '${userTransaction[index].amount}원',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    userTransaction[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              },
              itemCount: userTransaction.length,
            ),
    );
  }
}
