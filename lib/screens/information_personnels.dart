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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.greysecondary],
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildRows('Date de naissance', Session.infosUser.data.user.dateBirth),
                buildRows('Email', Session.infosUser.data.user.email),
                buildRows('Telephone', Session.infosUser.data.user.phone),
                buildRows('Profession', Session.infosUser.data.user.profession),
                buildRows('Adresse', Session.infosUser.data.user.adresse),
                buildRows('Ville', Session.infosUser.data.user.city),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildRows(String title, String value) => Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.greyprimary,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.bluesecondary, // Border color
          width: 1, // Border width
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Row(
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.blueprimary,
                  ),
                ),
              ),
              new Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: new Text(
                    value,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.bluesecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

}
