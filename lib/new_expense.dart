// Call inside expense.dart
import 'package:flutter/material.dart';
import 'package:expense_tracker/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense individualObject) onAddExpense;
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

  void submmitExpenseData() {
    final enteredAmount = double.tryParse(amountController.text);
    final amountIsInvalid = enteredAmount == null ||
        enteredAmount <=
            0; // -c  amountIsInvalid: currently (True), data is invalid

    if (textController.text.trim().isEmpty ||
        selectedDate == null ||
        amountIsInvalid) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please make sure a valid title, date and category was entered'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Okay'))
                ],
              ));
      return;
    }

    widget.onAddExpense(Expense(
        title: textController.text,
        amount: enteredAmount,
        date: selectedDate!,
        category: selectedItem));

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
                  value:
                      selectedItem, // Add this line to show the selected item on screen
                  items: Category.values.map((singleCategory) {
                    //-c  singleCategory : Category.food, Category.leisure .......
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
                onPressed: submmitExpenseData,
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
