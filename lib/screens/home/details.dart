import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class RDetails extends StatefulWidget {
  @override
  _RDetailsState createState() => _RDetailsState();
}

const String MIN_DATETIME = '2019-05-15 20:10:55';
const String MAX_DATETIME = '2019-07-01 12:30:40';
const String INIT_DATETIME = '2019-05-16 09:00:58';
const String DATE_FORMAT = 'MMMM-EEEE-dd,HH:mm';

class _RDetailsState extends State<RDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 20.0,
            color: Colors.brown,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        centerTitle: true,
        title: Text(
          "Choose your time",
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Icon(
            Icons.menu,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 16.0,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 24.0, bottom: 24.0),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40.0)),
                    image: DecorationImage(
                        image: AssetImage("assets/table.jpg"),
                        fit: BoxFit.fill)),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                    top: 40.0, left: 24.0, right: 48.0, bottom: 56.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(48.0)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // title
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Tables",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(SizedBox(
                              height: 10.0,
                            )),
                            Text(
                              "\$246",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 12.0),
                    Text(
                      "Choose your table",
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),

                    // check in check out
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 8.0, bottom: 40.0),
                            child: DateTimePickerWidget(
                              minDateTime: DateTime.parse(MIN_DATETIME),
                              maxDateTime: DateTime.parse(MAX_DATETIME),
                              initDateTime: DateTime.parse(INIT_DATETIME),
                              locale: DateTimePickerLocale.en_us,
                              dateFormat: DATE_FORMAT,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Check-In",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // book container
                    Container(
                      height: 32.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white),
                      child: Center(
                          child: Text(
                        "Book",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
