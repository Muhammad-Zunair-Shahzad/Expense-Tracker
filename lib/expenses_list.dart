import 'package:flutter/material.dart';

import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onRemoveRegisteredExpense});

  final List<Expense> expenses; // registeredExpences
  final void Function(Expense expense) onRemoveRegisteredExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            // direction above is useless paramter 
            onRemoveRegisteredExpense(expenses[index]);
          },
          child: ExpenseItem(
              expenses[index])), // Each index points to 1 Map at a time
    );
  }
}

// itemBuilder: (ctx, index) => Text(expenses[index].title)
