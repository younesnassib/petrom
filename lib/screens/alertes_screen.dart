import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petrom_fidelite/models/car_response_entity.dart';
import 'package:petrom_fidelite/models/deletealerte_entity.dart';
import 'package:petrom_fidelite/screens/alert_add.dart';
import 'package:petrom_fidelite/screens/alert_update.dart';
import 'package:petrom_fidelite/tools/Common.dart';

import '../models/alerte_response_entity.dart';
import '../models/session.dart';
import 'car_add.dart';
import 'home_page.dart';

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
    return WillPopScope(
      onWillPop: () async {
        return tohome(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Mes alertes',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueprimary,
              fontWeight: FontWeight.bold
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                        children: [
                          Scrollbar(
                            child: FutureBuilder<List<AlerteResponseEntity>>(
                              future: getalertes(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, i) {
                                      print(snapshot.data![i].toString());
                                      return buildProduct(snapshot.data![i]);
                                    },
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                    ],
                  ),
                ),
              ),

              buildButton()

            ],
          ),
        ),
      ),
    );
    ;
  }

  // Widget buildProduct(AlerteResponseEntity response) => Material(
  //       child: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         width: 180,
  //         child: Row(children: [
  //           Expanded(
  //             flex: 9,
  //             child: Column(
  //               children: [
  //                 // SizedBox(height: 10),
  //                 // Row(
  //                 //   children: [
  //                 //     Text(response.nomAlert),
  //                 //   ],
  //                 // ),
  //                 // SizedBox(height: 10),
  //                 // Text(Common.getLastDateAlerte(response)),
  //                 // SizedBox(height: 10),
  //                 // Text(Common.getNextDateAlert(response)),
  //                 // SizedBox(height: 10),
  //               ],
  //             ),
  //           ),
  //           Expanded(flex: 1, child: MenuWidget(response))
  //         ]),
  //       ),
  //     );
  Widget buildProduct(AlerteResponseEntity response) => Container(
        margin: EdgeInsets.symmetric(vertical: 5),
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
        child: Row(children: [
          Expanded(
            flex: 9,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Image(
                        image: AssetImage('images/alerte.png'),
                        height: 50,
                        width: 50,
                        color: Colors.blueprimary),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'Nom de l alerte :',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueprimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Expanded(flex: 1, child: Text(response.nomAlert)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text('Matricule :',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueprimary,
                                fontWeight: FontWeight.bold,
                              ),)),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  response.matricule,
                                  maxLines: 2,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text('Derniere Alerte :',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueprimary,
                                fontWeight: FontWeight.bold,
                              ),)),
                            Expanded(
                              flex: 1,
                              child: Text(
                                Common.getLastDateAlerte(response),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text('Alerte Suivante :',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueprimary,
                                fontWeight: FontWeight.bold,
                              ),)),
                            Expanded(
                              flex: 1,
                              child: Text(
                                Common.getNextDateAlert(response),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.centerRight, child: MenuWidget(response)),
          )
        ]),
      );

  Future<List<AlerteResponseEntity>> getalertes() async {
    final response = await http.get(
        Uri.parse(Session.url +
            'alerts/' +
            Session.infosUser.data.user.id.toString()),
        headers: <String, String>{
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization': 'Bearer ' + Session.infosUser.data.token
        });
    return (json.decode(response.body) as List)
        .map((i) => AlerteResponseEntity.fromJson(i))
        .toList();
  }

  PopupMenuButton MenuWidget(AlerteResponseEntity response) {
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
          // onTap: () => showDialog(
          //   context: context,
          //   builder: (context) => AlertDialog(
          //     title: Text('Modification d' 'alerte'),
          //     content: Text('Voulez vous vraiment modifier cette alerte ?'),
          //     actions: [
          //       TextButton(
          //           onPressed: () => Navigator.pop(context),
          //           child: Text('Non')),
          //       TextButton(
          //           onPressed: update(context, response), child: Text('Oui'))
          //     ],
          //   ),
          // ),
          onTap: () {
            Future.delayed(
              const Duration(seconds: 0),
              () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Modification d' 'alerte',style: TextStyle(color:Colors.blueprimary,fontWeight: FontWeight.bold)),
                  content: Text('Voulez vous vraiment modifier cette alerte ?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Non',style: TextStyle(color:Colors.blueprimary,fontWeight: FontWeight.bold))),
                    TextButton(
                      child: Text('Oui',style: TextStyle(color:Colors.blueprimary,fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pop(context);
                        update(context, response);
                      },
                    )
                  ],
                ),
              ),
            );
          },
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
                  title: Text('Suppression d' 'alerte',style: TextStyle(color:Colors.blueprimary,fontWeight: FontWeight.bold)),
                  content:
                      Text('Voulez vous vraiment supprimer cette alerte ?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Non',style: TextStyle(color:Colors.blueprimary,fontWeight: FontWeight.bold))),
                    TextButton(
                      child: Text('Oui',style: TextStyle(color:Colors.blueprimary,fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pop(context);
                        deletealerte(response.id.toInt().toString());
                        // Navigate to second route when tapped.
                      },
                    )
                  ],
                ),
              ),
            );
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
      // String passwd = Session.generateMd5('4276').toString();
      // Map<String, String> qParams = {
      //   'todo': 'DELETEALERTE',
      //   'key': 'lks@k!rkjjcs662P655h',
      //   'U': '0623504276',
      //   'P': passwd,
      //   'id_alert': id,
      // };
      // final response =
      //     await get(Uri.parse(url).replace(queryParameters: qParams));
      // final jsonData = jsonDecode(response.body);
      // print(jsonData.toString());
      // DeletealerteEntity ARE = DeletealerteEntity.fromJson(jsonData);
      var headers = {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Bearer ' + Session.infosUser.data.token
      };
      var request = http.MultipartRequest(
          'DELETE', Uri.parse('http://192.168.140.122/api/alerts/' + id));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        refresh(context);
      } else {
        print(response.reasonPhrase);
      }
      ;
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

  update(BuildContext context, AlerteResponseEntity response) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AlerteUpdatePage(alertedetail: response)));
  }

  tohome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.screenRoute);
  }
  Widget buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.bluesecondary,
      width: double.infinity,
      child: TextButton(
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
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.greysecondary,
          ),
        ),
      ),
    );
    ;
  }
}
