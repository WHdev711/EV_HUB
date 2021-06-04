import 'package:ev_hub/Screens/BookdetailScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ev_hub/Screens/BookScreen.dart';
import 'package:ev_hub/Screens/QRscannerScreen.dart';

class Maplist extends StatefulWidget {
  // Maplist() : super();

  final String title = "Maps Demo";

  @override
  _MaplistState createState() => _MaplistState();
}

class _MaplistState extends State<Maplist> {
  //
  Completer<GoogleMapController> _controller = Completer();
  LatLng _center;
  final Set<Marker> _markers = {};
  var currentLocation;
  String addressinfo;
  LatLng _lastMapPosition;
  MapType _currentMapType = MapType.normal;
  final List<LatLng> markerLocations = [
    LatLng(41.034283, 28.680119),
    LatLng(41.032921, 29.032669),
    LatLng(40.879848, 29.257639),
    LatLng(41.016129, 29.084585),
    LatLng(36.895924, 30.710007),
    LatLng(36.549362, 31.996994),
    LatLng(39.988956, 32.615490),
    LatLng(41.038284, 28.970329),
  ];
  final List<String> addresslist = [
    'latitude address - Sultaniye Mahallesi, Doğan Araslı Blv. no:170, 34510 Esenyurt/İstanbu',
    'Mimar Sinan, Çavuşdere Cd. No:35, 34672, 34672 Üsküdar/İstanbul',
    'Kaynarca, Neomarin AVM No:6, 34890 Pendik/İstanbul',
    'Levazım Mahallesi Zorlu Center, Koru Sokağı No:2, 34340 Beşiktas',
    'Etiler, Adnan Menderes Blv. 57-55, 07010 Muratpaşa/Antalya',
    'Tosmur, Kerimcik Cd. No:11, 07469 Alanya/Antalya',
    'Eryaman Mah, Metromall, Dumlupınar 30 Ağustos Cd. No:8-9, 06824 Etimesgut/Ankara',
    'Hüseyinağa HALEP PASAJI İstiklal Caddesi, D:No:62, 34435 Beyoğlu/İstanbu'
  ];

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(41.034283, 28.680119),
    tilt: 59.440,
    zoom: 11.0,
  );

  Future<void> _goToPosition1() async {
    // final GoogleMapController controller = await _controller.future;
    // controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QRScanner()));
  }

  _getLocation() async {
    var location = new Location();
    try {
      currentLocation = await location.getLocation();

      print("locationLatitude: ${currentLocation.latitude}");
      print("locationLongitude: ${currentLocation.longitude}");
      setState(() {
        _center = LatLng(currentLocation.latitude, currentLocation.longitude);
      }); //rebuild the widget after getting the current location of the user
    } on Exception catch (e) {
      print(e);
      currentLocation = null;
    }
  }

  _gotoBook() {
    print('addressinfo');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BookdetailScreen()));
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  BitmapDescriptor customicon;

  // List for storing markers
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    // _onAddMarkerButtonPressed();
    _getLocation();
    // final GoogleMapController controller = await _controller.future;
    // controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
    BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/car.png')
        .then((value) => customicon = value);
  }

  _onAddMarkerButtonPressed() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
    int i = 0;
    setState(() {
      for (LatLng tmp in markerLocations) {
        _markers.add(
          Marker(
            markerId: MarkerId(tmp.toString()),
            position: tmp,
            infoWindow: InfoWindow(
                title: 'EV HUB',
                snippet: addresslist[i],
                onTap: () {
                  _gotoBook();
                } ),
            // icon: customicon,
          ),
        );
        i = i + 1;
      }
      _center = LatLng(41.034283, 28.680119);
    });
  }

  Widget button(Function function, IconData icon, int index) {
    return FloatingActionButton(
      heroTag: index,
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.green,
      child: Icon(
        icon,
        size: 25.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_center == null ?
      Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              )
      :
       Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  button(_onMapTypeButtonPressed, Icons.map, 1),
                  SizedBox(
                    height: 10.0,
                  ),
                  button(_onAddMarkerButtonPressed, Icons.add_location, 2),
                  SizedBox(
                    height: 16.0,
                  ),
                  button(_goToPosition1, Icons.filter_alt, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
