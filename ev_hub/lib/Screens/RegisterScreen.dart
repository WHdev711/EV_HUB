import 'package:ev_hub/Screens/MainHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:ev_hub/Screens/LoginScreen.dart';
import 'package:ev_hub/Config/constants.dart';
import 'package:ev_hub/services/auth.dart';
import 'package:ev_hub/services/database.dart';
import 'package:ev_hub/utils/ui/custom_dialog.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = '', password = '', name = "", error = "";
  bool _loading = false;
  final _formkey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  @override
  void initState() {
    super.initState();
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: field_title),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              obscureText: isPassword,
              validator: (val) => val.isEmpty ? 'Please input $title' : null,
              onChanged: (val) => {
                    setState(() {
                      if (title == 'Username') {
                        name = val;
                      }
                      if (title == 'Email') {
                        email = val;
                      }
                      if (title == 'Password') {
                        password = val;
                      }
                    }),
                  },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.transparent,
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        if (_formkey.currentState.validate()) {
          setState(() {
            _loading = true;
          });
          await _authService
              .signUpWithEmailAndPassword(email, password)
              .then((value) {
            if (value != null) {
              Map<String, String> userInfo = {"userName": name, "email": email};
              DatabaseMethods().addData(userInfo);
              Constants.saveUserLoggedInSharedPreference(true);
              Constants.saveUserNameSharedPreference(name);
              Constants.saveUserEmailSharedPreference(email);
              // setState(() {
              //   _loading = false;
              // });
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainHomeScreen()),
                  ModalRoute.withName('/'));
            } else {
              setState(() {
                print(value);
                _loading = false;
                error = "please supply a valid/another email";
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialog(
                        title: "Error",
                        description: "please supply a valid/another email",
                        buttonText: 'Okay');
                  },
                );
              });
            }
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
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
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0x9F17A32E), Color(0xFF6AF80B)])),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _errorLabel() {
    return Container(
      child: error.isEmpty
          ? Container()
          : Column(
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            ModalRoute.withName('/'));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: maincolor, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Image.asset('assets/logo.png', width: 250, height: 250);
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username"),
        _entryField("Email"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
          : Container(
              height: height,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    //TODO update this
                    'assets/background2.png',
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.green.withOpacity(0.2),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                        child: Container(
                      alignment: Alignment.center,
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: height * .06),
                            _title(),
                            _emailPasswordWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            _submitButton(),
                            _errorLabel(),
                            _loginAccountLabel(),
                          ],
                        ),
                      ),
                    )),
                  ),
                  Positioned(top: 40, left: 0, child: _backButton()),
                ],
              ),
            ),
    );
  }
}
