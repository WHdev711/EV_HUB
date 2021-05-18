/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';
import 'package:ev_hub/Screens/widgets/ServicelocationScreen.dart';
import 'package:ev_hub/Screens/widgets/Menu.dart';


/// This is the main application widget.


/// This is the stateful widget that the main application instantiates.
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreene();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainHomeScreene extends State<MainHomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Maplist(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menubar(),
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'EV HUB',
          style: TextStyle(color: Colors.green[900]))
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_cal),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
