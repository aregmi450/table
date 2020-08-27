import 'package:app/models/cafe.dart';
import 'package:app/models/user.dart';
import 'package:app/screens/home/cafe_list.dart';
import 'package:app/screens/home/settings_form.dart';
import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:app/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Users>>.value(
        value: DatabaseService().cafes,
        child: Scaffold(
          backgroundColor: Colors.red[50],
          appBar: AppBar(
            title: Text('Tabler'),
            backgroundColor: Colors.red[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
                onPressed: () => _showSettingsPanel(),
              ),
            ],
          ),
          body: CafeList(),
        ));
  }
}
