import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  // this for containing parsing data from user_transactions
  final List<Transaction> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        // ListView will render All list
        // ListView.builder() will render visible list
        // this IMPACT TO PERFORMANCE APPS
        // Please implement ListView in Container
        child: ListView.builder(
          // ctx is shortcut for BuildContext context
          itemBuilder: (BuildContext context, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  // .toSting is using for convert double to string or others!
                  Container(
                    child: Text(
                      // tx.amount.toString(),
                      // string interpolation, \$ is not interpolation but string
                      // toStringAsFixed will round your value NOTE: you can use another function for cond
                      '\$${transactions[index].amount.toStringAsFixed(2)}',
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
                        transactions[index].title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        // transactions[index].date.toString(),
                        // this from module intl from pub.dev
                        // DateFormat('yyyy/MM/dd').format(transactions[index].date),
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactions.length,
        )
        // SingleChildScrollView(
        //   child: Column(
        //       children: transactions.map((tx) {

        //   }).toList()),
        // ),
        );
  }
}
