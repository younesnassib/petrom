import 'dart:convert';
import 'dart:ffi';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/first_page.dart';
import '../models/car_add_entity.dart';
import '../models/carte_response_entity.dart';
import '../tools/Common.dart';
import 'car_screen.dart';

class CarAdd extends StatefulWidget {
  static const screenRoute = '/ajoutervehicule';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CarAddState();
  }
}

class CarAddState extends State<CarAdd> {
  late CarAddEntity caraddresponse;
  var NomController = new TextEditingController();
  var KilometrageController = new TextEditingController();
  var CarburantController = new TextEditingController();
  var VoitureController = new TextEditingController();
  var MarqueController = new TextEditingController();
  var CarteController = new TextEditingController();
  var CapacitereservoirController = new TextEditingController();
  var MatriculeController = new TextEditingController();
  var Matricule2Controller = new TextEditingController();
  var Matricule3Controller = new TextEditingController();

  // final url = 'http://card.petrom.ma/api/AttarikPro.php/';
  final url = Session.url + 'vehicules';
  String typecarburant = '';
  String arabMatricule = '';
  String typevoiture = '';
  String marque = '';
  String carte = '';
  int indextypevoiture = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Mes vehicules',
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
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildRows('Nom'),
                    buildRows('Kilométrage'),
                    buildRows('Type de carburant'),
                    buildRows('Type de voiture'),
                    buildRows('Marque'),
                    buildRows('Carte'),
                    buildRows('Capacité de réservoir'),
                    buildRows('Matricule')
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Card(
                color: Colors.blue,
                child: TextButton(
                  //   'matricule': MatriculeController.text +
                  // '.' +
                  // Matricule +
                  //   '.' +
                  //   Matricule3Controller.text,
                  //   'marque': marque,
                  //   'reservoir': CapacitereservoirController.text,
                  //   'pan_carte': carte,
                  //   'modele': carte,
                  //   'motorisation': typevoiture,
                  //   'carburant': typecarburant,
                  //   'libelle': NomController.text,
                  //   'reservoir': CapacitereservoirController.text,
                  //   'km_courant': KilometrageController.text,
                  onPressed: () => {
                    if (NomController.text == '' ||
                        CapacitereservoirController.text == '' ||
                        KilometrageController.text == '' ||
                        MatriculeController.text == '' ||
                        Matricule3Controller.text == '')
                      {Common.showToast('Veuillez remplire tous les champs ')}
                    else
                      addcar()
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
            ),
          )
        ],
      ),
    );
  }

  Widget buildRows(String title) => Container(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            showwidget(title)
          ],
        ),
      );

  Widget showwidget(String title) {
    if (title == "Nom") {
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        controller: NomController,
      );
    } else if (title == "Kilométrage") {
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        controller: KilometrageController,
      );
    } else if (title == "Type de carburant") {
      return DropdownButton<String>(
          isExpanded: true,
          value: typecarburant,
          items: getTypeCarburantsPickerItems()
              .map((item) =>
                  DropdownMenuItem<String>(value: item, child: Text(item)))
              .toList(),
          onChanged: (item) => setState(() => typecarburant = item!));
    } else if (title == "Type de voiture") {
      return DropdownButton<String>(
        isExpanded: true,
        value: typevoiture,
        items: getTypeVoiturePickerItems()
            .map((item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
            .toList(),
        onChanged: (item) => setState(
          () => {
            typevoiture = item!,
            indextypevoiture = getTypeVoiturePickerItems().indexOf(item),
            marque = Session.informations.response
                .marquevehicules[indextypevoiture].marque[0]
          },
        ),
      );
    } else if (title == "Marque") {
      return DropdownButton<String>(
          isExpanded: true,
          value: marque,
          items: getMarquePickerItems(indextypevoiture)
              .map((item) =>
                  DropdownMenuItem<String>(value: item, child: Text(item)))
              .toList(),
          onChanged: (item) => setState(() => marque = item!));
    } else if (title == "Carte") {
      return DropdownButton<String>(
          isExpanded: true,
          value: carte,
          items: getCartePickerItems()
              .map((item) =>
                  DropdownMenuItem<String>(value: item, child: Text(item)))
              .toList(),
          onChanged: (item) => setState(() => carte = item!));
    } else if (title == "Capacité de réservoir") {
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        controller: CapacitereservoirController,
      );
    } else if (title == "Matricule") {
      return Container(
        width: double.infinity,
        child: Row(children: [
          Expanded(
            flex: 5,
            child: TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 5,
              decoration: InputDecoration(border: InputBorder.none),
              controller: MatriculeController,
            ),
          ),
          Expanded(flex: 1, child: Text(textAlign: TextAlign.center, "-")),
          Expanded(
              flex: 1,
              child: DropdownButton<String>(
                  isExpanded: true,
                  value: arabMatricule,
                  items: getArabMatriculePickerItems()
                      .map((item) => DropdownMenuItem<String>(
                          value: item, child: Text(item)))
                      .toList(),
                  onChanged: (item) => setState(() => arabMatricule = item!))),
          Expanded(flex: 1, child: Text(textAlign: TextAlign.center, "-")),
          Expanded(
              flex: 2,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 2,
                decoration: InputDecoration(border: InputBorder.none),
                controller: Matricule3Controller,
              )),
        ]),
      );
    } else
      return TextField(
        decoration: InputDecoration(border: InputBorder.none),
      );
  }

  List<String> getTypeCarburantsPickerItems() {
    List<String> itemsCurrency = [];
    for (var currency in Session.informations.response.carburants) {
      itemsCurrency.add(currency);
    }
    return itemsCurrency;
  }

  List<String> getArabMatriculePickerItems() {
    return ["أ", "ب", "د", "ه", "و", "ط", "ي"];
  }

  List<String> getTypeVoiturePickerItems() {
    List<String> itemsCurrency = [];
    for (var currency in Session.informations.response.marquevehicules) {
      itemsCurrency.add(currency.nom);
    }
    return itemsCurrency;
  }

  List<String> getMarquePickerItems(int type) {
    List<String> itemsCurrency = [];
    for (var currency
        in Session.informations.response.marquevehicules[type].marque) {
      itemsCurrency.add(currency);
    }
    return itemsCurrency;
  }

  List<String> getCartePickerItems() {
    List<String> types = [];
    for (var currency in Session.cardsuser) {
      types.add(currency.pAN);
    }
    return types;
  }

  @override
  initState() {
    // TODO: implement initState
    marque = Session
        .informations.response.marquevehicules[indextypevoiture].marque[0];
    typecarburant = Session.informations.response.carburants[0];
    typevoiture = Session.informations.response.marquevehicules[0].nom;
    carte = Session.cardsuser[0].pAN;
    arabMatricule = "أ";
    super.initState();
  }

  void loadinfos() {
    if (Session.informations == null) {
      FirstScreen.getInfosInStorage();
    }
  }

  addcar() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      String Matricule = '';
      switch (arabMatricule) {
        case "أ":
          Matricule = 'A';
          break;
        case "ب":
          Matricule = 'B';
          break;
        case "د":
          Matricule = 'D';
          break;
        case "ه":
          Matricule = 'H';
          break;
        case "و":
          Matricule = 'O';
          break;
        case "ط":
          Matricule = 'T';
          break;
        case "ي":
          Matricule = 'Y';
          break;
      }
      var headers = {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Bearer ' + Session.infosUser.data.token
      };
      var request = MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      Map<String, String> qParams = {
        // 'todo': 'INSERTVEHICULE',
        // 'U': '0623504276',
        // 'P': Session.password,
        // 'key': 'lks@k!rkjjcs662P655h',
        // 'marque': marque,
        // 'motorisation': typevoiture,
        // 'carburant': typecarburant,
        // 'pan_carte': carte,
        // 'op': 'insert',
        // 'matricule': MatriculeController.text +
        //     '.' +
        //     Matricule +
        //     '.' +
        //     Matricule3Controller.text,
        // 'libelle': NomController.text,
        // 'reservoir': CapacitereservoirController.text,
        // 'km_courant': KilometrageController.text,
        'matricule': MatriculeController.text +
            '.' +
            Matricule +
            '.' +
            Matricule3Controller.text,
        'marque': marque,
        'reservoir': CapacitereservoirController.text,
        'pan_carte': carte,
        'modele': carte,
        'motorisation': typevoiture,
        'carburant': typecarburant,
        'libelle': NomController.text,
        'reservoir': CapacitereservoirController.text,
        'km_courant': KilometrageController.text,
      };
      request.fields.addAll(qParams);
      final response = await request.send();
      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        print('test bien');
        tocars(context);
      } else {
        print('test non bien');
      }
    } catch (err) {
      print('test crash');
    }
  }

  void tocars(BuildContext context) {
    Navigator.pushReplacementNamed(context, CarPage.screenRoute);
  }
}
