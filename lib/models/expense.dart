import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, rent, education, leisure, investment, health }

class Expense {
  Expense(this.title, this.amount, this.date, this.category) : id = uuid.v4();
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final Category category;
}
