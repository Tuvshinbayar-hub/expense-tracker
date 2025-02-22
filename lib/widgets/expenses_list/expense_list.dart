import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onDelete});
  final List<Expense> expenses;

  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withAlpha(100),
            margin: EdgeInsets.symmetric(
                vertical: Theme.of(context).cardTheme.margin!.vertical / 2),
            child: Icon(
              Icons.delete_forever,
              size: 50,
            ),
          ),
          onDismissed: (direction) {
            onDelete(expenses[index]);
          },
          key: ValueKey(expenses[index]),
          child: ExpenseItem(expense: expenses[index])),
    );
  }
}
