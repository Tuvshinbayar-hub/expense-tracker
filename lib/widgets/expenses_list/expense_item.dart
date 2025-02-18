import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(expense.title),
          Text(expense.amount.toString()),
          Text(expense.category.toString()),
          Text(expense.date.toString().split(' ')[0])
        ],
      ),
    );
  }
}
