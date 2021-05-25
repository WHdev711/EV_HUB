import 'package:ev_hub/utils/ui/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ev_hub/Config/constants.dart';

class Vehicles extends StatefulWidget {
  Vehicles({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _VehiclesState createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  String type = '',
      bookingdate = '',
      starttime = '',
      endtime = '',
      username = '';
  bool ischecking = false;
  Widget _customTextField(String title) {
    return Container(
        height: 30.0,
        child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: title,
                contentPadding:EdgeInsets.all(5.0),
                border: OutlineInputBorder(),
                fillColor: Colors.transparent,
                filled: true)));
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
          Container(height: 30.0, child: _customTextField('Vehicle Type')),
        ],
      ),
    );
  }

  Widget _checkField(String title) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              child: Checkbox(
                  value: ischecking,
                  onChanged: (value) {
                    setState(() {
                      ischecking = value;
                    });
                  })),
          SizedBox(
            width: 10,
          ),
          Container(child: Text('$title'))
        ],
      ),
    );
  }

 
  Widget _formdWidget() {
    return Column(
      children: <Widget>[
        _userField("Vehicles"),
        _checkField('Default'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            title:
                Text('Vehicles', style: TextStyle(color: Colors.green[900]))),
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
                        Text('Please input informations.',
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
                        'Add Vehicle',
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
