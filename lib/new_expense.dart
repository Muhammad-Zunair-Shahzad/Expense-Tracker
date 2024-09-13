// Call inside expense.dart
import 'package:flutter/material.dart';
import 'package:expense_tracker/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final textController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedItem = Category.food;

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    amountController.dispose();
  }

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day - 1);

    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    setState(() {
      selectedDate = pickedDate;
    });
  }

  void closeModalManually() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: textController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                    
                  ),
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
                    Text(selectedDate == null
                        ? 'No Date Selected'
                        : formatter.format(selectedDate!)),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              DropdownButton(
                  items: Category.values.map((singleCategory) {
                    return DropdownMenuItem(
                      value: singleCategory,
                      child: Text(
                        singleCategory.name.toUpperCase(),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      selectedItem = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: closeModalManually,
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  // bs ye kam kr rha hai is liyay print krwa rha hu or kuch bhi nhi kr rha hhai abhi ye
                  print(textController.text);
                  print(amountController.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
