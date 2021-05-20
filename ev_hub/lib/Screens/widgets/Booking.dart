import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ev_hub/Config/constants.dart';
import 'package:ev_hub/Screens/LoginScreen.dart';
import 'package:ev_hub/Screens/BookdetailScreen.dart';

class Booking extends StatefulWidget {
  Booking({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  bool userloginstatue = false;
  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await Constants.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userloginstatue = value;
      });
    });
  }

  Widget noprofile() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 150),
            Icon(
              Icons.date_range,
              color: Colors.green,
              size: 150,
            ),
            SizedBox(height: 20),
            Text(
              'My appiontment',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.green),
            ),
            SizedBox(height: 15),
            Text(
              'You did not login. Pleaase login and book.',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.green[200]),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    ModalRoute.withName('/'));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .5,
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: Offset(2, 4),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0x9F17A32E), Color(0xFF6AF80B)])),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.green[900]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profile() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 150),
            Icon(
              Icons.date_range,
              color: Colors.green,
              size: 150,
            ),
            SizedBox(height: 20),
            Text(
              'My appiontment',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.green),
            ),
            SizedBox(height: 15),
            Text(
              'You did not login. Pleaase login and book.',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.green[200]),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookdetailScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .5,
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: Offset(2, 4),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0x9F17A32E), Color(0xFF6AF80B)])),
                child: Text(
                  'Book',
                  style: TextStyle(fontSize: 20, color: Colors.green[900]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return userloginstatue ? profile() : noprofile();
  }
}
