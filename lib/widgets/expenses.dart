import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_creator.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/widgets/graph.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expensesData = [
    Expense("Groceries", 100000, DateTime.now(), ExpenseCategory.food),
    Expense("Body scan", 500000, DateTime.now(), ExpenseCategory.health),
    Expense("Birthday gift", 200000, DateTime.now(), ExpenseCategory.gift),
    Expense("New books", 500000, DateTime.now(), ExpenseCategory.education),
  ];

  SnackBar showSnackBar() {
    final snackBar = SnackBar(
      content: Text('test'),
      action: SnackBarAction(label: 'Undo', onPressed: () {}),
    );

    return snackBar;
  }

  void addNewExpenseItem() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => ExpenseCreator(onSave: _addNewExpenseData));
  }

  void _addNewExpenseData(Expense newExpense) {
    setState(() {
      expensesData.add(newExpense);
    });
  }

  void _onDelete(Expense expense) {
    _deleteExpenseData(expense);
  }

  void _showSnackBar() {}

  void _deleteExpenseData(Expense expense) {
    setState(() {
      expensesData.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: addNewExpenseItem, icon: Icon(Icons.add_box_rounded))
        ],
      ),
      body: Column(
        children: [
          Graph(),
          Expanded(
            child: ExpenseList(
              expenses: expensesData,
              onDelete: _onDelete,
            ),
          )
        ],
      ),
    );
  }
}
