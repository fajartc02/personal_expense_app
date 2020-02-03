import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  // make getter for conditional function
  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      // substract is fungction for -- date from now
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      
      print('=====DateTime====');
      print(DateTime.now().toString());
      print('=====DateTimeSubstract====');
      print(DateTime.now().subtract(Duration(days: index)).toString());
      print('=====DateFormat====');
      print(DateFormat.E().format(weekDay));
      print('=====TotalSum====');
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);
    return Card(
      elevation: 6,
      child: Container(
          child: Row(
        children: <Widget>[],
      )),
    );
  }
}
