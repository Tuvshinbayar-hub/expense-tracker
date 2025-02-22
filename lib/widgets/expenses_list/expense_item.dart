import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Column(
            children: [
              Row(
                children: [
                  Text(expense.title),
                ],
              ),
              Row(
                children: [
                  Text('T${expense.amount.toString()}'),
                  Spacer(),
                  expense.icon,
                  SizedBox(
                    width: 8,
                  ),
                  Text(expense.date.toString().split(' ')[0])
                ],
              )
            ],
          )),
    );
  }
}
