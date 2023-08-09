import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/first_page.dart';
import '../models/car_add_entity.dart';
import '../models/car_response_entity.dart';
import '../models/carte_response_entity.dart';
import 'car_screen.dart';

class CarUpdate extends StatefulWidget {
  static const screenRoute = '/modifiervehicule';
  final CarResponseEntity cardetail;

  const CarUpdate({super.key, required this.cardetail});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CarUpdateState();
  }
}

class CarUpdateState extends State<CarUpdate> {
  @override
  initState() {
    // TODO: implement initState
    marque = Session
        .informations.response.marquevehicules[indextypevoiture].marque[0];
    typecarburant = Session.informations.response.carburants[0];
    typevoiture = Session.informations.response.marquevehicules[0].nom;
    carte = Session.cardsuser[0].pAN;
    NomController.text = widget.cardetail.libelle;
    KilometrageController.text = widget.cardetail.kmCourant.toInt().toString();
    typecarburant = widget.cardetail.carburant;
    typevoiture = widget.cardetail.motorisation;
    switch (typevoiture) {
      case 'Poids Lourd':
        indextypevoiture = 1;
        break;
      case 'Motos':
        indextypevoiture = 2;
        break;
    }
    marque = widget.cardetail.marque;
    CapacitereservoirController.text = widget.cardetail.reservoir;
    MatriculeController.text = widget.cardetail.matricule;
    super.initState();
  }

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
          'Modifier le vehicule',
          style:
              TextStyle(color: Colors.blueprimary, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.blueprimary, //change your color here
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.greysecondary],
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
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
            UpdateCarButton()
          ],
        ),
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
                    fontSize: 14,
                    color: Colors.blueprimary,
                    fontWeight: FontWeight.bold,
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
        style: TextStyle(fontSize: 14),
      );
    } else if (title == "Kilométrage") {
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        controller: KilometrageController,
        style: TextStyle(fontSize: 14),
      );
    } else if (title == "Type de carburant") {
      return DropdownButton<String>(
          isExpanded: true,
          value: typecarburant,
          items: getTypeCarburantsPickerItems()
              .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 14),
                  )))
              .toList(),
          onChanged: (item) => setState(() => typecarburant = item!));
    } else if (title == "Type de voiture") {
      return DropdownButton<String>(
        isExpanded: true,
        value: typevoiture,
        items: getTypeVoiturePickerItems()
            .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(fontSize: 14),
                )))
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
              .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 14),
                  )))
              .toList(),
          onChanged: (item) => setState(() => marque = item!));
    } else if (title == "Carte") {
      return DropdownButton<String>(
          isExpanded: true,
          value: carte,
          items: getCartePickerItems()
              .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 14),
                  )))
              .toList(),
          onChanged: (item) => setState(() => carte = item!));
    } else if (title == "Capacité de réservoir") {
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        controller: CapacitereservoirController,
        style: TextStyle(fontSize: 14),
      );
    } else if (title == "Matricule") {
      return Text(
        widget.cardetail.matricule,
        style: TextStyle(fontSize: 14),
      );
    } else
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        style: TextStyle(fontSize: 14),
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
    for (var currency in Session.cardsuser) {
      types.add(currency.pAN);
    }
    return types;
  }

  void loadinfos() {
    if (Session.informations == null) {
      FirstScreen.getInfosInStorage();
    }
  }

  // updatecar() async {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Center(child: CircularProgressIndicator());
  //       });
  //   String passwd = Session.generateMd5('4276').toString();
  //   try {
  //     Map<String, String> qParams = {
  //       'todo': 'INSERTVEHICULE',
  //       'U': '0623504276',
  //       'P': passwd,
  //       'key': 'lks@k!rkjjcs662P655h',
  //       'marque': marque,
  //       'motorisation': typevoiture,
  //       'carburant': typecarburant,
  //       'pan_carte': carte,
  //       'matricule': MatriculeController.text,
  //       'libelle': NomController.text,
  //       'reservoir': CapacitereservoirController.text,
  //       'km_courant': KilometrageController.text,
  //     };
  //     final response =
  //         await get(Uri.parse(url).replace(queryParameters: qParams));
  //     final jsonData = jsonDecode(response.body);
  //     CarAddEntity ARE = CarAddEntity.fromJson(jsonData);
  //     Navigator.of(context).pop();
  //     setState(
  //       () {
  //         caraddresponse = ARE;
  //         if (caraddresponse.header.status == 200) {
  //           tocars(context);
  //         } else {}
  //       },
  //     );
  //   } catch (err) {}
  // }

  generateMd5(String data) {
    var bytesToHash = utf8.encode(data);
    var md5Digest = md5.convert(bytesToHash);
    return md5Digest;
  }

  void tocars(BuildContext context) {
    Navigator.pushReplacementNamed(context, CarPage.screenRoute);
  }

  updatecar2() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    try {
      // Map<String, String> qParams = {
      //   'todo': 'INSERTVEHICULE',
      //   'U': '0623504276',
      //   'P': passwd,
      //   'key': 'lks@k!rkjjcs662P655h',
      //   'marque': marque,
      //   'motorisation': typevoiture,
      //   'carburant': typecarburant,
      //   'pan_carte': carte,
      //   'matricule': MatriculeController.text,
      //   'libelle': NomController.text,
      //   'reservoir': CapacitereservoirController.text,
      //   'km_courant': KilometrageController.text,
      // };
      // final response =
      // await get(Uri.parse(url).replace(queryParameters: qParams));
      // final jsonData = jsonDecode(response.body);
      // CarAddEntity ARE = CarAddEntity.fromJson(jsonData);
      // Navigator.of(context).pop();
      // setState(
      //       () {
      //     caraddresponse = ARE;
      //     if (caraddresponse.header.status == 200) {
      //       tocars(context);
      //     } else {}
      //   },
      // );

      print('marque' + marque);
      print('motorisation' + typevoiture);
      print('carburant' + typecarburant);
      print('pan_carte' + carte);
      print('matricule' + MatriculeController.text);
      print('libelle' + NomController.text);
      print('reservoir' + CapacitereservoirController.text);
      print('km_courant' + KilometrageController.text);
      print('modele' + carte);
      print('widget.cardetail.id.toInt().toString()' +
          widget.cardetail.id.toInt().toString());
      // final response = await http.post(
      //   Uri.parse(Session.url +
      //       'update_vehicule/' +
      //       widget.cardetail.id.toInt().toString()),
      //   headers: <String, String>{
      //     'Accept': 'application/vnd.api+json',
      //     'Content-Type': 'application/vnd.api+json',
      //     'Authorization': 'Bearer ' + Session.infosUser.data.token
      //   },
      //   body: {
      var headers = {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Bearer ' + Session.infosUser.data.token
      };
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(Session.url +
              'update_vehicule/' +
              widget.cardetail.id.toInt().toString()));
      request.fields.addAll({
        'marque': marque,
        'motorisation': typevoiture,
        'carburant': typecarburant,
        'pan_carte': carte,
        'matricule': MatriculeController.text,
        'libelle': NomController.text,
        'reservoir': CapacitereservoirController.text,
        'km_courant': KilometrageController.text,
        'modele': carte,
      });
      // var request = http.Request(
      //     'PUT',
      //     Uri.parse(Session.url +
      //         'vehicules/' +
      //         widget.cardetail.id.toInt().toString()));
      // request.bodyFields = {
      //   'marque': marque,
      //   'motorisation': typevoiture,
      //   'carburant': typecarburant,
      //   'pan_carte': carte,
      //   'matricule': MatriculeController.text,
      //   'libelle': NomController.text,
      //   'reservoir': CapacitereservoirController.text,
      //   'km_courant': KilometrageController.text,
      //   'modele': carte,
      // };
      // print(request.bodyFields.toString());
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();
      // print(response.toString());
      // setState(
      //   () {
      //     if (response.statusCode == 200) {
      //       tocars(context);
      //     } else {
      //       print(response.reasonPhrase);
      //     }
      //   },
      // );
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      Navigator.of(context).pop();
      print(response.toString());
      setState(() {
        if (response.statusCode == 200) {
          tocars(context);
        } else {}
      });
    } catch (err) {}
  }

  Widget UpdateCarButton() => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueprimary,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.greyprimary, // Border color
            width: 2, // Border width
          ),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            updatecar2();
          },
          child: Text(
            'Modifier',
            style: TextStyle(
                fontSize: 16,
                color: Colors.greyprimary,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
}
