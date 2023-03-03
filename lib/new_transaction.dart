import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  const NewTransaction({
    required this.addTransactionHandler,
    super.key,
  });

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  dynamic _selectedDate;
  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty) return;
    widget.addTransactionHandler(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2099))
        .then((pickedDate) {
      if (pickedDate == null) {
        return _selectedDate = null;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: 400,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              cursorWidth: 10,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              keyboardType: TextInputType.name,
            ),
            TextField(
              cursorWidth: 10,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? '날짜를 선택하지 않으셨습니다.'
                        : DateFormat.yMd().format(_selectedDate),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      '[날짜 선택]',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.pinkAccent.shade200),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
                elevation: 5,
              ),
              onPressed: _submitData,
              child: Text(
                '추가',
                style: Theme.of(context).primaryTextTheme.labelLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
