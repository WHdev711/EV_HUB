import 'package:ev_hub/utils/ui/custom_dialog.dart';
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
class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreene();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ContactUsScreene extends State<ContactUsScreen> {
  Widget _entryField(String hint, {bool ismessage = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(
                  hintText: hint,
                  border: OutlineInputBorder(),
                  fillColor: Colors.transparent,
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      padding:EdgeInsets.only(left:40,right:40),
      child: InkWell(
        onTap: () {
          showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                              title: "Warning",
                              description:
                                  "Hello this is test version.",
                              buttonText: 'Okay');
                        },
                      );
        },
        child: Container(
          // width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
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
              color: Colors.black),
          child: Text(
            'Send Message',
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text('Contact Us', style: TextStyle(color: Colors.green[900]))),
      body: Container(
        padding: EdgeInsets.all(50),
        color: Colors.grey[400],
        alignment: Alignment.bottomCenter,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: Text(
                'Yildiz, Cirgan Cd 34349, Besiktas Istanbul Turkey',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.call,
                color: Colors.green,
              ),
              title: Container(
                child: Column(
                  children: <Widget>[
                    Text('05394039020'),
                    Text('Monday to Monday 24hr')
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.green,
              ),
              title: Text(
                'pinanaleepile@gmail.com',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            _entryField('Enter your name'),
            _entryField('Enter your email address'),
            _entryField('Enter your subject'),
            _entryField('Pleae input message'),
            SizedBox(height: 20),
            _submitButton()
          ],
        ),
      ),
    );
  }
}
