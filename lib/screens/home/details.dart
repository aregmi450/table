import 'package:app/shared/constants.dart';
import 'package:flutter/material.dart';

class RDetails extends StatefulWidget {
  @override
  _RDetailsState createState() => _RDetailsState();
}

const MaterialColor _buttonTextColor = MaterialColor(0xFFC41A3B, <int, Color>{
  50: Color(0xFFC41A3B),
  100: Color(0xFFC41A3B),
  200: Color(0xFFC41A3B),
  300: Color(0xFFC41A3B),
});

class _RDetailsState extends State<RDetails> {
  String title = 'Date Picker';
  DateTime _date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2040),
        textDirection: TextDirection.ltr,
        initialDatePickerMode: DatePickerMode.day,
        selectableDayPredicate: (DateTime val) =>
            val.weekday == 6 || val.weekday == 7 ? false : true,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.red,
              primaryColor: Color(0xFFC41A3B),
            ),
            child: child,
          );
        });

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
        print(
          _date.toString(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    _selectDate(context);
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Date',
                  labelStyle: TextStyle(fontSize: 16.0),
                  hintText: (_date.toString()),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[200], width: 2.0),
                    //  borderRadius: BorderRadius.circular(50.0),
                  ),
                  //border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _selectDate(context);
                  });
                },
                color: Colors.blue,
                child: Text(
                  "Date Picker",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _date.toString(),
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
