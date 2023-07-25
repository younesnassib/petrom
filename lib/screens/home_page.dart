import 'package:flutter/material.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/alertes_screen.dart';
import 'package:petrom_fidelite/screens/carte_first.dart';
import 'package:petrom_fidelite/screens/cartescreen.dart';
import 'package:petrom_fidelite/screens/pcard_auth.dart';
import 'package:petrom_fidelite/screens/profil.dart';
import 'package:petrom_fidelite/screens/stations_list.dart';
import 'package:petrom_fidelite/screens/test.dart';

import 'acceuil.dart';
import 'car_screen.dart';
import 'information_personnels.dart';
import 'localisation_screen.dart';

class HomePage extends StatefulWidget {
  static const screenRoute = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;
  final tabs = [
    Center(child: Acceuil()),
    Center(child: Session.infosUser.data.user.codeSap != '' ? CarteFirsrScreen() : PcardAuthPage()),
    Center(child: StationsListPage()),
    Center(child: InformationPersonnels()),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Deconnexion'),
                content: const Text('Voulez-vous vou deconnectez ?'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('Non')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Oui')),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else
          return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Bienvenue'),
        ),
        backgroundColor: Colors.white,
        body: IndexedStack(
          children: tabs,
          index: _currentindex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(
                icon: new Image.asset('images/accueil.png',
                    height: 20, width: 20, color: Colors.grey[500]),
                backgroundColor: Colors.grey[100],
                label: 'Acceuil'),
            BottomNavigationBarItem(
                icon: new Image.asset('images/cartebancaire2.png',
                    height: 20, width: 20, color: Colors.grey[500]),
                backgroundColor: Colors.grey[100],
                label: 'Carte'),
            BottomNavigationBarItem(
                icon: new Image.asset('images/naviguer.png',
                    height: 20, width: 20, color: Colors.grey[500]),
                backgroundColor: Colors.grey[100],
                label: 'Naviguer'),
            BottomNavigationBarItem(
                icon: new Image.asset('images/utilisateurdeprofil.png',
                    height: 20, width: 20, color: Colors.grey[500]),
                backgroundColor: Colors.grey[100],
                label: 'Profil'),
          ],
          selectedLabelStyle: TextStyle(fontSize: 22, color: Colors.black),
          fixedColor: Colors.grey[500],
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
        ),
      ),
    );
  }
}
