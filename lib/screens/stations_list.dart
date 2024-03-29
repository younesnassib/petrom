import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/car_response_entity.dart';
import 'package:petrom_fidelite/models/deletealerte_entity.dart';
import 'package:petrom_fidelite/screens/alert_add.dart';
import 'package:petrom_fidelite/screens/station_details.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

import '../models/default_infos_entity.dart';
import '../models/session.dart';
import '../tools/Common.dart';
import 'car_add.dart';
import 'localisation_screen.dart';

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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.greysecondary],
            begin: Alignment.topCenter),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: Colors.greyprimary, // Border color
                  width: 2, // Border width
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Recherche par ville',
                          border: InputBorder.none,
                        ),
                        controller: myController,
                      ),
                    ),
                    Image(
                      image: AssetImage('images/loupe.png'),
                      height: 30,
                      width: 30,
                      color: Colors.greyprimary,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
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
      ),
    );
  }

  Widget buildProduct(DefaultInfosResponseStations response) => InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StationDetails(stationRecup: response)));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              color: Colors.bluesecondary, // Border color
              width: 2, // Border width
            ),
          ),
          height: 240,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            response.nom,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueprimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              textAlign: TextAlign.center,
                              response.adresse,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blueprimary,
                              ),
                            ),
                          ),
                          Text(
                            response.ville,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blueprimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            response.distance + "km",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueprimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              buildService(response),
              buildFooter(response)
            ],
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
      SortStations(stations);
    });
  }

  @override
  void initState() {
    super.initState();
    stations.addAll(Session.informations.response.stations);
    SortStations(stations);
    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  void SortStations(List<DefaultInfosResponseStations> stations) {
    if (Session.currentposition != null) {
      for (var s in stations) {
        s.distance = Common.calculateDistance(
                Session.currentposition.latitude,
                Session.currentposition.longitude,
                double.parse(s.latitude),
                double.parse(s.longitude))
            .toString();
      }
      stations.sort((a, b) {
        return a.compareTo(b);
        //softing on alphabetical order (Ascending order by Name String)
      });

      for (var s in stations) {
        s.distance = (int.parse(s.distance) / 100).toString();
      }
    }
  }

  Widget buildService(DefaultInfosResponseStations response) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          response.cafe == '1'
              ? Expanded(
                  child: Image(
                  image: AssetImage('images/ic_coffe_active.png'),
                  height: 40,
                  width: 40,
                  color: Colors.bluesecondary,
                ))
              : Expanded(
                  child: Image(
                  image: AssetImage('images/ic_coffe_desactive.png'),
                  height: 40,
                  width: 40,
                  color: Colors.greyprimary,
                )),
          response.vidange == '1'
              ? Expanded(
                  child: Image(
                  image: AssetImage('images/ic_vidange_active.png'),
                  height: 40,
                  width: 40,
                  color: Colors.bluesecondary,
                ))
              : Expanded(
                  child: Image(
                  image: AssetImage('images/ic_vidange_desactive.png'),
                  height: 40,
                  width: 40,
                  color: Colors.greyprimary,
                )),
          response.entretien == '1'
              ? Expanded(
                  child: Image(
                  image: AssetImage('images/ic_entretient_active.png'),
                  height: 40,
                  width: 40,
                  color: Colors.bluesecondary,
                ))
              : Expanded(
                  child: Image(
                  image: AssetImage('images/ic_entretient_desactive.png'),
                  height: 40,
                  width: 40,
                  color: Colors.greyprimary,
                )),
          response.restaurant == '1'
              ? Expanded(
                  child: Image(
                  image: AssetImage('images/ic_restaurant_active.png'),
                  height: 40,
                  width: 40,
                  color: Colors.bluesecondary,
                ))
              : Expanded(
                  child: Image(
                  image: AssetImage('images/ic_restaurant_desactive.png'),
                  height: 40,
                  width: 40,
                  color: Colors.greyprimary,
                )),
          response.shop == '1'
              ? Expanded(
                  child: Image(
                  image: AssetImage('images/ic_shopping_active.png'),
                  height: 40,
                  width: 40,
                  color: Colors.bluesecondary,
                ))
              : Expanded(
                  child: Image(
                  image: AssetImage('images/ic_shopping_desactive.png'),
                  height: 40,
                  width: 40,
                  color: Colors.greyprimary,
                )),
          response.lavage == '1'
              ? Expanded(
                  child: Image(
                  image: AssetImage('images/ic_lavage_active.png'),
                  height: 40,
                  width: 40,
                  color: Colors.bluesecondary,
                ))
              : Expanded(
                  child: Image(
                  image: AssetImage('images/ic_lavage_desactive.png'),
                  height: 40,
                  width: 40,
                  color: Colors.greyprimary,
                )),
          response.card == '1'
              ? Expanded(
                  child: Image(
                  image: AssetImage('images/ic_card_active.png'),
                  height: 40,
                  width: 40,
                  color: Colors.bluesecondary,
                ))
              : Expanded(
                  child: Image(
                  image: AssetImage('images/ic_card_desactive.png'),
                  height: 40,
                  width: 40,
                  color: Colors.greyprimary,
                )),
        ],
      ),
    );
  }

  Widget buildFooter(DefaultInfosResponseStations response) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greysecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    side: BorderSide(width: 1, color: Colors.blueprimary),
                    textStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                onPressed: () => {_makePhoneCall()},
                child: Text(
                  'Appelez nous',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.bluesecondary,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    backgroundColor: Colors.blueprimary,
                    textStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          LocalisationScreen(station: response)))
                },
                child: Text(
                  'Localisation',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _makePhoneCall() async {
    print('tel' + '0522310171');
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '0522310171',
    );
    await launchUrl(launchUri);
  }
}
