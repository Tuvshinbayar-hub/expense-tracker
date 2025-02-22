import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum ExpenseCategory {
  food,
  rent,
  education,
  leisure,
  investment,
  health,
  gift
}

const icons = {
  ExpenseCategory.education: Icons.cast_for_education,
  ExpenseCategory.food: Icons.food_bank,
  ExpenseCategory.gift: Icons.card_giftcard,
  ExpenseCategory.health: Icons.medical_information,
  ExpenseCategory.investment: Icons.money,
  ExpenseCategory.leisure: Icons.movie,
  ExpenseCategory.rent: Icons.house
};

class Expense {
  Expense(this.title, this.amount, this.date, this.category) : id = uuid.v4();
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final ExpenseCategory category;
  Icon get icon {
    return Icon(icons[category]);
  }
}
