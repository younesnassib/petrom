import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petrom_fidelite/models/carte_response_entity.dart';
import 'package:petrom_fidelite/screens/carte_details.dart';
import 'package:petrom_fidelite/screens/cartescreen.dart';

import '../models/cartehome.dart';
import '../models/historiquecarte_entity.dart';
import '../models/session.dart';

class CarteFirsrScreen extends StatefulWidget {
  static const screenRoute = '/cartefirst';

  CarteFirsrScreen({Key? key}) : super(key: key);

  @override
  State<CarteFirsrScreen> createState() => _CarteFirstScreenState();
}

class _CarteFirstScreenState extends State<CarteFirsrScreen> {
  List<CarteResponseEntity> listcards = [];
  final url = 'http://card.petrom.ma/api/AttarikPro.php/';
  late DateTime datedebut;
  late String cartesstring;
  bool isChecked = false;
  late DateTime datefin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.greysecondary],
                begin: Alignment.topCenter),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Scrollbar(
                            child: FutureBuilder<List<CarteResponseEntity>>(
                              future: getcartes(
                                  Session.infosUser.data.user.codeSap),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  listcards = snapshot.data!;
                                  return Column(
                                    children: [
                                      getTitle(),
                                      ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, i) {
                                          return Column(
                                            children: [
                                              buildProduct(listcards![i])
                                            ],
                                          );
                                        },
                                      ),
                                    ],
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
            ],
          ),
        ),
      ),
    );
  }

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

  Future<List<CarteResponseEntity>> getcartes(String CODESAP) async {
    final response = await http.post(
      Uri.parse(Session.url + 'cards'),
      headers: <String, String>{
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Bearer ' + Session.infosUser.data.token,
      },
      body: jsonEncode(<String, String>{
        'code_sap': CODESAP,
      }),
    );
    Session.cardsuser = (json.decode(response.body) as List)
        .map((i) => CarteResponseEntity.fromJson(i))
        .toList();
    listcards = (json.decode(response.body) as List)
        .map((i) => CarteResponseEntity.fromJson(i))
        .toList();
    return listcards;
  }

  Widget buildProduct(CarteResponseEntity response) => Container(
        decoration: BoxDecoration(
          color: Colors.greyprimary,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.bluesecondary, // Border color
            width: 1, // Border width
          ),
        ),
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(children: [
            Expanded(flex: 1, child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle, // Set shape to circular
                ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Image.asset('images/cards.png',
                    height: 20, width: 20, color: Colors.blueprimary),
              ),
            )),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'PAN :',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          response.pAN,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueprimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nom :',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueprimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          response.nomsurlacarte,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // buildCheckRow(response)
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {

                  toDetails(response);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image(
                    image: AssetImage('images/arrowright.png'),
                    color: Colors.blueprimary,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            )
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
  }

  Widget getcupertinodebut(DateTime d) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text('Date debut'),
          ),
          Align(
            alignment: Alignment.centerLeft,
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
        ],
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

  Widget getcupertinofin(DateTime d) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text('Date fin'),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CupertinoButton(
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
            ),
          ),
        ],
      );

  // buildDateAndCheckAll(List<CarteResponseEntity> response) => Column(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(vertical: 10),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 10),
  //             child: Row(children: [
  //               Expanded(child: getcupertinodebut(datedebut)),
  //               Expanded(child: getcupertinofin(datefin))
  //             ]),
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.symmetric(horizontal: 10),
  //           child: Row(
  //             children: [
  //               // Expanded(flex: 4, child: Text('Seletionner tout')),
  //               // Expanded(
  //               //   flex: 1,
  //               //   child: Align(
  //               //     alignment: Alignment.centerRight,
  //               //     child: Checkbox(
  //               //       checkColor: Colors.white,
  //               //       activeColor: Colors.blue,
  //               //       value: isChecked,
  //               //       onChanged: (bool? value) {
  //               //         setState(
  //               //           () {
  //               //             isChecked = value!;
  //               //             for (int j = 0; j < response.length; j++) {
  //               //               response[j].cheked = isChecked;
  //               //             }
  //               //           },
  //               //         );
  //               //       },
  //               //     ),
  //               //   ),
  //               // ),
  //             ],
  //           ),
  //         )
  //       ],
  //     );

  Widget getTitle() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          textAlign: TextAlign.left,
          'Mes Cartes',
          style: TextStyle(
            fontSize: 16,
            color: Colors.blueprimary,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 4,
        ),
      ),
    );
  }

  String getmonth(int month) {
    String lengh = month.toString();
    if (lengh.length == 1) {
      lengh = '0' + lengh;
    }
    return lengh;
  }

  void toDetails(CarteResponseEntity response) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CarteDetails(cardetail: response)));
  }
}
