import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        child: Text(
                          userTransaction[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${(userTransaction[index].amount).toInt()}원',
                            style:
                                Theme.of(context).primaryTextTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            DateFormat('yy년 MM월 dd일 HH:mm')
                                .format(userTransaction[index].date),
                            style:
                                Theme.of(context).primaryTextTheme.titleSmall,
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: userTransaction.length,
            ),
    );
  }
}
