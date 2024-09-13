// File where I will start to create a User Interface
import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
      // creating object having index 0 using Expense class constructor
      title: 'Flutter course',
      amount: 19.99,
      date: DateTime
          .now(), // .now is the constructor function of the class DateTime
      category: Category.work,
    ),
    Expense(
      // creating object having index 1 using Expense class constructor
      title: 'Cinema',
      amount: 15.69,
      date: DateTime
          .now(), // .now is the constructor function of the class DateTime
      category: Category.leisure,
    ),
  ];

  void addRegisteredExpenses(Expense individualExpense) {
    setState(() {
      registeredExpenses.add(individualExpense);
    });
  }

  void removeRegisteredExpense(Expense expense) {
    setState(() {
      registeredExpenses.remove(expense); // remove that particular expense form the registered list of expenses
    });
  }

  void openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return NewExpense(onAddExpense: addRegisteredExpenses);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: registeredExpenses, onRemoveRegisteredExpense: removeRegisteredExpense,)),
        ],
      ),
    );
  }
}
