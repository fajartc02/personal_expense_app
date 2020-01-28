import 'package:flutter/material.dart';

import '../models/transaction.dart';

import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  // <Transaction> adalah blueprint untuk membuat transaction Object
  // DUMMY Transactions
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1', title: 'New Shoes', amount: 59.99, date: DateTime.now()
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          NewTransaction(), 
          TransactionsList()
        ],
      ),
    );
  }
}
