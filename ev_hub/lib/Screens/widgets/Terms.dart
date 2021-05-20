/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';

/// This is the main application widget.

/// This is the stateful widget that the main application instantiates.
class TermsScreen extends StatefulWidget {
  const TermsScreen({Key key}) : super(key: key);
  @override
  State<TermsScreen> createState() => _TermsScreene();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TermsScreene extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Terms and Conditions',
              style: TextStyle(color: Colors.green[900]))),
      body: Container(
          padding: EdgeInsets.all(30),
          child: Text.rich(
            TextSpan(
              text: 'Hello', // default text style
              children: <TextSpan>[
                TextSpan(
                    text: ' Here ',
                    style: TextStyle(fontStyle: FontStyle.italic)),
                TextSpan(
                    text: 'Terms and condition page',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )),
    );
  }
}
