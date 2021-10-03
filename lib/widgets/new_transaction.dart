import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  void submitTransaction() {
    final enteredAmount = double.parse(amountController.text);
    final enteredTitle = titleController.text;
    if(enteredTitle.isEmpty || enteredAmount<=0) {
      return;
    }

    widget.addTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTransaction(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitTransaction,
            )
          ],
        ),
      ),
    );
  }
}
