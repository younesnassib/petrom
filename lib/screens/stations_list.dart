import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/car_response_entity.dart';
import 'package:petrom_fidelite/models/deletealerte_entity.dart';
import 'package:petrom_fidelite/screens/alert_add.dart';
import 'package:petrom_fidelite/screens/station_details.dart';

import '../models/alerte_response_entity.dart';
import '../models/default_infos_entity.dart';
import '../models/session.dart';
import 'car_add.dart';

enum SampleItem { itemOne, itemTwo }

class StationsListPage extends StatefulWidget {
  static const screenRoute = '/stationsliste';

  const StationsListPage({Key? key}) : super(key: key);

  @override
  State<StationsListPage> createState() => _StationsPageState();
}

class _StationsPageState extends State<StationsListPage> {
  final myController = TextEditingController();
  late DeletealerteEntity DE;
  late Future<CarResponseEntity> carsresponse;
  List<DefaultInfosResponseStations> stations = [];

  final url = 'http://card.petrom.ma/api/AttarikPro.php/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Stations PETROM',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: myController,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: stations.length,
              clipBehavior: Clip.none,
              itemBuilder: (BuildContext context, int index) {
                return buildProduct(stations[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProduct(DefaultInfosResponseStations response) => InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => StationDetails(stationRecup: response)));
        },
        child: Material(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 120,
            width: 180,
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(response.nom),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          textAlign: TextAlign.center,
                          response.adresse,
                          maxLines: 2,
                        ),
                      ),
                      Text(response.ville),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  refresh(BuildContext context) {
    Navigator.of(context).pushNamed(StationsListPage.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    setState(() {
      stations.clear();
      for (DefaultInfosResponseStations s
          in Session.informations.response.stations) {
        if (s.ville.toUpperCase().contains(myController.text.toUpperCase())) {
          stations.add(s);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    stations.addAll(Session.informations.response.stations);
    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }
}
