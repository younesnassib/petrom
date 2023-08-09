import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petrom_fidelite/models/car_response_entity.dart';
import '../models/deletcar_entity.dart';
import '../models/session.dart';
import '../models/transactions_entity.dart';

enum SampleItem { itemOne, itemTwo }

class TransactionsPage extends StatefulWidget {
  static const screenRoute = '/transactions';

  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  late DeletcarEntity DE;
  late String datedebuttopass;
  late String datefintopass;
  late String cartetopass;
  late Future<CarResponseEntity> carsresponse;

  final url = 'http://card.petrom.ma/api/AttarikPro.php/';

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    datedebuttopass = arguments['dd'];
    datefintopass = arguments['df'];
    cartetopass = arguments['CARDS'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Mes transactions',
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
              begin: Alignment.topCenter),
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
                        child: FutureBuilder<List<TransactionsEntity>>(
                          future: gettransactions(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, i) {
                                  return buildProduct(snapshot.data![i]);
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
            )),
          ],
        ),
      ),
    );
    ;
  }

  Widget buildProduct(TransactionsEntity response) => Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              colors: [Colors.greysecondary, Colors.greyprimary],
              begin: Alignment.topCenter),
          border: Border.all(
            color: Colors.bluesecondary, // Border color
            width: 2, // Border width
          ),
        ),
        child: Expanded(
          child: Column(
            children: [
              buildRows("Station :", response.sTATION),
              buildRows("Produit :", response.p),
              buildRows("Montant :", response.m),
              buildRows("Date :", response.dH),
            ],
          ),
        ),
      );

  Future<List<TransactionsEntity>> gettransactions() async {
    final response = await http.post(
      Uri.parse(Session.url + 'detailscards'),
      headers: <String, String>{
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Bearer ' + Session.infosUser.data.token,
      },
      body: jsonEncode(<String, String>{
        'date_debut': datedebuttopass,
        'date_fin': datefintopass,
        'pan': cartetopass,
        'code_sap': Session.infosUser.data.user.codeSap
      }),
    );
    return (json.decode(response.body) as List)
        .map((i) => TransactionsEntity.fromJson(i))
        .toList()
        .reversed
        .toList();
  }

  Widget buildRows(String title, String value) => Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Container(
              child: Row(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueprimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.bluesecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]);
}
