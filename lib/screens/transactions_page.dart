import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/car_response_entity.dart';
import 'package:petrom_fidelite/screens/alertes_screen.dart';
import 'package:petrom_fidelite/screens/car_add.dart';
import 'package:petrom_fidelite/screens/home_page.dart';

import '../models/carte_response_entity.dart';
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

  late Future<CarResponseEntity> carsresponse;

  final url = 'http://card.petrom.ma/api/AttarikPro.php/';

  @override
  Widget build(BuildContext context) {
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
                      child: FutureBuilder<TransactionsEntity>(
                        future: gettransactions(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.response.length,
                              itemBuilder: (context, i) {
                                return buildProduct(snapshot.data!.response[i]);
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
    );
    ;
  }

  Widget buildProduct(TransactionsResponse response) => Material(
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

  Future<TransactionsEntity> gettransactions() async {
    try {
      String passwd = Session.generateMd5('4276').toString();
      Map<String, String> qParams = {
        'todo': 'DETAILS',
        'key': 'lks@k!rkjjcs662P655h',
        'U': '0623504276',
        'P': passwd,
        'DD': '2000021',
        'DF': '2023021',
        'CARDS': '21983',
      };
      final response =
          await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      print(jsonData.toString());
      return TransactionsEntity.fromJson(jsonData);
    } catch (err) {
      return new TransactionsEntity();
    }
  }



}
