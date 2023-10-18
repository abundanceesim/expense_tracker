import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense({   
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }): id = uuid.v4();

  final String id; //could be an int as well
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // final String category; -> this could produce errors in situations where there
  // are typos.
  // the best alternative to this is to use an Enum
}
