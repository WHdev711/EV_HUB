import 'package:flutter/material.dart';
import 'package:ev_hub/Screens/RegisterScreen.dart';
import 'package:ev_hub/Config/constants.dart';
import 'package:ev_hub/Screens/MainHomeScreen.dart';
import 'package:ev_hub/services/auth.dart';
import 'package:ev_hub/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_hub/utils/ui/custom_dialog.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  DatabaseMethods _databaseMethods = DatabaseMethods();
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  // text field state

  String error = '', email = '', password = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
        if (_formKey.currentState.validate()) {
          setState(() {
            _loading = true;
          });

          QuerySnapshot userInfoSnapshot =
              await _databaseMethods.getUserInfo(email);

          await _authService
              .signInWithEmailAndPassword(email, password)
              .then((result) {
            if (result == null) {
              setState(() {
                error = "please supply a valid email";
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialog(
                        title: "Error",
                        description: "please supply a valid/another email and correct password",
                        buttonText: 'Okay');
                  },
                );
                _loading = false;
              });
            } else {
              Constants.saveUserLoggedInSharedPreference(true);
              Constants.saveUserNameSharedPreference(
                  userInfoSnapshot.documents[0].data["userName"]);

              Constants.saveUserEmailSharedPreference(email);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainHomeScreen()),
                  ModalRoute.withName('/'));
              setState(() {
                _loading = false;
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
          'Login',
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

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
            ModalRoute.withName('/'));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(5),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: maincolor, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _skipLabel() {
    return InkWell(
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainHomeScreen()),
            ModalRoute.withName('/'));
      },
      child: Text(
        'Skip',
        style: TextStyle(
            color: maincolor, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _title() {
    return Image.asset('assets/logo.png', width: 250, height: 250);
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
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
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: height * .05),
                              _title(),
                              _emailPasswordWidget(),
                              SizedBox(height: 20),
                              _submitButton(),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.centerRight,
                                child: Text('Forgot Password ?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ),
                              _skipLabel(),
                              // _divider(),
                              _errorLabel(),
                              // _facebookButton(),
                              SizedBox(height: height * .015),
                              _createAccountLabel(),
                            ],
                          ),
                        ),
                      )),
                    ),
                    // Positioned(top: 40, left: 0, child: _backButton()),
                  ],
                ),
              ));
  }
}
