import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/car_response_entity.dart';
import 'package:petrom_fidelite/models/deletealerte_entity.dart';
import 'package:petrom_fidelite/screens/alert_add.dart';

import '../models/alerte_response_entity.dart';
import '../models/session.dart';
import 'car_add.dart';

enum SampleItem { itemOne, itemTwo }

class AlertePage extends StatefulWidget {
  static const screenRoute = '/alertes';

  const AlertePage({Key? key}) : super(key: key);

  @override
  State<AlertePage> createState() => _AlertePageState();
}

class _AlertePageState extends State<AlertePage> {
  late DeletealerteEntity DE;
  late Future<CarResponseEntity> carsresponse;

  final url = 'http://card.petrom.ma/api/AttarikPro.php/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Mes alertes',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Scrollbar(
                        child: FutureBuilder<AlerteResponseEntity>(
                          future: getalertes(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.response.length,
                                itemBuilder: (context, i) {
                                  return buildProduct(
                                      snapshot.data!.response[i]);
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
                          .pushNamed(AlerteAddPage.screenRoute)
                          .then(
                        (result) {
                          if (result != null) {}
                        },
                      );
                    },
                    child: Text(
                      'Ajouter une alerte',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
    ;
  }

  Widget buildProduct(AlerteResponseResponse response) => Material(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: 180,
          child: Row(children: [
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(response.nomAlert),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      textAlign: TextAlign.center,
                      response.dateDeclenche,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 10)
                ],
              ),
            ),
            Expanded(flex: 1, child: MenuWidget(response))
          ]),
        ),
      );

  Future<AlerteResponseEntity> getalertes() async {
    try {
      String passwd = Session.generateMd5('4276').toString();
      Map<String, String> qParams = {
        'todo': 'MESALERTES',
        'key': 'lks@k!rkjjcs662P655h',
        'U': '0623504276',
        'P': passwd,
      };
      final response =
          await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      print(jsonData.toString());
      return AlerteResponseEntity.fromJson(jsonData);
    } catch (err) {
      return new AlerteResponseEntity();
    }
  }

  PopupMenuButton MenuWidget(AlerteResponseResponse response) {
    SampleItem? selectedMenu;
    return PopupMenuButton<SampleItem>(
      initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('Modifier'),
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Modification d''alerte'),
              content: Text('Voulez vous vraiment modifier cette alerte ?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Non')),
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text('Oui'))
              ],
            ),
          ),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('Supprimer'),
          onTap: () {
            Future.delayed(
                const Duration(seconds: 0),
                () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Suppression d''alerte'),
                        content: Text(
                            'Voulez vous vraiment supprimer cette alerte ?'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Non')),
                          TextButton(
                            child: Text('Oui'),
                            onPressed: () {
                              Navigator.pop(context);
                              deletealerte(response.id);
                              // Navigate to second route when tapped.
                            },
                          )
                        ],
                      ),
                    ));
          },
        ),
      ],
    );
  }

  Future deletealerte(String id) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      String passwd = Session.generateMd5('4276').toString();
      Map<String, String> qParams = {
        'todo': 'DELETEALERTE',
        'key': 'lks@k!rkjjcs662P655h',
        'U': '0623504276',
        'P': passwd,
        'id_alert': id,
      };
      final response = await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      print(jsonData.toString());
      DeletealerteEntity ARE = DeletealerteEntity.fromJson(jsonData);
      Navigator.of(context).pop();
      setState(() {
        DE = ARE;
        if (DE.header.status == 200) {
          refresh(context);
        } else {}
      });
    } catch (err) {}
  }

  refresh(BuildContext context) {
    Navigator.of(context).pushNamed(AlertePage.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }
}
