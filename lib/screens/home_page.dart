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
                title: const Text('Deconnexion',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueprimary)),
                content: const Text('Voulez-vous vous deconnectez ?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('Non',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueprimary))),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Oui',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueprimary))),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else
          return Future.value(false);
      },
      child: Container(
        color: Colors.blueprimary,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text('Bienvenue',style: TextStyle(
              color: Colors.blueprimary,
              fontWeight: FontWeight.bold
            ),),
            iconTheme: IconThemeData(
              color: Colors.blueprimary, //change your color here
            ),
          ),
          body: IndexedStack(
            children: tabs,
            index: _currentindex,
          ),
          bottomNavigationBar: BottomNavigationBar(

            unselectedItemColor: Colors.green,
            selectedItemColor: Colors.blueprimary,
            currentIndex: _currentindex,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: new Image.asset('images/accueil.png',
                      height: 20, width: 20, color: Colors.grey[500]),
                  activeIcon: new Image.asset('images/accueil.png',
                      height: 20, width: 20, color: Colors.blueprimary),
                  label: 'Acceuil' ),
              BottomNavigationBarItem(

                  backgroundColor: Colors.white,
                  icon: new Image.asset('images/cartebancaire2.png',
                      height: 20, width: 20, color: Colors.grey[500]),
                  activeIcon: new Image.asset('images/cartebancaire2.png',
                      height: 20, width: 20, color: Colors.blueprimary),
                  label: 'Carte'),
              BottomNavigationBarItem(

                  backgroundColor: Colors.white,
                  icon: new Image.asset('images/naviguer.png',
                      height: 20, width: 20, color: Colors.grey[500]),
                  activeIcon: new Image.asset('images/naviguer.png',
                      height: 20, width: 20, color: Colors.blueprimary),
                  label: 'Naviguer'),
              BottomNavigationBarItem(

                  backgroundColor: Colors.white,
                  icon: new Image.asset('images/utilisateurdeprofil.png',
                      height: 20, width: 20, color: Colors.grey[500]),
                  activeIcon: new Image.asset('images/utilisateurdeprofil.png',
                      height: 20, width: 20, color: Colors.blueprimary),
                  label: 'Profil'),
            ],
            selectedLabelStyle: TextStyle(fontSize: 16, color: Colors.blueprimary ,fontWeight: FontWeight.bold),
            onTap: (index) {
              setState(() {
                _currentindex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
