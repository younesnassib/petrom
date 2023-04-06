import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/carte_response_entity.dart';
import 'package:petrom_fidelite/screens/cartescreen.dart';

import '../models/cartehome.dart';
import '../models/historiquecarte_entity.dart';
import '../models/session.dart';

class CarteFirsrScreen extends StatefulWidget {
  CarteFirsrScreen({Key? key}) : super(key: key);

  @override
  State<CarteFirsrScreen> createState() => _CarteFirstScreenState();
}

class _CarteFirstScreenState extends State<CarteFirsrScreen> {
  late Future<CarteResponseEntity> cardsFuture;
  final url = 'http://card.petrom.ma/api/AttarikPro.php/';
  late DateTime datedebut;
  late String cartesstring;
  bool isChecked = false;

  late DateTime datefin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Scrollbar(
                      child: FutureBuilder<CarteResponseEntity>(
                        future: cardsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.response.length,
                              itemBuilder: (context, i) {
                                return Column(
                                  children: [
                                    buildDateAndCheckAll(
                                        snapshot.data!.response),
                                    buildProduct(snapshot.data!.response[i])
                                  ],
                                );
                              },
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                        .pushNamed(CarteScreen.screenRoute, arguments: {
                      "CARDS": '21983',
                      'dd':
                          '${datedebut.year}${getmonth(datedebut.month)}${datedebut.day}',
                      "df":
                          '${datefin.year}${getmonth(datefin.month)}${datefin.day}'
                    }).then(
                      (result) {
                        if (result != null) {}
                      },
                    );
                  },
                  child: const Text(
                    'Rechercher',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
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
      return CarteResponseEntity.fromJson(jsonData);
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
        'DD': '${datedebut.day}-${datedebut.month}-${datedebut.year}',
        'DF': '${datefin.day}-${datefin.month}-${datefin.year}',
        'CARDS': '21983',
      };
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
        color: Colors.grey[50],
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
          child: Row(children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            response.pAN,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            response.nOM,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            buildCheckRow(response)
          ]),
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
    cardsFuture = getcartes();
  }

  Widget getcupertinodebut(DateTime d) => Container(
        width: MediaQuery.of(context).size.width * (100 / 100),
        child: Center(
          child: CupertinoButton(
            child: Row(
              children: [
                Text(
                  '${d.day}-${d.month}-${d.year}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 8, // <-- SEE HERE
                ),
                Icon(Icons.date_range_outlined, size: 16, color: Colors.black)
              ],
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
        child: Row(children: [
          Text(
            '${d.day}-${d.month}-${d.year}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 8, // <-- SEE HERE
          ),
          Icon(Icons.date_range_outlined, size: 16, color: Colors.black)
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
      );

  Widget buildCheckRow(CarteResponseResponse response) => Container(
        child: Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.blue,
          value: response.cheked,
          onChanged: (bool? value) {
            setState(
              () {
                response.cheked = value!;
              },
            );
          },
        ),
      );

  buildDateAndCheckAll(List<CarteResponseResponse> response) => Column(
        children: [
          Row(children: [
            Expanded(child: Center(child: getcupertinodebut(datedebut))),
            Expanded(child: Center(child: getcupertinofin(datefin)))
          ]),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(flex: 4, child: Text('Seletionner tout')),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isChecked = value!;
                            for (int j = 0; j < response.length; j++) {
                              response[j].cheked = isChecked;
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );

  String getmonth(int month) {
    String lengh = month.toString();
    if (lengh.length == 1) {
      lengh = '0' + lengh;
    }
    return lengh;
  }
}
