import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Screens/transactionDetailScreen.dart';

// ignore: camel_case_types
class Transaction_List extends StatelessWidget {
  DateTime dateTime = DateTime.now();
  String title = 'Nothing';
  DateTime firebaseDate = DateTime.now();
  double amount = 0;
  String itemId = 'abc';
  double totleSpent = 0;
  @override
  Widget build(BuildContext context) {
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

    String year = dateTime.year.toString();
    String month = DateFormat.MMM().format(dateTime);
    final mediaQuery = MediaQuery.of(context);
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('year')
            .doc('$year')
            .collection('$month')
            .snapshots(),
        builder: (ctx, streamSnapshort) {
          if (streamSnapshort.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final document = streamSnapshort.data!.docs;
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
                    totleSpent = amount + totleSpent;

                    FirebaseFirestore.instance
                        .doc('totleExpense/$year')
                        .collection('$month')
                        .doc('OXoeJKpuKtuAVpGSYzex')
                        .update({'Spent': '$totleSpent'});

                    void deleteEntry(String id) {
                      FirebaseFirestore.instance
                          .collection('year/$year/$month')
                          .doc(streamSnapshort.data!.docs[index].id)
                          .delete();
                      print(streamSnapshort.data!.docs[index]['Id']);
                    }

                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: InkWell(
                        onTap: () {
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
                                child: FittedBox(child: Text('$amount')),
                              ),
                            ),
                            title: Text(
                              title,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            subtitle: Text(
                              DateFormat.yMMMd().format(
                                firebaseDate,
                              ),
                            ),
                            trailing: mediaQuery.size.width > 460
                                ? FlatButton.icon(
                                    onPressed: () => deleteEntry(itemId),
                                    icon: Icon(Icons.delete),
                                    textColor: Theme.of(context).errorColor,
                                    label: Text('Delete'))
                                : IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Theme.of(context).errorColor,
                                    onPressed: () => deleteEntry(itemId),
                                  )),
                      ),
                    );
                  });
        });
  }
}
