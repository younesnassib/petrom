import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrom_fidelite/screens/cartescreen.dart';
import 'package:petrom_fidelite/screens/transactions_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/car_response_entity.dart';
import '../models/carte_response_entity.dart';
import '../models/default_infos_entity.dart';
import '../models/session.dart';

class CarteDetails extends StatefulWidget {
  static const screenRoute = '/cartedetails';
  final CarteResponseEntity cardetail;

  const CarteDetails({super.key, required this.cardetail});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CarteDetailssState();
  }
}

class CarteDetailssState extends State<CarteDetails> {
  late DateTime datedebut;
  late DateTime datefin;
  late List Restrictions = [];

  String zones = "";
  String produits = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.cardetail.nomsurlacarte,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(
          color: Colors.blueprimary,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.greysecondary],
              begin: Alignment.topRight),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                buildRows('Pan :', widget.cardetail.pAN),
                buildRows('Nom sur la carte :', widget.cardetail.nomsurlacarte),
                buildRows(
                    'Plafond Journalier :', widget.cardetail.plafondJ + " Dhs"),
                buildRows('Plafonds Hebdomadaire :',
                    widget.cardetail.plafondH + " Dhs"),
                buildRows(
                    'Plafonds Mensuelle :', widget.cardetail.plafondM + " Dhs"),
                buildRows('Zones d' 'utilisation :', zones),
                buildRows('Produits :', produits),
                buildDateAndCheckAll(),
                SizedBox(height: 10),
                buildButton(widget.cardetail)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRowszones(String title, List value) {
    return Column(children: [
      Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Container(
            child: Column(
              children: <Widget>[
                new Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Row(children: value.map((item) => new Text(item)).toList())
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
  }

  Widget buildRows(String title, String value) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.greyprimary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.bluesecondary, // Border color
              width: 1, // Border width
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              child: Row(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blueprimary,
                      ),
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        value,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.bluesecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    datedebut = new DateTime.now();
    datefin = new DateTime.now();
    var testlist = widget.cardetail.restrictiongeo.split("|");
    var testproduit = widget.cardetail.listeproduit.split("|");
    if (testproduit.length > 0) {
      testproduit.removeAt(0);
      for (String i in testproduit) {
        // i.substring(start)
        var list = i.split(",");
        list.removeAt(0);
        i = list[0];
        produits += i + " ";
      }
    }
    if (testlist.length > 0) {
      testlist.removeAt(0);
      for (String i in testlist) {
        // i.substring(start)
        var list = i.split("-");
        list.removeAt(0);
        i = list[0];
        zones += i + " ";
      }
    }
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

  Widget getcupertinodebut(DateTime d) => Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Date debut',
                style: TextStyle(color: Colors.bluesecondary),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.bluesecondary)),
              child: CupertinoButton(
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        '${d.day}-${d.month}-${d.year}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.bluesecondary,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.date_range_outlined,
                          size: 20, color: Colors.bluesecondary)
                    ],
                  ),
                ),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      height: 250,
                      child: DatePickerdebut(d),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Widget getcupertinofin(DateTime d) => Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Date fin',
                style: TextStyle(color: Colors.bluesecondary),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.black)),
              child: CupertinoButton(
                child: Row(children: [
                  Text(
                    '${d.day}-${d.month}-${d.year}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.bluesecondary,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.date_range_outlined, size: 16, color: Colors.bluesecondary)
                ]),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      height: 250,
                      child: DatePickerfin(d),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Widget DatePickerdebut(DateTime d) => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          backgroundColor: Colors.white,
          mode: CupertinoDatePickerMode.date,
          initialDateTime: d,
          onDateTimeChanged: (DateTime newDateTime) {
            setState(() {
              datedebut = newDateTime;
            });
          },
        ),
      );

  Widget DatePickerfin(DateTime d) => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          backgroundColor: Colors.white,
          mode: CupertinoDatePickerMode.date,
          initialDateTime: d,
          onDateTimeChanged: (DateTime newDateTime) {
            setState(() {
              datefin = newDateTime;
            });
          },
        ),
      );

  buildDateAndCheckAll() => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.left,
                'Details de la consommation',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueprimary,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 4,
              ),
            ),
          ),
          Row(children: [
            Expanded(child: getcupertinodebut(datedebut)),
            Expanded(child: getcupertinofin(datefin))
          ]),
        ],
      );

  Widget buildButton(CarteResponseEntity response) {
    return Container(
      color: Colors.bluesecondary,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => CarteScreen(
                      cardetail: response,
                      datedebut:
                          '${datedebut.year}${getmonth(datedebut.month)}${datedebut.day}',
                      datefin:
                          '${datefin.year}${getmonth(datefin.month)}${datefin.day}')))
              .then(
            (result) {
              if (result != null) {}
            },
          );
        },
        child: Text(
          'Rechercher',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.greysecondary,
          ),
        ),
      ),
    );
    ;
  }

// String cardtopass = response.pAN
//     .substring(response.pAN.length - 5, response.pAN.length);
// Navigator.of(context)
//     .pushNamed(CarteScreen.screenRoute, arguments: {
//   "CARDS": cardtopass,
//   'dd':
//       '${datedebut.year}${getmonth(datedebut.month)}${datedebut.day}',
//   "df":
//       '${datefin.year}${getmonth(datefin.month)}${datefin.day}'
// }).then(
//   (result) {
//     if (result != null) {}
//   },
// );
  String getmonth(int month) {
    String lengh = month.toString();
    if (lengh.length == 1) {
      lengh = '0' + lengh;
    }
    return lengh;
  }
}
