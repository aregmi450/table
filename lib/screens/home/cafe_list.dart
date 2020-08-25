import 'package:app/models/cafe.dart';
import 'package:app/screens/home/cafe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeList extends StatefulWidget {
  @override
  _CafeListState createState() => _CafeListState();
}

class _CafeListState extends State<CafeList> {
  @override
  Widget build(BuildContext context) {
    final cafes = Provider.of<List<Cafe>>(context);
    cafes.forEach((cafe) {
      print(cafe.cafename);
      print(cafe.location);
      print(cafe.contact);
    });

    return ListView.builder(
      itemCount: cafes.length,
      itemBuilder: (context, index) {
        return CafeTile(cafe: cafes[index]);
      },
    );
  }
}
