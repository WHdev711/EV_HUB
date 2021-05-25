import 'package:flutter/material.dart';
import 'package:ev_hub/Config/constants.dart';
import 'package:ev_hub/utils/ui/custom_dialog.dart';
import 'package:ev_hub/utils/ui/Datepicker.dart';

class BookdetailScreen extends StatefulWidget {
  BookdetailScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _BookdetailScreen createState() => _BookdetailScreen();
}

class _BookdetailScreen extends State<BookdetailScreen> {
  String type = '', bookingdate = '';
  DateTime startdate = new DateTime.now(), enddate = new DateTime.now() ;
  TimeOfDay starttime = new TimeOfDay.now(), endtime = new TimeOfDay.now();
  String _chosenValue;
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
                        type = val;
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

  Widget _entrydropField(String title, {bool isPassword = false}) {
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
          DropdownButtonFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.transparent,
                filled: true),
            focusColor: Colors.white,
            value: _chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>['AC TYPE', 'DC TYPE']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            hint: Text(
              "Please choose a Connector type",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _formdWidget() {
    return Column(
      children: <Widget>[
        _entrydropField("Connector type"),
        // _entryField("Date"),
        DateTimePicker(labelText: 'Start time',selectedDate: startdate,selectedTime: starttime ,selectDate: (value) {
          setState(() {
            startdate = value;
          });
        }, selectTime: (value) {
          setState(() {
            starttime = value;
          });
        }, ),
        DateTimePicker(labelText: 'End time',selectedDate: enddate,selectedTime: endtime ,selectDate: (value) {
          setState(() {
            enddate = value;
          });
        }, selectTime: (value) {
          setState(() {
            endtime = value;
          });
        }, ),
      ],
    );
  }

  @override
  void initState() {
    startdate = new DateTime.now(); enddate = new DateTime.now() ;
    starttime = new TimeOfDay.now(); endtime = new TimeOfDay.now();  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            title: Text('My booking details',
                style: TextStyle(color: Colors.green[900]))),
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
                              description:
                                  "Hello this is test version.",
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
                        'Book',
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
