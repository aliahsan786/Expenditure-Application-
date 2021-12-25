import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Screens/transactionDetailScreen.dart';

import '../models/Transaction.dart';
import '../widgets/Transaction_List.dart';

class PreviousRecord extends StatefulWidget {
  const PreviousRecord({Key? key}) : super(key: key);

  @override
  _PreviousRecordState createState() => _PreviousRecordState();
}

class _PreviousRecordState extends State<PreviousRecord> {
  String title = 'Nothing';
  DateTime firebaseDate = DateTime.now();
  double amount = 0;
  String itemId = 'abc';
  String _monthSelectedValue = 'Jan';
  String _yearSelectedValue = '2018';

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        'Complete Report',
        style: TextStyle(
          fontFamily: 'OpenSans',
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
    final monthName = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final year = <String>[
      '2018',
      '2019',
      '2020',
      '2021',
    ];

    final List<DropdownMenuItem<String>> _dropDownMonthItems = monthName
        .map(
          (String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(fontWeight: FontWeight.normal)),
          ),
        )
        .toList();

    final List<DropdownMenuItem<String>> _dropDownYearItems = year
        .map(
          (String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(fontWeight: FontWeight.normal)),
          ),
        )
        .toList();
    Widget emptyList() {
      return LayoutBuilder(builder: (ctx, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'No Transaction yet!...',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'images/waiting.png',
                  fit: BoxFit.cover,
                )),
          ],
        );
      });
    }

    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Select Year :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            trailing: DropdownButton<String>(
              value: _yearSelectedValue,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _yearSelectedValue = newValue;
                  });
                  print('$_yearSelectedValue $newValue');
                }
              },
              items: _dropDownYearItems,
            ),
          ),
          ListTile(
            title: Text(
              'Enter Month:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            trailing: DropdownButton<String>(
              value: _monthSelectedValue,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() => _monthSelectedValue = newValue);
                  print('$_yearSelectedValue $newValue ');
                }
              },
              items: _dropDownMonthItems,
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('year')
                  .doc('$_yearSelectedValue')
                  .collection('$_monthSelectedValue')
                  .snapshots(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final document = snapshot.data!.docs;
                return document.length == 0
                    ? emptyList()
                    : ListView.builder(
                        itemCount: document.length,
                        itemBuilder: (ctx, index) {
                          title = document[index]['title'];
                          amount = document[index]['Amount'];
                          DateTime firebaseDate = DateTime.parse(
                              (document[index]['Date']).toDate().toString());
                          itemId = document[index]['Id'];

                          return Column(
                            children: [
                              Row(
                                children: [],
                              ),
                              Card(
                                elevation: 5,
                                margin: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 5,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // print(totelAmount);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return TransactionDetailScreen(
                                          title, amount, firebaseDate);
                                    }));
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        child:
                                            FittedBox(child: Text('$amount')),
                                      ),
                                    ),
                                    title: Text(
                                      title,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    subtitle: Text(
                                      DateFormat.yMMMd().format(
                                        firebaseDate,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
              },
            ),
          ),
        ],
      ),
    );
  }
}
