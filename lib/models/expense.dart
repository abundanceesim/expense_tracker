import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id; //could be an int as well
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // final String category; -> this could produce errors in situations where there
  // are typos.
  // the best alternative to this is to use an Enum

  String get formattedDate {
    return formatter.format(date);
  }
}
