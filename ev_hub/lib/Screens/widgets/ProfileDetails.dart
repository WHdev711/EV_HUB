import 'package:ev_hub/utils/ui/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ev_hub/Config/constants.dart';

class ProfileDetails extends StatefulWidget {
  ProfileDetails({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  String type = '',
      bookingdate = '',
      starttime = '',
      endtime = '',
      username = '';
  int _defaultradio = 1;
  Widget _customTextField(String title) {
    return Container(
        height: 30.0,
        child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: title,
                contentPadding: EdgeInsets.all(5.0),
                border: OutlineInputBorder(),
                fillColor: Colors.transparent,
                filled: true)));
  }

  Widget _customRadioButton(String title, int i) {
    return ListTile(
      title: Text(title),
      contentPadding: EdgeInsets.all(0),
      leading: Radio(
        groupValue: _defaultradio,
        value: i,
        onChanged: (Object value) {
          setState(() {
            _defaultradio = value;
          });
        },
      ),
    );
  }

  Widget _userField(String title) {
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
          Container(
            child: Row(
              children: <Widget>[
                Expanded(child: _customTextField('First Name')),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: _customTextField('Last Name')),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(height: 30.0, child: _customTextField('Email Address')),
          SizedBox(
            height: 8,
          ),
          Container(height: 30.0, child: _customTextField('Phone Number')),
        ],
      ),
    );
  }

  Widget _invoiceField(String title) {
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
          Container(
            child: Row(
              children: <Widget>[
                Expanded(child: _customRadioButton('Personal', 1)),
                // SizedBox(
                //   width: 10,
                // ),
                Expanded(child: _customRadioButton('Corporate', 2)),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(height: 30.0, child: _customTextField('Invoice Number')),
        ],
      ),
    );
  }

  Widget _addressField(String title) {
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
          Container(
            height: 30.0,
            child: _customTextField('Address'),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(child: _customTextField('City')),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: _customTextField('State')),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 30.0,
            child: _customTextField('Address'),
          ),
        ],
      ),
    );
  }

  Widget _formdWidget() {
    return Column(
      children: <Widget>[
        _userField("User Information"),
        _invoiceField("Invoice Type"),
        _addressField("Address Details"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            title:
                Text('My Profile', style: TextStyle(color: Colors.green[900]))),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  child: Column(
                      // color: Colors.red,
                      children: <Widget>[
                        Text('EV HUB',
                            style:
                                TextStyle(color: Colors.green, fontSize: 18)),
                        SizedBox(
                          height: 15,
                        ),
                        _formdWidget()
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                              title: "Warning",
                              description: "Hello this is test version.",
                              buttonText: 'Okay');
                        },
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.bottomCenter,
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
                        'Save',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
