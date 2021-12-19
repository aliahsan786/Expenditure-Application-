import 'package:flutter/material.dart';
import 'package:myapp/widgets/new_Income.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  double netIncome = 2000.00;
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

  void _addNewIncome(double netAmount) {
    setState(() {
      netIncome = netAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 30,
              ),
              Text('Rs. 2000',
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
                                          fontWeight: FontWeight.w600))
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
                                    'Expenditure',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black38,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Rs. 2000',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black54,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.w600))
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
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          // FirebaseFirestore.instance
          //     .collection('Expenses/T7DcV5sp2fRlSqdPkPKw/values')
          //     .snapshots()
          //     .listen((event) {
          //   print(event);
          // });
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
