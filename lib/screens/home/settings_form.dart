import 'package:app/models/user.dart';
import 'package:app/services/database.dart';
import 'package:app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> location = [
    'Kathmandu',
    'Patan',
    'Bhaktapur',
    'Pokhara',
    'Chitwan',
  ];

  //formvalues
  String _currentname;
  String _currentlocation;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your User settings',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 11.0),
                  TextFormField(
                    initialValue: userData.cafename,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'please enter a name' : null,
                    onChanged: (val) => setState(() => _currentname = val),
                  ),
                  SizedBox(height: 11.0),
                  //dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    items: location.map((location) {
                      return DropdownMenuItem(
                        value: location,
                        child: Text('Here'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentlocation = val),
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
                        print(_currentname);
                        print(_currentlocation);
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
