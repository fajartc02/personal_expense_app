import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final transactions = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
      return Card(
        child: Row(
          children: <Widget>[
            // .toSting is using for convert double to string or others!
            Container(
              child: Text(
                // tx.amount.toString(),
                // string interpolation, \$ is not interpolation but string
                '\$${tx.amount}',
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.purple)),
              padding: EdgeInsets.all(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tx.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  // tx.date.toString(),
                  // this from module intl from pub.dev
                  // DateFormat('yyyy/MM/dd').format(tx.date),
                  DateFormat.yMMMd().format(tx.date),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }).toList());
  }
}
