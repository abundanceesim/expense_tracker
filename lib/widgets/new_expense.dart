import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _presentDatePicker(){
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1, now.day);
    showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text('Title')),
        ),
        Row(
          children: [
            Expanded(
              //need Expanded here cause TextField is like a Row and stuff would be messed up
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: const InputDecoration(
                    label: Text('Amount'), prefixText: '\$ '),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Selected Date'),
                  IconButton(
                      onPressed: _presentDatePicker, icon: const Icon(Icons.calendar_month))
                ],
            ))
          ],
        ),
        Row(
          children: [
            TextButton(
                onPressed: () => {Navigator.pop(context)},
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () => {
                      print(_titleController.text),
                      print(_amountController.text)
                    },
                child: const Text('Save Expense')),
          ],
        )
      ]),
    );
  }
}
