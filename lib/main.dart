import 'package:flutter/material.dart';
import 'package:petrom_fidelite/screens/ForgetPassword1.dart';
import 'package:petrom_fidelite/screens/ForgetPassword2.dart';
import 'package:petrom_fidelite/screens/ForgetPassword3.dart';
import 'package:petrom_fidelite/screens/SMSPage.dart';
import 'package:petrom_fidelite/screens/account_creation_screen.dart';
import 'package:petrom_fidelite/screens/alert_add.dart';
import 'package:petrom_fidelite/screens/alertes_screen.dart';
import 'package:petrom_fidelite/screens/attarikpro_detail.dart';
import 'package:petrom_fidelite/screens/authentification_page.dart';
import 'package:petrom_fidelite/screens/car_add.dart';
import 'package:petrom_fidelite/screens/car_screen.dart';
import 'package:petrom_fidelite/screens/carte_first.dart';
import 'package:petrom_fidelite/screens/cartescreen.dart';
import 'package:petrom_fidelite/screens/choix_langue.dart';
import 'package:petrom_fidelite/screens/first_page.dart';
import 'package:petrom_fidelite/screens/home_page.dart';
import 'package:petrom_fidelite/screens/information_personnels.dart';
import 'package:petrom_fidelite/screens/informations_paiement.dart';
import 'package:petrom_fidelite/screens/parametres_application.dart';
import 'package:petrom_fidelite/screens/pcard_auth.dart';
import 'package:petrom_fidelite/screens/product_screen.dart';
import 'package:petrom_fidelite/screens/station_details.dart';
import 'package:petrom_fidelite/screens/stations_list.dart';
import 'package:petrom_fidelite/screens/transactions_page.dart';
import 'package:petrom_fidelite/screens/vehicule_statistique.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        fontFamily: 'FontMain',
        appBarTheme: AppBarTheme(
          elevation: 0, // This removes the shadow from all App Bars.
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MyHomePage(),
        AuthentificationPage.screenRoute: (ctx) => AuthentificationPage(),
        HomePage.screenRoute: (ctx) => HomePage(),
        InformationPersonnels.screenRoute: (ctx) => InformationPersonnels(),
        InformationsPaiement.screenRoute: (ctx) => InformationsPaiement(),
        CarPage.screenRoute: (ctx) => CarPage(),
        ParametresApplication.screenRoute: (ctx) => ParametresApplication(),
        ChoixLangue.screenRoute: (ctx) => ChoixLangue(),
        CarAdd.screenRoute: (ctx) => CarAdd(),
        AlertePage.screenRoute: (ctx) => AlertePage(),
        AlerteAddPage.screenRoute: (ctx) => AlerteAddPage(),
        // CarteScreen.screenRoute: (ctx) => CarteScreen(),
        TransactionsPage.screenRoute: (ctx) => TransactionsPage(),
        ProductScreen.screenRoute: (ctx) => ProductScreen(),
        StationsListPage.screenRoute: (ctx) => StationsListPage(),
        AttarikProDetail.screenRoute: (ctx) => AttarikProDetail(),
        AccountCreationPage.screenRoute: (ctx) => AccountCreationPage(),
        SMSPage.screenRoute: (ctx) => SMSPage(),
        PcardAuthPage.screenRoute: (ctx) => PcardAuthPage(),
        CarteFirsrScreen.screenRoute: (ctx) => CarteFirsrScreen(),
        ForgetPassword1.screenRoute: (ctx) => ForgetPassword1(),
        ForgetPassword2.screenRoute: (ctx) => ForgetPassword2(),
        ForgetPassword3.screenRoute: (ctx) => ForgetPassword3()
        // TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(_manageFavorite, _isFovarite),
        // FiltersScreen.screenRoute: (ctx) => FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
