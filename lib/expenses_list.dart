import 'package:flutter/material.dart';

import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses; // registeredExpences

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => ExpenseItem(expenses[index]), // Each index points to 1 Map at a time
    );

  }
}
 
// itemBuilder: (ctx, index) => Text(expenses[index].title)
