import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/Transaction.dart';
import 'package:myapp/Screens/transactionDetailScreen.dart';

// ignore: camel_case_types
class Transaction_List extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  Transaction_List(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transaction yet!...',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
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
                      return TransactionDetailScreen(transaction[index].title,
                          transaction[index].ammount, transaction[index].date);
                    }));
                  },
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text(
                                  '\$${transaction[index].ammount.toString()}')),
                        ),
                      ),
                      title: Text(
                        transaction[index].title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(
                          transaction[index].date,
                        ),
                      ),
                      trailing: mediaQuery.size.width > 460
                          ? FlatButton.icon(
                              onPressed: () => deleteTx(transaction[index].id),
                              icon: Icon(Icons.delete),
                              textColor: Theme.of(context).errorColor,
                              label: Text('Delete'))
                          : IconButton(
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                              onPressed: () => deleteTx(transaction[index].id),
                            )),
                ),
              );
            },
            itemCount: transaction.length);
  }
}
