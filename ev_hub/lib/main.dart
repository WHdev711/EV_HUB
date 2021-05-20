import 'package:ev_hub/Screens/MainHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ev_hub/Config/constants.dart';
import 'package:ev_hub/Screens/LoginScreen.dart';

void main(){
  runApp(new MaterialApp(
          title: "EV HUB",
      theme: ThemeData(
        primaryColor: Colors.green
      ),
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await Constants.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 10,
        navigateAfterSeconds:userIsLoggedIn ?  MainHomeScreen() : LoginScreen(),
        title: new Text(
          'Welcome To EV HUB ',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0 ,color: maincolor),
        ),
        image: new Image.asset(
          'assets/logo.png'),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        backgroundColor:Colors.green.withOpacity(0.45),
        loaderColor: Colors.green[800]);
  }
}
