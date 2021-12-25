import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  DateTime dateTime = DateTime.now();
  String title = 'Nothing';
  DateTime? firebaseDate;
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    String year = dateTime.year.toString();
    String month = DateFormat.MMM().format(dateTime);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
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
          return ListView.builder(
            itemCount: document.length,
            itemBuilder: (ctx, index) {
              title = document[index]['title'];
              amount = document[index]['Amount'];

              DateTime frebaseDate =
                  DateTime.parse((document[index]['Date']).toDate().toString());

              return ListTile(
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
                    frebaseDate,
                  ),
                ),
                // trailing: mediaQuery.size.width > 460
                //     ? FlatButton.icon(
                //         onPressed: () => deleteTx(transaction[index].id),
                //         icon: Icon(Icons.delete),
                //         textColor: Theme.of(context).errorColor,
                //         label: Text('Delete'))
                //     : IconButton(
                //         icon: Icon(Icons.delete),
                //         color: Theme.of(context).errorColor,
                //         onPressed: () => deleteTx(transaction[index].id),
                //       )
              );
            },
          );
        },
      ),
    );
  }
}
