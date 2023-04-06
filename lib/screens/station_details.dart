import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/default_infos_entity.dart';
import '../models/session.dart';

class StationDetails extends StatefulWidget {
  static const screenRoute = '/stationdetails';
  final DefaultInfosResponseStations stationRecup;

  const StationDetails({super.key, required this.stationRecup});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StationDetailsState();
  }
}

class StationDetailsState extends State<StationDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.stationRecup.nom,
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
                  buildRows('Nom', widget.stationRecup.nom),
                  buildRows('Adresse', widget.stationRecup.adresse),
                  buildRows('ville', widget.stationRecup.ville),
                  buildRowsIcon('Lavage', widget.stationRecup.lavage),
                  buildRowsIcon('Restaurant', widget.stationRecup.restaurant),
                  buildRowsIcon('Cafe', widget.stationRecup.cafe),
                  buildRowsIcon('Shop', widget.stationRecup.shop),
                  buildRowsIcon('Vidange', widget.stationRecup.vidange),
                  buildRowsIcon('Entretien', widget.stationRecup.entretien),
                  buildRowsIcon('tpe', widget.stationRecup.tpe),
                  buildRowsIcon('card', widget.stationRecup.card),
                  buildRowsIcon('tel', widget.stationRecup.tel),
                  buildRowsIcon('elephant', widget.stationRecup.elephant),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: FlatButton(
                color: Colors.blue,
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(children: [DialogBody()]);
                    }),
                child: Text(
                  'itinéraire',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
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

  Widget DialogBody() => Container(
        child: Column(
          children: [
            Text(widget.stationRecup.nom,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: TextButton(
                      onPressed: () {
                        launchWaze(double.parse(widget.stationRecup.latitude),
                            double.parse(widget.stationRecup.longitude));
                      },
                      child: Center(
                          child: Text('WAZE',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              )))),
                )),
                Expanded(
                    child: Container(
                  child: TextButton(
                      onPressed: () {
                        navigateTo(double.parse(widget.stationRecup.latitude),
                            double.parse(widget.stationRecup.longitude));
                      },
                      child: Center(
                          child: Text('GOOGLE MAP',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              )))),
                ))
              ],
            )
          ],
        ),
      );
}
