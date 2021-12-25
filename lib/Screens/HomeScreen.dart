import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/widgets/new_Income.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? netIncome = 0;
  double? spentIncome;

  void _netIncomeFunction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: newIncome(_addNewIncome),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  DateTime dateTime = DateTime.now();

  void _addNewIncome(double netAmount) {
    String year = dateTime.year.toString();
    String month = DateFormat.MMM().format(dateTime);
    FirebaseFirestore.instance
        .doc('totleExpense/$year')
        .collection('$month')
        .doc('OXoeJKpuKtuAVpGSYzex')
        .update({'Net_Income': '$netAmount'});
  }

  @override
  Widget build(BuildContext context) {
    String year = dateTime.year.toString();
    String month = DateFormat.MMM().format(dateTime);
    @override
    final appbar = AppBar(
      title: Text(
        'Home Screen',
        style: TextStyle(
          fontFamily: 'OpenSans',
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: DrawerHeader(
                child: Text('Personal Expenditure'),
              ),
            ),
            ListTile(
              title: Text('Report'),
            )
          ],
        ),
      ),
      appBar: appbar,
      body:
          //  StreamBuilder<QuerySnapshot>(
          //   stream: FirebaseFirestore.instance
          //       .collection('expense/q2e97MRvrXpe0fpW2RqT/Net_Income')
          //       .snapshots(),
          //   builder: (ctx, streamSnapshort) {
          //     if (streamSnapshort.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     final document = streamSnapshort.data!.docs;
          //     return ListView.builder(
          //       itemCount: document.length,
          //       itemBuilder: (ctx, index) {
          //         return Container(
          //           padding: EdgeInsets.all(8),
          //           child: Text(document[index]['text']),
          //         );
          //       },
          //     );
          //   },
          // ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('totleExpense/$year/$month')
                  .snapshots(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                netIncome = (double.parse(
                    streamSnapshot.data?.docs.cast()[0]['Net_Income']));
                spentIncome = (double.parse(
                    streamSnapshot.data?.docs.cast()[0]['Spent']));
                double remaining = double.parse(
                    (netIncome! - spentIncome!).toStringAsFixed(2));
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text('$spentIncome',
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.black54,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'You spent 45%  Income',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black38,
                              fontFamily: 'OpenSans'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: (MediaQuery.of(context).size.height -
                                    appbar.preferredSize.height -
                                    MediaQuery.of(context).padding.top) *
                                0.2,
                            child: Card(
                              elevation: 6,
                              margin: EdgeInsets.all(13),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_downward,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Net Income',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black38,
                                                  fontFamily: 'OpenSans'),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('$netIncome',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black54,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: (MediaQuery.of(context).size.height -
                                    appbar.preferredSize.height -
                                    MediaQuery.of(context).padding.top) *
                                0.2,
                            child: Card(
                              elevation: 6,
                              margin: EdgeInsets.all(13),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_downward,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Remainings',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black38,
                                                  fontFamily: 'OpenSans'),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('$remaining',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black54,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          // DateTime dateTime = DateTime.now();
          // print(DateFormat.MMM().format(dateTime));
          var some = FirebaseFirestore.instance
              .collection('totleExpense')
              .doc('2021')
              .collection('Dec')
              .doc('OXoeJKpuKtuAVpGSYzex')
              .snapshots()
              .listen((event) {
            event.get('Net_Income');
          });

          print(some);
          _netIncomeFunction(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
