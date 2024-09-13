// Here I discribe that which data structre and Expence in this app should have.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final DateFormat formatter = DateFormat.yMd(); // yMd() is method_of_DateFormat_class so called Factory_method_of_DateFormat_class | Factory methods can never be const

const Uuid uuid = Uuid(); // Uuid() is the constructor call to create a new instance of Uuid class

enum Category { food, travel, leisure, work } // Category.food, Category.travel, Category.leisure, Category.work => These are const instance of that enum + these are also act as const keys in the map 

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
      : id = uuid.v4(); // instance_of_Uuid.method_of_Uuid_class

  final String id; // id will hold the reference to an object of type String
  final String title; // title will hold the reference to an object of type String
  final double amount; // amount will hold the referencce to an object of type double 
  final DateTime date; // date will hold the reference to an object of type DateTime
  final Category category; //category will hold the referene of an object of type Category, where 'Category' is an enum or simply 'Category' enum

  String get formattedDate {
    return formatter.format(date); // instance_of_DateFormat.method_of_DateFormat | return formatter.format(DateTime.now())
  }
}


// format(date) -> return formatted version of the date as a string.



