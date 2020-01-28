// import foundation this for able the foundation
import 'package:flutter/foundation.dart';

// model for transaction remember this just blueprint
class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id, 
    @required this.title, 
    @required this.amount, 
    @required this.date
  });
}
