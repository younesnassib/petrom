import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

// on below line we are initializing our controller for google maps.
  Completer<GoogleMapController> _controller = Completer();

// on below line we are specifying our camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(37.42796133580664, -122.885749655962),
    zoom: 14.4746,
  );

// on below line we have created list of markers
  List<Marker> _marker = [];
  final List<Marker> _list = const [
    // List of Markers Added on Google Map
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 80.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    ),

    Marker(
        markerId: MarkerId('2'),
        position: LatLng(25.42796133580664, 80.885749655962),
        infoWindow: InfoWindow(
          title: 'Location 1',
        )
    ),

    Marker(
        markerId: MarkerId('3'),
        position: LatLng(20.42796133580664, 73.885749655962),
        infoWindow: InfoWindow(
          title: 'Location 2',
        )
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0F9D58),
          title: Text("GFG"),
        ),
        body: Container(
          // on below line creating google maps.
          child: GoogleMap(
            // on below line setting camera position
            initialCameraPosition: _kGoogle,
            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,
            // on beloe line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        )
    );
  }
}
