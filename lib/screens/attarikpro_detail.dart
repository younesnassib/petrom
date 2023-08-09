import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:petrom_fidelite/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/default_infos_entity.dart';
import '../models/session.dart';

class AttarikProDetail extends StatefulWidget {
  static const screenRoute = '/attarikprodetail';

  const AttarikProDetail({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AttarikProDetailState();
  }
}

class AttarikProDetailState extends State<AttarikProDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Attarik PRO',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueprimary,
                fontWeight: FontWeight.bold
              )),
          iconTheme: IconThemeData(
            color: Colors.blueprimary, //change your color here
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        image: AssetImage('images/Attarik_pro_image.jpeg'),
                        height: 200,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(children: [
                    gettextbold('C’est une carte privative dédiée aux professionnels de la route offrant des remises exceptionnelles sur les carburants et les lubrifiants:'),
                    gettext('- 20 centimes TTC par litre sur le prix du carburant affiché à la pompe.'),
                    gettext('- 15% sur le prix public TTC de nos lubrifiants.'),
                    gettext('- Plus de 100 stations équipées en ATTARIK PRO.'),
                    gettext('- Près de 150 milles clients actifs.'),
                    gettext('- Un déploiement réussi dans toutes les régions ayant accueilli le produit ATTARIK PRO.'),
                    gettext('- Distribuée par les agents ATTARIK PRO'),
                  ]),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//  C’est une carte privative dédiée aux professionnels de la route offrant des remises exceptionnelles sur les carburants et les lubrifiants:

//  20 centimes TTC par litre sur le prix du carburant affiché à la pompe.
//  15% sur le prix public TTC de nos lubrifiants.

//   Plus de 100 stations équipées en ATTARIK PRO.

//   Près de 150 milles clients actifs.

//  Un déploiement réussi dans toutes les régions ayant accueilli le produit ATTARIK PRO.

//  Distribuée par les agents ATTARIK PRO

  Widget gettext(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget gettextbold(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18, color: Colors.blueprimary, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
