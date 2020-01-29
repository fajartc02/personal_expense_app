import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    print(enteredTitle);
    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addNewTransaction(
      enteredTitle,
      enteredAmount
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onSubmitted for when you completed in keyboard enter this function will executed, REMEMBER USE (_) => fn() WITH INVOKE
              onSubmitted: (_) => submitData(),
              // we can added onChange for stream TextField
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // controller will make your code clean, becasue you don't need declare func. on yout widget
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
              // DONT you using invoked in onPressed because your fn direct to executed
              onPressed: submitData
              // () {
              //   // titleController will be render title input changes
              //   // print(titleController.text);
              //   // addNewTransaction(titleController.text, double.parse(amountController.text));
              //   // print(titleInput);
              //   // print(amountInput);
              // },
            )
          ],
        ),
      ),
    );
  }
}
