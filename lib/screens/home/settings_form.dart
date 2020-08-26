import 'package:flutter/material.dart';
import 'package:app/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> rates = ['0', '1', '2', '3', '4', '5'];

  //formvalues
  String _currentcafename;
  int _currentrating;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your cafe settings',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 11.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'please enter a name' : null,
            onChanged: (val) => setState(() => _currentcafename = val),
          ),
          SizedBox(height: 11.0),
          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentrating ?? '0',
            items: rates.map((rate) {
              return DropdownMenuItem(
                value: rate,
                child: Text('$rate stars'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentrating = val),
          ),
          //slider
          SizedBox(height: 10.0),
          RaisedButton(
              color: Colors.green[300],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(_currentcafename);
                print(_currentrating);
              }),
        ],
      ),
    );
  }
}
