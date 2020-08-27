import 'package:app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:app/models/cafe.dart';

class CafeTile extends StatelessWidget {
  final Users cafe;
  CafeTile({this.cafe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.red,
          ),
          title: Text(cafe.name),
          subtitle: Text('is situated at ${cafe.location} '),
        ),
      ),
    );
  }
}
