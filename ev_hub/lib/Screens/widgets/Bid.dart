import 'package:flutter/material.dart';
import 'package:ev_hub/utils/ui/custom_dialog.dart';

class Bid extends StatefulWidget {
  Bid({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BidState createState() => _BidState();
}

class _BidState extends State<Bid> {
  bool userloginstatue = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              // height: 300,
              // color: Colors.grey,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  InkWell(
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
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Address: Sultaniye Mahallesi, Doğan Araslı Blv. no:170, 34510 Esenyurt/İstanbu',
                                // style: TextStyle(fontSize: ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'contact address: pinanaleepile@gmail.com',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'End Date: Monday 31/05/2021, 09:30 am',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                height: 20,
                                // padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
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
                                        colors: [
                                          Color(0x9F17A32E),
                                          Color(0xFF6AF80B)
                                        ])),
                                child: Text(
                                  'Bid',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              // height: 300,
              // color: Colors.grey,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  InkWell(
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
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Address: Mimar Sinan, Çavuşdere Cd. No:35, 34672, 34672 Üsküdar/İstanbul',
                                // style: TextStyle(fontSize: ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'contact address: pinanaleepile@gmail.com',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'End Date: Sunday 30/05/2021, 04:00 pm',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                height: 20,
                                // padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
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
                                        colors: [
                                          Color(0x9F17A32E),
                                          Color(0xFF6AF80B)
                                        ])),
                                child: Text(
                                  'Bid',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              // height: 300,
              // color: Colors.grey,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  InkWell(
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
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Address: Kaynarca, Neomarin AVM No:6, 34890 Pendik/İstanbul',
                                // style: TextStyle(fontSize: ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              
                              Text(
                                'contact address: pinanaleepile@gmail.com',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'End Date: Tuesday 01/06/2021, 11:30 am',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                height: 20,
                                // padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
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
                                        colors: [
                                          Color(0x9F17A32E),
                                          Color(0xFF6AF80B)
                                        ])),
                                child: Text(
                                  'Bid',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              // height: 300,
              // color: Colors.grey,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  InkWell(
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
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Address: Levazım Mahallesi Zorlu Center, Koru Sokağı No:2, 34340 Beşiktas',
                                // style: TextStyle(fontSize: ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'contact address: pinanaleepile@gmail.com',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'End Date: Monday 31/05/2021, 11:30 am',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                height: 20,
                                // padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
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
                                        colors: [
                                          Color(0x9F17A32E),
                                          Color(0xFF6AF80B)
                                        ])),
                                child: Text(
                                  'Bid',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              // height: 300,
              // color: Colors.grey,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  InkWell(
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
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Address: Etiler, Adnan Menderes Blv. 57-55, 07010 Muratpaşa/Antalya',
                                // style: TextStyle(fontSize: ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'contact address: pinanaleepile@gmail.com',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'End Date: Monday 31/05/2021, 10:30 am',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                height: 20,
                                // padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
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
                                        colors: [
                                          Color(0x9F17A32E),
                                          Color(0xFF6AF80B)
                                        ])),
                                child: Text(
                                  'Bid',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
