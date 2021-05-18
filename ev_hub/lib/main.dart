import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ev_hub/Config/constants.dart';
import 'package:ev_hub/Screens/LoginScreen.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 10,
        navigateAfterSeconds:new MyHome(),
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

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EV HUB",
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home: LoginScreen(),
    );
  }
}