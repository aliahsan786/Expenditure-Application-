import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen(this.titles, this.ammount, this.dateTime);
  final String titles;
  final double ammount;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titles),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text('$ammount',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black54,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 5,
              ),
              Text(
                'Totle Amount You was spent for this item',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontFamily: 'OpenSans'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '${DateFormat.yMMMMEEEEd().format(
                  dateTime,
                )}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ));
  }
}
