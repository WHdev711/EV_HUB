import 'package:flutter/material.dart';
import 'package:ev_hub/Config/constants.dart';
import 'package:ev_hub/Screens/LoginScreen.dart';
import 'package:ev_hub/Screens/widgets/ProfileDetails.dart';
import 'package:ev_hub/Screens/widgets/PaymentDetails.dart';
import 'package:ev_hub/Screens/widgets/Vehicles.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  Widget noprofilewidget() {
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
              Icons.perm_contact_cal,
              color: Colors.green,
              size: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to EV HUB',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.green),
            ),
            SizedBox(height: 15),
            Text(
              'You did not login. Pleaase login.',
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
                  width: MediaQuery.of(context).size.width*.5,
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
                  child: Text('Login',style: TextStyle(fontSize: 20, color: Colors.green[900]),),
                  ),
            )
          ],
        ),
      ),
    );
  }

  Widget profilewidget() {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My details'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileDetails()))
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Payment details'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentDetails()))
            },
          ),
          ListTile(
            leading: Icon(Icons.commute),
            title: Text('My Vehicles'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Vehicles()))
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.payment),
          //   title: Text('Request EV card'),
          //   onTap: () => {
          //     // Navigator.push(
          //     //     context, MaterialPageRoute(builder: (context) => FaqScreen()))
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   onTap: () {
          //     AuthService().signOut();
          //     Constants.saveUserLoggedInSharedPreference(false);
          //     Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => LoginScreen()));
          //   },
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return userloginstatue ? profilewidget() : noprofilewidget();
  }
}
