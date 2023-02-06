import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransactionHandler;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({
    required this.addTransactionHandler,
    super.key,
  });

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty) return;
    addTransactionHandler(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              cursorWidth: 10,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              keyboardType: TextInputType.name,
            ),
            TextField(
              cursorWidth: 10,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
                onPressed: submitData,
                child: const Text(
                  '추가',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
