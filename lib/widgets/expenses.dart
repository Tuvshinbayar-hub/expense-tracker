import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> dummyExpenses = [
    Expense("Groceries", 100000, DateTime.now(), Category.food),
    Expense("Body scan", 500000, DateTime.now(), Category.health)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: ExpenseList(expenses: dummyExpenses))],
      ),
    );
  }
}
