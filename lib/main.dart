import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final List<Transaction> transactions = [
    Transaction(
        id: "T1", title: "Groceries", amount: 150.95, date: DateTime.now()),
    Transaction(
        id: "T2", title: "Jacket", amount: 1650.32, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personal Expense App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment
                .center, //CrossAxisAlignment.center not working
            children: <Widget>[
              Container(
                child: Card(
                  color: Color.fromARGB(255, 142, 205, 236),
                  elevation: 10,
                  child: Text("Card 1"),
                ),
              ),
              Column(
                children: transactions.map((tx) {
                  return Card(child: Text(tx.title));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
