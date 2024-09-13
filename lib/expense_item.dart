import 'package:flutter/material.dart';

import 'package:expense_tracker/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense; // final class_name class_object_from_List_in_expenses

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,48,20,20,
        ),
        child: Column(children: <Widget>[
          Text(expense.title),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: <Widget>[
              Text('\$${expense.amount.toStringAsFixed(2)}'), // class_obj.class_property.function()
              const Spacer(),
              Row(
                children: <Widget>[
                  Icon(categoryIcons[expense.category]), // List_name [indexWise_object.Category_enum] -> De-Referencing 
                  const SizedBox(width: 8),
                  Text(expense.formattedDate),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}



//child: Text(expense.title),

//Text(expense.date.toString()), -> obj_of_expense_class_from_expenses_list.date