import 'package:flutter/material.dart';

// ignore: camel_case_types
class newIncome extends StatefulWidget {
  final Function addTx;

  newIncome(this.addTx);

  @override
  _newIncomeState createState() => _newIncomeState();
}

// ignore: camel_case_types
class _newIncomeState extends State<newIncome> {
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _submitData() {
      if (_amountController.text.isEmpty) {
        return;
      }
      // ignore: unused_local_variable
      final enteredTitle = _amountController.text;
      final enteredAmount = double.parse(_amountController.text);
      if (_amountController.text.isEmpty || enteredAmount <= 0) {
        return;
      }
      widget.addTx(
        enteredAmount,
      );
      Navigator.of(context).pop();
    }

    // void _presentDatePicker() {
    //   showDatePicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(2021),
    //     lastDate: DateTime.now(),
    //   ).then((pickerDate) {
    //     if (pickerDate == null) {
    //       return;
    //     }
    //     setState(() {
    //       _selectedDate = pickerDate;
    //     });
    //   });
    // }

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
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_money),
                    labelText: 'New Net Income'),
                controller: _amountController,

                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add Net Income'),
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
