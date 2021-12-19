import 'package:flutter/material.dart';

import '../models/Transaction.dart';
import '../widgets/Transaction_List.dart';

class PreviousRecord extends StatefulWidget {
  const PreviousRecord({Key? key}) : super(key: key);

  @override
  _PreviousRecordState createState() => _PreviousRecordState();
}

var colorYear = 2000;
var colorMonth = 'null';

class _PreviousRecordState extends State<PreviousRecord> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New shose',
      ammount: 69.53,
      date: DateTime.now(),
    ),
    Transaction(
        id: 't2',
        title: 'Weekly Groseries',
        ammount: 15.24,
        date: DateTime.now()),
    Transaction(
      id: 't3',
      title: 'Stationary',
      ammount: 30.54,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Clothes',
      ammount: 37.33,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Books',
      ammount: 50.43,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Phone',
      ammount: 70.56,
      date: DateTime.now(),
    ),
  ];
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
    Widget widgetShort(var text) {
      return Center(
        child: Card(
            color:
                colorMonth == '$text' ? Theme.of(context).primaryColor : null,
            margin: EdgeInsets.all(5).subtract(EdgeInsets.only(top: 0)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$text',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w400,
                  color: colorMonth == '$text' ? Colors.white : null,
                ),
              ),
            )),
      );
    }

    return Scaffold(
        appBar: appbar,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Card(
                      color: colorYear == 2018 ? Colors.purple[200] : null,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '2018',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  onTap: () {
                    setState(() {
                      colorYear = 2018;
                    });
                  },
                ),
                GestureDetector(
                  child: Card(
                      color: colorYear == 2019 ? Colors.purple[200] : null,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '2019',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  onTap: () {
                    setState(() {
                      colorYear = 2019;
                    });
                  },
                ),
                GestureDetector(
                  child: Card(
                      color: colorYear == 2020 ? Colors.purple[200] : null,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '2020',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  onTap: () {
                    setState(() {
                      colorYear = 2020;
                    });
                  },
                ),
                GestureDetector(
                  child: Card(
                      color: colorYear == 2021 ? Colors.purple[200] : null,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '2021',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  onTap: () {
                    setState(() {
                      colorYear = 2021;
                    });
                  },
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    child: widgetShort('Jan'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Jan';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Feb'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Feb';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Mar'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Mar';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Apr'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Apr';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('May'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'May';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Jun'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Jun';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Jul'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Jul';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Agu'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Agu';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Sep'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Sep';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Oct'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Oct';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Nov'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Nov';
                      });
                    },
                  ),
                  GestureDetector(
                    child: widgetShort('Dec'),
                    onTap: () {
                      setState(() {
                        colorMonth = 'Dec';
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                  height: (MediaQuery.of(context).size.height -
                          appbar.preferredSize.height -
                          MediaQuery.of(context).padding.top -
                          13) *
                      0.7,
                  child:
                      Transaction_List(_userTransaction, _deleteTransaction)),
            ),
          ],
        ));
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }
}
