import 'package:flutter/material.dart';
import 'package:petrom_fidelite/screens/alertes_screen.dart';
import 'package:petrom_fidelite/screens/authentification_page.dart';
import 'package:petrom_fidelite/screens/car_screen.dart';
import 'package:petrom_fidelite/screens/choix_langue.dart';
import 'package:petrom_fidelite/screens/information_personnels.dart';
import 'package:petrom_fidelite/screens/informations_paiement.dart';
import 'package:petrom_fidelite/screens/parametres_application.dart';

import '../models/session.dart';
import 'home_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Image(
                        image: AssetImage('images/user.png'),
                        height: 60,
                        width: 60,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          textAlign: TextAlign.center,
                          Session.infosUser.response.civilite +
                              ' ' +
                              Session.infosUser.response.nom +
                              ' ' +
                              Session.infosUser.response.prenom,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                    buildTitle('Details de mon compte'),
                    buildRows('Mes informations personnels', 1),
                    buildRows('Mes informations de paiement', 2),
                    buildRows('Mon vehicule', 3),
                    buildRows('Mes Alertes', 6),
                    buildTitle('Mes Paramètres'),
                    buildRows('Paramètres de l' 'application', 4),
                    buildRows('Choix de langue', 5)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Mes Paramètres;;Paramètres de l'application / Choix de langue
  Widget buildRows(String title, int i) => InkWell(
        onTap: () {
          switch (i) {
            case 1:
              {
                Navigator.of(context).pushNamed(InformationPersonnels.screenRoute).then(
                  (result) {
                    if (result != null) {
                    }
                  },
                );
              }
              break;

            case 2:
              {
                Navigator.of(context).pushNamed(InformationsPaiement.screenRoute).then(
                      (result) {
                    if (result != null) {
                    }
                  },
                );
              }
              break;
            case 3:
              {
                Navigator.of(context).pushNamed(CarPage.screenRoute).then(
                      (result) {
                    if (result != null) {
                    }
                  },
                );
              }
              break;
            case 4:
              {
                Navigator.of(context).pushNamed(ParametresApplication.screenRoute).then(
                      (result) {
                    if (result != null) {
                    }
                  },
                );
              }
              break;
            case 5:
              {
                Navigator.of(context).pushNamed(ChoixLangue.screenRoute).then(
                      (result) {
                    if (result != null) {
                    }
                  },
                );
              }
              break;
            case 6:
              {
                Navigator.of(context).pushNamed(AlertePage.screenRoute).then(
                      (result) {
                    if (result != null) {
                    }
                  },
                );
              }
              break;
          }
        },
        child: Column(children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Container(
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 6,
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
                        child: new Image.asset('images/right.png',
                            height: 13, width: 13, color: Colors.black)),
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
        ]),
      );

  Widget buildTitle(String title) => Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                        flex: 6,
                        child: new Text(
                          title,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
