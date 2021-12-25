// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:myapp/Screens/transactionDetailScreen.dart';

// class RecordList extends StatelessWidget {
//   var colorYear;
//   var colorMonth;
//   final Widget emptyList;
//   RecordList(this.colorYear, this.colorMonth, this.emptyList);
//   @override
//   Widget build(BuildContext context) {
//     String title = 'Nothing';
//     DateTime firebaseDate = DateTime.now();
//     double amount = 0;
//     String itemId = 'abc';
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('year')
//           .doc('$colorYear')
//           .collection('$colorMonth')
//           .snapshots(),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         final document = snapshot.data!.docs;
//         return document.length == 0
//             ? emptyList
//             : ListView.builder(
//                 itemCount: document.length,
//                 itemBuilder: (ctx, index) {
//                   title = document[index]['title'];
//                   amount = document[index]['Amount'];
//                   DateTime firebaseDate = DateTime.parse(
//                       (document[index]['Date']).toDate().toString());
//                   itemId = document[index]['Id'];
//                   return Card(
//                     elevation: 5,
//                     margin: EdgeInsets.symmetric(
//                       vertical: 8,
//                       horizontal: 5,
//                     ),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.of(context)
//                             .push(MaterialPageRoute(builder: (ctx) {
//                           return TransactionDetailScreen(
//                               title, amount, firebaseDate);
//                         }));
//                       },
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 30,
//                           child: Container(
//                             padding: EdgeInsets.all(6),
//                             child: FittedBox(child: Text('$amount')),
//                           ),
//                         ),
//                         title: Text(
//                           title,
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                         subtitle: Text(
//                           DateFormat.yMMMd().format(
//                             firebaseDate,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 });
//       },
//     );
//   }
// }
