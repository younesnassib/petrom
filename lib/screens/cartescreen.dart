import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/carte_response_entity.dart';
import 'package:petrom_fidelite/screens/transactions_page.dart';

import '../models/cartehome.dart';
import '../models/historiquecarte_entity.dart';
import '../models/session.dart';
import 'carte_first.dart';
import 'carte_first.dart';
import 'carte_first.dart';
import 'carte_first.dart';
import 'carte_first.dart';
import 'carte_first.dart';
import 'carte_first.dart';

class CarteScreen extends StatefulWidget {
  CarteScreen({Key? key}) : super(key: key);
  static const screenRoute = '/cartescreen';

  @override
  State<CarteScreen> createState() => _CarteScreenState();
}

class _CarteScreenState extends State<CarteScreen> {
  final url = 'http://card.petrom.ma/api/AttarikPro.php/';
  late DateTime datedebut;
  late String cardsStringtopass;
  late String datedebuttopass;
  late String datefintopass;

  late DateTime datefin;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    cardsStringtopass = arguments['CARDS'];
    datedebuttopass = arguments['dd'];
    datefintopass = arguments['df'];
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      'Cartes ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 2 / 3,
                  width: double.infinity,
                  child: FutureBuilder<CarteResponseEntity>(
                    future: getcartes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PageView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.response.length,
                            itemBuilder: (context, i) {
                              return Column(children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      buildProduct(snapshot.data!.response[i])
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: buildtransactions(
                                      snapshot.data!.response[i]),
                                )
                              ]);
                            });
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: Card(
                  color: Colors.blue,
                  child: FlatButton(
                    height: 30,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(TransactionsPage.screenRoute, arguments: {
                        "CARDS": '21983',
                      }).then(
                        (result) {
                          if (result != null) {}
                        },
                      );
                    },
                    child: Text(
                      'Rechercher',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ))
        ]),
      ),
    ));
  }

  Widget buildtransactions(CarteResponseResponse response) => Container(
        child: FutureBuilder<HistoriquecarteEntity>(
          future: getcarteshistoriques(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.response.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          buildTitleRows(),
                          buildRows(
                              snapshot.data!.response[0].p,
                              snapshot.data!.response[0].q.toString(),
                              snapshot.data!.response[0].m.toString()),
                          buildRows(
                              snapshot.data!.response[1].p,
                              snapshot.data!.response[1].q.toString(),
                              snapshot.data!.response[1].m.toString()),
                          buildRows(
                              snapshot.data!.response[2].p,
                              snapshot.data!.response[2].q.toString(),
                              snapshot.data!.response[2].m.toString()),
                          buildRows(
                              snapshot.data!.response[3].p,
                              snapshot.data!.response[3].q.toString(),
                              snapshot.data!.response[3].m.toString()),
                          buildRows(
                              snapshot.data!.response[4].p,
                              snapshot.data!.response[4].q.toString(),
                              snapshot.data!.response[4].m.toString()),
                          buildRows(
                              snapshot.data!.response[5].p,
                              snapshot.data!.response[5].q.toString(),
                              snapshot.data!.response[5].m.toString()),
                          buildRows(
                              snapshot.data!.response[6].p,
                              snapshot.data!.response[6].q.toString(),
                              snapshot.data!.response[6].m.toString()),
                        ],
                      )
                    ],
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      );

  Widget buildTitleRows() => Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new Text(
                'Produit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new Text(
                'Quantite',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new Text(
                'Montant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildRows(String title, String quantite, String montant) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new Text(
                quantite,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new Text(
                montant,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );

  Future<CarteResponseEntity> getcartes() async {
    try {
      String passwd = Session.generateMd5('4276').toString();
      Map<String, String> qParams = {
        'todo': 'LISTCARDS',
        'key': 'lks@k!rkjjcs662P655h',
        'U': '0623504276',
        'P': passwd,
      };
      final response =
          await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      print(jsonData.toString());
      Session.cardsuser = CarteResponseEntity.fromJson(jsonData);
      return Session.cardsuser;
    } catch (err) {
      return new CarteResponseEntity();
    }
  }

  Future<HistoriquecarteEntity> getcarteshistoriques() async {
    try {
      String passwd = Session.generateMd5('4276').toString();
      Map<String, String> qParams = {
        'todo': 'RECAPE',
        'key': 'lks@k!rkjjcs662P655h',
        'U': '0623504276',
        'P': passwd,
        'DD': datedebuttopass,
        'DF': datefintopass,
        'CARDS': cardsStringtopass,
      };
      print('DD${datedebuttopass}DF${datefintopass}CARDS${cardsStringtopass}');
      final response =
          await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      print(jsonData.toString());

      return HistoriquecarteEntity.fromJson(jsonData);
    } catch (err) {
      return new HistoriquecarteEntity();
    }
  }

  Widget buildProduct(CarteResponseResponse response) => Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/carte_blue.jpg'), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image(
                image: AssetImage('images/petrom_logo.png'),
                height: 90,
                width: 90,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(response.pAN,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right),
                      Text(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        response.nOM,
                      ),
                    ],
                  ),
                ),
              ),
            )
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

  @override
  initState() {
    // TODO: implement initState

    datedebut = new DateTime.now();
    datefin = new DateTime.now();
    super.initState();
  }

  Widget getcupertinodebut(DateTime d) => CupertinoButton(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${d.day}-${d.month}-${d.year}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => SizedBox(
              height: 250,
              child: DatePickerdebut(d),
            ),
          );
        },
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

  Widget getcupertinofin(DateTime d) => CupertinoButton(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${d.day}-${d.month}-${d.year}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => SizedBox(
              height: 250,
              child: DatePickerfin(d),
            ),
          );
        },
      );
}
