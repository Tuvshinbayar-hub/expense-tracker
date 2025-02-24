import 'dart:ffi';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/foundation.dart';

class ExpenseBucket {
  ExpenseBucket({required this.expenses});

  final List<Expense> expenses;

  int get totalExpenses {
    int sum = 0;

    for (var expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }

  double getPercentByCategory(category) {
    int categorizedSum = 0;

    for (var expense in expenses) {
      if (expense.category != category) {
        continue;
      }

      categorizedSum += expense.amount;
    }

    return ((categorizedSum / totalExpenses * 1000).round()) / 10;
  }

  int get totalCategoryCount {
    List<ExpenseCategory> categories = [];

    for (var expense in expenses) {
      if (categories.contains(expense.category)) {
        continue;
      }

      categories.add(expense.category);
    }

    return categories.length;
  }
}
