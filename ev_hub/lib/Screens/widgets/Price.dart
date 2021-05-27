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
class PriceScreen extends StatefulWidget {
  const PriceScreen({Key key}) : super(key: key);
  @override
  State<PriceScreen> createState() => _PriceScreene();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PriceScreene extends State<PriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Price', style: TextStyle(color: Colors.green[900]))),
      body: Container(
        padding: EdgeInsets.all(30),
        color: Colors.grey[400],
        child: ListView(
          children: <Widget>[
            Container(
              // color: Colors.white,
              // height: 250,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'FOR DC SOCKETS',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'price',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Up to 50kW  3.50₺/kWh',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '50kW to 90kW  4.50₺/kWh ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '90kW and above  5.50₺/kWh ',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.warning,
                    color: Colors.red[200],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Guests users will benefit from our DC SOCKETS for 25\$',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Cancellation fee is equal to deposit we have to withdraw it in the initiation.',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // color: Colors.white,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'FOR AC TYPE 2 SOCKETS',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'price',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Up to 7.4kW  0.50₺/kWh',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '7.4kW to 11kW  0.50₺/kWh ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '11kW and above  0.50₺/kWh ',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.warning,
                    color: Colors.red[200],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Guests users will benefit from our AC SOCKETS for 20\$',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Cancellation fee is equal to deposit we have to withdraw it in the initiation.',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
