import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  // make getter for conditional function
  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      // substract is fungction for count total of a week
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
        // print(recentTransaction[i].date.day);
        // print(weekDay);
      }

      // print('=====DateTime====');
      // print(DateTime.now().toString());
      // print('=====DateTimeSubstract====');
      // print(DateTime.now().subtract(Duration(days: index)).toString());
      // print('=====DateFormat====');
      // print(DateFormat.E().format(weekDay));
      // print('=====TotalSum====');
      // print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValue.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValue.map((data) {
            // return Text('${data['day']} : ${data['amount']}');
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      )),
    );
  }
}
