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
  int? removedExpenseIndex;
  Expense? removedExpense;

  SnackBar get snackBar {
    final snackBar = SnackBar(
      content: Text("You've deleted an expense"),
      action: SnackBarAction(label: 'Undo', onPressed: _undoDelete),
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
    _registerDeletedExpense(expense);
    _deleteExpenseData(expense);
    _showSnackBar();
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _registerDeletedExpense(expense) {
    removedExpenseIndex = expensesData.indexOf(expense);
    removedExpense = expense;
  }

  void _undoDelete() {
    setState(() {
      if (removedExpense == null || removedExpenseIndex == null) {
        return;
      }
      expensesData.insert(removedExpenseIndex!, removedExpense!);
    });
  }

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
          Graph(
            expenses: expensesData,
          ),
          SizedBox(
            height: 4,
          ),
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
