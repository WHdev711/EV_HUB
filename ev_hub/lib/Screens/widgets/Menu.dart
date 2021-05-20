import 'package:ev_hub/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:ev_hub/Screens/widgets/ContactUs.dart';
import 'package:ev_hub/Screens/widgets/Terms.dart';
import 'package:ev_hub/Screens/widgets/Faq.dart';
import 'package:ev_hub/Screens/widgets/Price.dart';
import 'package:ev_hub/services/auth.dart';
import 'package:ev_hub/Config/constants.dart';

class Menubar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'EV HUB',
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: Colors.green[400],
                image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    fit: BoxFit.fill,
                    image: AssetImage('assets/menu_cover.jpg'))),
          ),
          Container(
            color: Colors.green.withOpacity(0.2),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Contact Us'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()))
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Pricing'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PriceScreen()))
            },
          ),
          ListTile(
            leading: Icon(Icons.speaker_notes),
            title: Text('Terms and Conditions'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TermsScreen()))
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('FAQ\'s'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FaqScreen()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              AuthService().signOut();
              Constants.saveUserLoggedInSharedPreference(false);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
