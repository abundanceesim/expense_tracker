import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
// Obj list from Expense model
  final List<Expense> _registeredExpenses = [
    // Expense(
    //   title: 'Flutter Course',
    //   amount: 19.99,
    //   date: DateTime.now(), //current date-time
    //   category: Category.work,
    // ),
    // Expense(
    //   title: 'Cinema',
    //   amount: 15.69,
    //   date: DateTime.now(),
    //   category: Category.leisure,
    // ),
  ];

  void _openAddExpenseOverlay() {
    // ctx is the context for just the ModalBottomSheet,
    // context is the context for the main widget in this class.
    showModalBottomSheet(
        // make modal open in fullscreen.
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  // void _addExpense(expenseData) {
  //   final newExpense = Expense(
  //       title: expenseData['title'],
  //       amount: expenseData['amount'],
  //       date: expenseData['date'], category: expenseData['category']);
  //   setState(() {
  //   _registeredExpenses.add(newExpense);

  //   });
  // }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No expenses found. Please an expense to get started.'));

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), actions: [
        IconButton(
            onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
      ]),
      body: Column(children: [
        const Text('Chart'),
        Expanded(
          child: mainContent
        )
      ]),
    );
  }
}
