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
class FaqScreen extends StatefulWidget {
  const FaqScreen({Key key}) : super(key: key);
  @override
  State<FaqScreen> createState() => _FaqScreene();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FaqScreene extends State<FaqScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'FQA\'s',
          style: TextStyle(color: Colors.green[900]))
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        color: Colors.grey[400],
        child: ListView(
          children: <Widget> [
            Container(
              color:Colors.white
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color:Colors.white
            ),
          ],
        ),
        ),
    );
  }
}
