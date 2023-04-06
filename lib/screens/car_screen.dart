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
import 'CarDetails.dart';

enum SampleItem { itemOne, itemTwo }

class CarPage extends StatefulWidget {
  static const screenRoute = '/monvehicule';

  const CarPage({Key? key}) : super(key: key);

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
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
        title: Text('Mes vehicules',
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
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Scrollbar(
                          child: FutureBuilder<CarResponseEntity>(
                            future: getcars(),
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
                                    });
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
          Expanded(
              flex: 1,
              child: Center(
                child: Card(
                  color: Colors.blue,
                  child: FlatButton(
                    height: 30,
                    onPressed: () {
                      getcartes();
                    },
                    child: Text(
                      'Ajouter un vehicule',
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

  Widget buildProduct(CarResponseResponse response) => Material(

        borderRadius: BorderRadius.circular(10),
        elevation: 8,
        shadowColor: Colors.grey[50],
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarDetails(cardetail: response)));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    Text(response.libelle),
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        textAlign: TextAlign.center,
                        response.motorisation,
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        textAlign: TextAlign.center,
                        response.carburant,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: MenuWidget(response)),
              )
            ]),
          ),
        ),
      );

  Future<CarResponseEntity> getcars() async {
    try {
      String passwd = Session.generateMd5('4276').toString();
      Map<String, String> qParams = {
        'todo': 'MESVEHICULES',
        'key': 'lks@k!rkjjcs662P655h',
        'U': '0623504276',
        'P': passwd,
      };
      final response =
          await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      print(jsonData.toString());
      return CarResponseEntity.fromJson(jsonData);
    } catch (err) {
      return new CarResponseEntity();
    }
  }

  PopupMenuButton MenuWidget(CarResponseResponse response) {
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
            onTap: () => Future.delayed(
                const Duration(seconds: 0),
                () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Suppression de vehicule'),
                        content: Text(
                            'Voulez vous vraiment supprimer ce vehicule ?'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Non')),
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Oui'))
                        ],
                      ),
                    ),),),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('Supprimer'),
          onTap: () {
            Future.delayed(
              const Duration(seconds: 0),
              () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Suppression de vehicule'),
                  content: Text('Voulez vous vraiment supprimer ce vehicule ?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Non')),
                    TextButton(
                      child: Text('Oui'),
                      onPressed: () {
                        Navigator.pop(context);
                        deletecar(response.matricule);
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

  Future deletecar(String matricule) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      String passwd = Session.generateMd5('4276').toString();
      Map<String, String> qParams = {
        'todo': 'DELETEVEHICULE',
        'key': 'lks@k!rkjjcs662P655h',
        'U': '0623504276',
        'P': passwd,
        'matricule': matricule,
      };
      final response =
          await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      print(jsonData.toString());
      DeletcarEntity ARE = DeletcarEntity.fromJson(jsonData);
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
    Navigator.of(context).pushNamed(CarPage.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }

  Future<CarteResponseEntity> getcadrtes() async {
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

  getcartes() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    String passwd = Session.generateMd5('4276').toString();
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
      Navigator.of(context).pop();
      setState(
        () {
          if (Session.cardsuser.header.status == 200) {
            tocaradd(context);
          } else {}
        },
      );
    } catch (err) {}
  }

  void tocaradd(BuildContext context) {
    Navigator.of(context).pushNamed(CarAdd.screenRoute).then(
      (result) {
        if (result != null) {}
      },
    );
  }
}
