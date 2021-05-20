import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ev_hub/Screens/BookScreen.dart';

class Maplist extends StatefulWidget {
  // Maplist() : super();

  final String title = "Maps Demo";

  @override
  _MaplistState createState() => _MaplistState();
}

class _MaplistState extends State<Maplist> {
  //
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(41.521563, -122.677433);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
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

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(41.034283, 28.680119),
    tilt: 59.440,
    zoom: 11.0,
  );

  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  _gotoBook() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BookScreen()));
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
    BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/car.png')
        .then((value) => customicon = value);
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      for (LatLng tmp in markerLocations) {
        _markers.add(
          Marker(
            markerId: MarkerId(tmp.toString()),
            position: tmp,
            infoWindow: InfoWindow(
              title: 'EV HUB',
              snippet: 'Here is EV HUB charging station',
              onTap: _gotoBook
            ),
            // icon: customicon,
          ),
        );
      }
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
      body: Stack(
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
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topRight,
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
