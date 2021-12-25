// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/DataStoreModels.dart';

DataStoreModels dsm = DataStoreModels();

// ignore: camel_case_types
class new_Transaction extends StatefulWidget {
  final Function addTx;

  new_Transaction(this.addTx);

  @override
  _new_TransactionState createState() => _new_TransactionState();
}

// ignore: camel_case_types
class _new_TransactionState extends State<new_Transaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void _submitData() {
      if (_titleController.text.isEmpty) {
        return;
      }
      final enteredTitle = _titleController.text;
      final enteredAmount = double.parse(_amountController.text);
      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      }
      DataStoreModels().insertData(enteredTitle, enteredAmount, selectedDate);
      widget.addTx(
        enteredTitle,
        enteredAmount,
        selectedDate,
      );
      Navigator.of(context).pop();
    }

    void _presentDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
      ).then((pickerDate) {
        if (pickerDate == null) {
          return;
        }
        setState(() {
          selectedDate = pickerDate;
        });
      });
    }

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.title), labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_money), labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Text(
                      selectedDate == null
                          ? 'No Date Chosen!'
                          : DateFormat.yMd().format(selectedDate),
                    ),
                    // FlatButton(
                    //   textColor: Theme.of(context).primaryColor,
                    //   onPressed: _presentDatePicker,
                    //   child: Text(
                    //     'Choose Date',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add Transecion'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
