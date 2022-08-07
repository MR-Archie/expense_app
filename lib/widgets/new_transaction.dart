import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop(context);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 7,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Title"),
                controller: _titleController,
                onFieldSubmitted: (_) => _submitData(),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
                controller: _amountController,
                onFieldSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectedDate == null
                        ? 'No date chosen !!'
                        : 'Date Selected : ${DateFormat.yMMMMd().format(_selectedDate)}'),
                    TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        "Choose date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Color.fromARGB(255, 14, 248, 5);
                          return null; // Defer to the widget's default.
                        }),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                child: Text("Add Transaction",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
