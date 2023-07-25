import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petrom_fidelite/screens/stations_list.dart';

import '../models/cartehome.dart';
import '../models/default_infos_entity.dart';
import '../models/session.dart';
import 'alert_add.dart';
import 'localisation_screen.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<LocalisationScreen> {
  final Set<Marker> stationsmarkers = new Set();
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    getMarkers();
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition:
          CameraPosition(target: LatLng(33, -7), zoom: 10),
          onMapCreated: (googleMapController) {
            setState(() {
              mapController = googleMapController;
            });
          },
          markers: stationsmarkers,
        ),
        Column(children: [
          Expanded(flex: 9, child: Container()),
          Expanded(
              flex: 1,
              child: Row(children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(StationsListPage.screenRoute)
                        .then(
                          (result) {
                        if (result != null) {}
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(
                      width: 30,
                      height: 30,
                      image: AssetImage('images/liste.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ]))
        ])
      ]),
    );
  }

  getMarkers() async {
    for (var station in Session.informations.response.stations) {
      BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(),
        "images/ic_station.png",
      );
      stationsmarkers.add(Marker(
        //add start location marker
          position: LatLng(
              double.parse(station.latitude), double.parse(station.longitude)),
          icon: markerbitmap,
          markerId: MarkerId(station.id)));
    }
  }
}

