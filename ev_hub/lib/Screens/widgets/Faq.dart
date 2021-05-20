/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

/// This is the main application widget.

/// This is the stateful widget that the main application instantiates.
class FaqScreen extends StatefulWidget {
  const FaqScreen({Key key}) : super(key: key);
  @override
  State<FaqScreen> createState() => _FaqScreene();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FaqScreene extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('FQA\'s', style: TextStyle(color: Colors.green[900]))),
        body: SingleChildScrollView(
          child: Html(
            data: """
<center><h1 style = 'color: #008000'>CHARGING</h1>
 <p> <br> <b>Q.How can I charge my car?</br></b>
Ans. You can charge your vehicle with using its own charging cable at the EV HUB AC charging stations and using <br>the charging cables on
 the device at DC charging stations. 
You need to download the EV HUB mobile app or have a <br>EV HUB card in order to charge your vehicle at EV HUB charging stations. </p>

<p> <br> <b>Q. How long does it take for my car to be fully charge?</br> </b>
Ans. Charging time of the eletric vehicles depends on many variables like battery capacity, <br>current capacity, vehicle charging 
capacity. At EV HUB you can charge up to <br>80% for 30 minutes with the DC charging station. </p>

<p> <br> <b>Q.How can i start or end the charging process?</br> </b>
Ans. In order to start the charging process, make sure the cable attached to your vehicle and the station. <br>
After that you can start the charging process by scanning your EV HUB card to the <br>area on the device or by scanning 
the QR code on the device with the EV HUB mobile app. <br>In order to finish the charging process, you can either scan your 
EV HUB card our you can end it by <br>
clicking the Stop Charging button on the Map page with the mobile app.</p>

<p><br><b> Q. What should i do if the charging cable is disconnected during charging process?</br></b>
Ans. When the charging process starts in a healthy way, the charging cable locks itself to the station and
 the vehicle <br>separately and makes itself closed to outer interventions. If you encounter with a technical <br>problem 
 and notice that the charging cable is disconnected, 
you can contact us through the call center. </p><br>


<h1>PRICING </h1>
 <p><br><b>Q.How is the pricing schedule calculated?</br></b>
Ans. Prices are calculated based on the amount of power <br>you draw from the station and the time you stay at the station. 
</p>

<p> <br> <b>Q. How and where do I pay for the charging process?</br> </b>
Ans.You can easily make your payment bu adding your <br>credit card information through the application. 
After charging is completed, your pricing will be <br>calculated and charged to your card . 
Your card information is secured by secure payment <br>systems and is not shared with any other institution or organization. </p><br>

<h1>Reservation</h1>
 <p><br><b>Q.How can I make a reservation?</br></b>
Ans. In order to make a reservation, you must add your payment informations through the application. <br>
Find the station you want to charge your vehicle on the application, 
select the appropriate day and <br>time interval and click on the reservation button is enough. </p>

<p> <br> <b>Q. What should I do if the charging process takes longer then the maximum time?</br> </b>
Ans. During the charging process, if you stay longer than the maximum time of the <br>socket you use or 
exceed the reservation time, the blockage fee will be reflected on your invoice with the charging fee. 
<br>Blockage fee is calculated by taking %25 of the charge amount in the exceeded period. </p>

<p> <br> <b>. If there is another Vehicle at the Charging Station I made a reservation on</br> </b>
Ans. If you encounter with such a situation, you can contact us by calling our call center.<br>
 Related Persons will be provided with guidance to resolve the situation.</p><br>

 <h1>Installation</h1>
 <p> <br> <b>Q. Is it possible to install a charging station at home or the office for my own private use?</br></b>
Ans. ou can purchase a custom charging station for your home or office or request for a setup. <br>You can reach the 
details of our services that we offer especially for home and work places on the Services page.<br> After completing the form, 
you will be contacted and guided for exploration. 
<br>After the technical reviews, the most suitable solution for your needs will be presented to you. </p></center>

                """,
            padding: EdgeInsets.all(20),
          ),
        ));
  }
}
