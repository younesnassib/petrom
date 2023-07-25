import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:petrom_fidelite/screens/stations_list.dart';

import '../models/default_infos_entity.dart';
import '../models/session.dart';

class LocalisationScreen extends StatefulWidget {
  final DefaultInfosResponseStations station;

  const LocalisationScreen({super.key, required this.station});

  @override
  State<LocalisationScreen> createState() => _LocalisationScreenState();
}

class _LocalisationScreenState extends State<LocalisationScreen> {
  final PopupController _popupController = PopupController();
  late List<Marker> markers = [];
  late int pointIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.station.nom,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            )),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: FlutterMap(
            options: MapOptions(
              center: LatLng(double.parse(widget.station.latitude),
                  double.parse(widget.station.longitude)),
              zoom: 15,
              maxZoom: 50,
              onTap: (_, __) => _popupController
                  .hideAllPopups(), // Hide popup when the map is tapped.
            ),
            children: <Widget>[
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerClusterLayerWidget(
                options: MarkerClusterLayerOptions(
                  spiderfyCircleRadius: 80,
                  spiderfySpiralDistanceMultiplier: 2,
                  circleSpiralSwitchover: 12,
                  maxClusterRadius: 120,
                  rotate: true,
                  size: const Size(40, 40),
                  anchor: AnchorPos.align(AnchorAlign.center),
                  fitBoundsOptions: const FitBoundsOptions(
                    padding: EdgeInsets.all(50),
                    maxZoom: 15,
                  ),
                  markers: List.from(markers),
                  polygonOptions: const PolygonOptions(
                      borderColor: Colors.blueAccent,
                      color: Colors.black12,
                      borderStrokeWidth: 3),
                  popupOptions: PopupOptions(
                      popupState: PopupState(),
                      popupSnap: PopupSnap.markerTop,
                      popupController: _popupController,
                      popupBuilder: (_, marker) => Container(
                            width: 200,
                            height: 100,
                            color: Colors.white,
                            child: GestureDetector(
                              onTap: () => debugPrint('Popup tap!'),
                              child: Text(
                                'Container popup for marker at ${marker.point}',
                              ),
                            ),
                          )),
                  builder: (context, markers) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: Center(
                        child: Text(
                          markers.length.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

    );
  }

  @override
  void initState() {
    for (var station in Session.informations.response.stations) {
      markers.add(Marker(
          //add start location marker
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(
              double.parse(station.latitude), double.parse(station.longitude)),
          builder: (ctx) => station.nom == widget.station.nom
              ? Image.asset(
                  'images/petrom_station_actuelle.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'images/ic_station.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )));
    }
    super.initState();
  }
}
