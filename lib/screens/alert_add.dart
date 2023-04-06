import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/alertes_screen.dart';
import 'package:petrom_fidelite/screens/first_page.dart';
import '../models/car_add_entity.dart';
import 'car_screen.dart';

class AlerteAddPage extends StatefulWidget {
  static const screenRoute = '/ajouteralerte';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AlerteAddPageState();
  }
}

class AlerteAddPageState extends State<AlerteAddPage> {
  DateTime date = new DateTime.now();
  bool isChecked = true;
  late CarAddEntity caraddresponse;
  var NomController = new TextEditingController();
  var KilometrageController = new TextEditingController();
  var CarburantController = new TextEditingController();
  var VoitureController = new TextEditingController();
  var MarqueController = new TextEditingController();
  var CapacitereservoirController = new TextEditingController();
  var MatriculeController = new TextEditingController();
  var numerodeclencheur = new TextEditingController();
  var apartirController = new TextEditingController();
  var chaqueController = new TextEditingController();
  var descriptionController = new TextEditingController();
  final url = 'http://card.petrom.ma/api/AttarikPro.php/';

  String typealerte = '';
  String declencher = '';
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
          'Mes Alertes',
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
            flex: 9,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(children: [
                  buildRows('Type alerte'),
                  buildRows('Matricule'),
                  buildCheckRow(),
                  buildAlerteWidget()
                ]),
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
                  onPressed: () => {addalerte()},
                  child: const Text(
                    'Ajouter une alerte',
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
                  style: const TextStyle(
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
    } else if (title == "Type alerte") {
      return DropdownButton<String>(
          isExpanded: true,
          value: typealerte,
          items: getTypeAlertesPickerItems()
              .map((item) =>
                  DropdownMenuItem<String>(value: item, child: Text(item)))
              .toList(),
          onChanged: (item) => setState(() => typealerte = item!));
    } else if (title == "A partir du Km") {
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        controller: apartirController,
      );
    } else if (title == "Déclencher le") {
      return CupertinoButton(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${date.day}-${date.month}-${date.year}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => SizedBox(
              height: 250,
              child: DatePicker(),
            ),
          );
        },
      );
    } else if (title == "Chaque") {
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        controller: chaqueController,
      );
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
    } else if (title == "Description") {
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
        controller: descriptionController,
      );
    } else {
      return TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
      );
    }
  }

  List<String> getTypeAlertesPickerItems() {
    List<String> itemsCurrency = [];
    for (var currency in Session.informations.response.services) {
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

  List<String> getDeclencherChaque() {
    List<String> itemsCurrency = ["Jour(s)", "Mois", "Annees"];
    return itemsCurrency;
  }

  @override
  void initState() {
    // TODO: implement initState

    loadinfos();
    marque = Session
        .informations.response.marquevehicules[indextypevoiture].marque[0];
    typealerte = Session.informations.response.services[0];
    typevoiture = Session.informations.response.marquevehicules[0].nom;
    declencher = "Jour(s)";
    super.initState();
  }

  void loadinfos() {
    if (Session.informations == null) {
      FirstScreen.getInfosInStorage();
    }
  }

  addalerte() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    String passwd = Session.generateMd5('4276').toString();
    try {
      // nom_alert,distance_declenche,id,date_declenche,frequence_date,frequence_distance,description,type_frequence_temps,type
      String type = '';
      if (isChecked) {
        type = '1';
      } else {
        type = '2';
      }
      String typefrequencetemps = '';
      if (declencher=="Mois") {
        typefrequencetemps = '2';
      } else if(declencher=="Annees"){
        typefrequencetemps = '3';
      }else typefrequencetemps='1';

      String month = '';
      if (date.month.toString().length==1) {
        month="0"+date.month.toString();
      } else month=date.month.toString();

      Map<String, String> qParams = {
        'todo': 'INSERTALERT',
        'U': '0623504276',
        'P': passwd,
        'key': 'lks@k!rkjjcs662P655h',
        'matricule': 'ww5788',
        'nom_alert': typealerte,
        'distance_declenche': chaqueController.text,
        'id': '0',
        'date_declenche': '${date.year}${month}${date.day}',
        'frequence_date': '1',
        'frequence_distance': apartirController.text,
        'description': descriptionController.text,
        'type_frequence_temps': typefrequencetemps,
        'type': type,
      };
      final response =
          await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      CarAddEntity ARE = CarAddEntity.fromJson(jsonData);
      Navigator.of(context).pop();
      setState(
        () {
          caraddresponse = ARE;
          if (caraddresponse.header.status == 200) {
            toalertes(context);
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

  void toalertes(BuildContext context) {
    Navigator.of(context).pushNamed(AlertePage.screenRoute).then(
      (result) {
        if (result != null) {}
      },
    );
  }

  Widget buildCheckRow() => Container(
        child: Row(
          children: <Widget>[
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.blue,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text(
              'Frequence par date',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )
          ],
        ),
      );

  Widget buildeDeclencherChaque(String title) => Container(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '1'),
                    controller: numerodeclencheur,
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                      value: declencher,
                      items: getDeclencherChaque()
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (item) => setState(() => declencher = item!)),
                )
              ],
            ),
          ],
        ),
      );

  Widget DatePicker() => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          backgroundColor: Colors.white,
          mode: CupertinoDatePickerMode.date,
          initialDateTime: date,
          onDateTimeChanged: (DateTime newDateTime) {
            setState(() => date = newDateTime);
          },
        ),
      );

  Widget buildAlerteWidget() {
    if (isChecked) {
      return Column(children: [
        buildeDeclencherChaque('Declencher chaque'),
        buildRows('Déclencher le'),
        buildRows('Description')
      ]);
    } else
      return Column(
        children: [
          buildRows('A partir du Km'),
          buildRows('Chaque'),
          buildRows('Description'),
        ],
      );
  }
}
