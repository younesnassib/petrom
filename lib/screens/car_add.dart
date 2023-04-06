import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/first_page.dart';
import '../models/car_add_entity.dart';
import '../models/carte_response_entity.dart';
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
  final url = 'http://card.petrom.ma/api/AttarikPro.php/';

  String typecarburant = '';
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
                child: FlatButton(
                  height: 30,
                  onPressed: () => addcar(),
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
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        controller: MatriculeController,
      );
    } else
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
      );
  }

  List<String> getTypeCarburantsPickerItems() {
    List<String> itemsCurrency = [];
    for (var currency in Session.informations.response.carburants) {
      itemsCurrency.add(currency);
    }
    return itemsCurrency;
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
    for (var currency in Session.cardsuser.response) {
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
    carte = Session.cardsuser.response[0].pAN;
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
    String passwd = Session.generateMd5('4276').toString();
    try {
      Map<String, String> qParams = {
        'todo': 'INSERTVEHICULE',
        'U': '0623504276',
        'P': passwd,
        'key': 'lks@k!rkjjcs662P655h',
        'marque': marque,
        'motorisation': typevoiture,
        'carburant': typecarburant,
        'pan_carte': carte,
        'op': 'insert',
        'matricule': MatriculeController.text,
        'libelle': NomController.text,
        'reservoir': CapacitereservoirController.text,
        'km_courant': KilometrageController.text,
      };
      final response = await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      CarAddEntity ARE = CarAddEntity.fromJson(jsonData);
      Navigator.of(context).pop();
      setState(
        () {
          caraddresponse = ARE;
          if (caraddresponse.header.status == 200) {
            tocars(context);
          } else {}
        },
      );
    } catch (err) {}
  }

  generateMd5(String data) {
    var bytesToHash = utf8.encode(data);
    var md5Digest = md5.convert(bytesToHash);
    return md5Digest;
  }

  void tocars(BuildContext context) {
    Navigator.of(context).pushNamed(CarPage.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }
}
