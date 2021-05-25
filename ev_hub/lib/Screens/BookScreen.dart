import 'package:flutter/material.dart';
import 'package:ev_hub/Screens/BookdetailScreen.dart';

class BookScreen extends StatefulWidget {
  BookScreen({Key key, this.title, this.addressinfo}) : super(key: key);

  final String title;
  final String addressinfo;
  @override
  _BookScreen createState() => _BookScreen();
}

class _BookScreen extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            title: Text('Booking', style: TextStyle(color: Colors.green[900]))),
        body: Container(
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
                  children:<Widget>[
                    Text('EV HUB',style: TextStyle(color: Colors.green,fontSize: 18 )),
                    SizedBox(height: 15,),
                    Text(widget.addressinfo),
                    SizedBox(height: 10,),
                    Text('This is phonenumber'),
                    SizedBox(height: 10,),
                    Text('Other information')
                  ]
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookdetailScreen()));
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
        ));
  }
}
