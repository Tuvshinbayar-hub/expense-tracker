import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/graph/expense_chart.dart';
import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  const Graph({super.key, required this.expenses});
  final List<Expense> expenses;

  @override
  State<Graph> createState() {
    return _Graph();
  }
}

class _Graph extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ExpenseChart(
        expenses: widget.expenses,
      ),
    );
  }
}
