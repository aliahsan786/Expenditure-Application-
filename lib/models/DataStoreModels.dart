import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataStoreModels {
  void insertData(String title, double amount, DateTime date) async {
    Map<String, dynamic> ourData = {
      'title': "$title",
      'Amount': amount,
      'Date': date,
      'Id': DateTime.now().toString(),
    };

    String year = date.year.toString();
    String month = DateFormat.MMM().format(date);

    final db = FirebaseFirestore.instance.collection('year');
    db
        .doc('$year')
        .collection('$month')
        .doc()
        .set(ourData)
        .then((value) => print('Success'));
  }
}
