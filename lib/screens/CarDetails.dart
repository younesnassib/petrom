import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/car_response_entity.dart';
import '../models/default_infos_entity.dart';
import '../models/session.dart';

class CarDetails extends StatefulWidget {
  static const screenRoute = '/stationdetails';
  final CarResponseResponse cardetail;

  const CarDetails({super.key, required this.cardetail});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CarDetailsState();
  }
}

class CarDetailsState extends State<CarDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.cardetail.libelle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            )),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildRows('Carburant', widget.cardetail.carburant),
                  buildRows('Matricule', widget.cardetail.matricule),
                  buildRows('Marque', widget.cardetail.marque),
                  buildRows('Motorisation', widget.cardetail.motorisation),
                  buildRows('Kilometrage courant', widget.cardetail.kmCourrant),
                  buildRows('Modèle', widget.cardetail.modele),
                  buildRows('Carte', widget.cardetail.panCarte),
                  buildRows('Réservoir', widget.cardetail.reservoir),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildRows(String title, String value) => Column(children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              child: Row(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.grey,
          height: 1,
        )
      ]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  static void launchWaze(double lat, double lng) async {
    var url = 'waze://?ll=${lat.toString()},${lng.toString()}';
    var fallbackUrl =
        'https://waze.com/ul?ll=${lat.toString()},${lng.toString()}&navigate=yes';
    try {
      bool launched =
          await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }

  Widget buildRowsIcon(String title, String value) => Column(children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              child: Row(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Container(child: getImage(value)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.grey,
          height: 1,
        )
      ]);

  getImage(String value) {
    if (value == '1') {
      return Image(
        image: AssetImage('images/greenCheck.png'),
        height: 20,
        width: 20,
      );
    } else
      return Image(
        image: AssetImage('images/redChek.png'),
        height: 20,
        width: 20,
      );
  }

}
