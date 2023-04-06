import 'package:flutter/material.dart';

import '../models/session.dart';

class InformationPersonnels extends StatefulWidget {
  static const screenRoute = '/informationspersonnels';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InformationPersonnelsState();
  }
}

class InformationPersonnelsState extends State<InformationPersonnels> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Mes informations personnels',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          )),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildRows(
                'Nom et Prenom',
                Session.infosUser.response.civilite +
                    ' ' +
                    Session.infosUser.response.nom +
                    ' ' + Session.infosUser.response.prenom),
            buildRows('Date de naissance', Session.infosUser.response.dateActivation),
            buildRows('Sexe', Session.infosUser.response.civilite),
            buildRows('Email', Session.infosUser.response.email),
            buildRows('Type de vehicule', Session.infosUser.response.type),
            buildRows('telephone', Session.infosUser.response.tel)
          ],
        ),
      ),
    );
  }

  Widget buildRows(String title, String value) => Column(children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              child: Row(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.grey,
          height: 1,
        )
      ]);
}
