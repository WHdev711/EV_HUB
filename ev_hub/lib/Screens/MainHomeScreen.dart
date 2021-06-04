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
import 'package:ev_hub/Config/constants.dart';
import 'package:ev_hub/Screens/widgets/Booking.dart';
import 'package:ev_hub/Screens/widgets/Profile.dart';
import 'package:ev_hub/Screens/widgets/Bid.dart';


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
  bool userIsLoggedIn = false;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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

    List<Widget> _widgetOptions = <Widget>[
    Maplist(),
    Booking(),
    Bid(),
    Profile(),
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
            icon: Icon(Icons.format_list_numbered),
            label: 'Bid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_cal),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
