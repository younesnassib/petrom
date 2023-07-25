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
            )),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
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
                          return const Center(child: CircularProgressIndicator());
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
    );
    ;
  }

  Widget buildProduct(TransactionsEntity response) => Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8,
        shadowColor: Colors.grey[50],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  Text(response.sTATION),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      textAlign: TextAlign.center,
                      response.p,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      textAlign: TextAlign.center,
                      response.m.toString(),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ]),
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
        .toList();
  }
}
