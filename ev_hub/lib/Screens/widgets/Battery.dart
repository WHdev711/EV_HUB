import 'package:flutter/material.dart';

class Battery extends StatefulWidget {
  Battery({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BatteryState createState() => _BatteryState();
}

class _BatteryState extends State<Battery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Battery Information',
          style: TextStyle(color: Colors.green[900]),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.charging_station,
                color: Colors.green,
              ),
              title: Text(
                'Charge status',
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                '59%',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.microwave,
                color: Colors.green,
              ),
              title: Text(
                'Temperature',
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                '2.3°C',
                textAlign: TextAlign.center,
                ),
            ),
            ListTile(
              leading: Icon(
                Icons.bolt,
                color: Colors.green,
              ),
              title: Text(
                'Voltage',
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                '110V',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.archive,
                color: Colors.green,
              ),
              title: Text(
                'Capacity',
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                '3.5kWH',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
