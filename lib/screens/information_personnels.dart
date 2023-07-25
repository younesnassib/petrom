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
      body: Center(
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
