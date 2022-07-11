import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  /*The curly braces in the constructor parameters 
    signifies named parameters and they are by default
    optional parameters which are declared as :-
    <data type>? <variable name> 
    therefore the "required" keyword is a must while using
    the curly braces */

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
