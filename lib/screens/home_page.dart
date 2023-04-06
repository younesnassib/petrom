import 'package:flutter/material.dart';
import 'package:petrom_fidelite/screens/alertes_screen.dart';
import 'package:petrom_fidelite/screens/carte_first.dart';
import 'package:petrom_fidelite/screens/cartescreen.dart';
import 'package:petrom_fidelite/screens/profil.dart';

import 'acceuil.dart';
import 'car_screen.dart';
import 'localisation_screen.dart';

class HomePage extends StatefulWidget {
  static const screenRoute = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex=0;
  final tabs=[
    Center(child: Acceuil()),
    Center(child: CarteFirsrScreen()),
    Center(child: LocalisationScreen()),
    Center(child: ProfilPage()),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Bienvenue'),
      ),
      backgroundColor: Colors.white,
      body: tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(
              icon: new Image.asset('images/accueil.png', height: 20, width: 20,color: Colors.grey[500]),
              backgroundColor: Colors.grey[100],
              label: 'Acceuil'),
          BottomNavigationBarItem(
              icon: new Image.asset('images/cartebancaire2.png', height: 20, width: 20,color: Colors.grey[500]),
              backgroundColor: Colors.grey[100],
              label: 'Carte'),
          BottomNavigationBarItem(
              icon: new Image.asset('images/naviguer.png', height: 20, width: 20,color: Colors.grey[500]),
              backgroundColor: Colors.grey[100],
              label: 'Naviguer'),
          BottomNavigationBarItem(
              icon: new Image.asset('images/utilisateurdeprofil.png', height: 20, width: 20,color: Colors.grey[500]),
              backgroundColor: Colors.grey[100],
              label: 'Profil'),
        ],
        selectedLabelStyle: TextStyle(fontSize: 22,color: Colors.black),
        fixedColor: Colors.grey[500],
        onTap: (index){
          setState((){
            _currentindex=index;
          });
        },
      ),
    );
  }
}


