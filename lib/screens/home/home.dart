import 'package:app/main.dart';
import 'package:app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../authenticate/signin.dart';
import '../home/details.dart';

class MyRestaurantBooking extends StatelessWidget {
  // This widget is the root of application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabler Home',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        title: Text(
          'Tabler',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.red[200],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => SignIn()),
                  ModalRoute.withName('/'),
                );
              }
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                 MaterialPageRoute(builder: (context) => SignIn()),
//                  );
              ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25.0, top: 45.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(
                  child: ListView(
                children: <Widget>[
                  buildItem(
                    context,
                    "Trisara",
                    "Lazimpat",
                    "assets/trisara.jpg",
                  ),
                  buildItem(
                    context,
                    "Tamarind",
                    "Jhamsikhel",
                    "assets/tamarind.jpg",
                  ),
                  buildItem(
                    context,
                    "Dunga Restro & Bar",
                    "Lakeside",
                    "assets/dunga.jpg",
                  ),
                  buildItem(
                    context,
                    "Roadhouse Cafe",
                    "Pokhara",
                    "assets/roadhouse.jpg",
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Container buildItem(BuildContext context,String title, String subTitle, String url) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 12.0),
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(children: <Widget>[
          Card(
            child:InkWell(
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(
                 builder: (_)=>RDetails(title,subTitle,url)
               ));
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(url),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    )),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ]));
  }
}

