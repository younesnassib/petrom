import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/account_creation_screen.dart';
import 'package:petrom_fidelite/screens/authentification_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/default_infos_entity.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);
  static final url = 'http://card.petrom.ma/api/AttarikPro.php/';

  @override
  State<FirstScreen> createState() => _FirstScreenState();


  static Future<void> setInfosInStorage(DefaultInfosEntity Infos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('user', jsonEncode(Infos));
  }

  static Future<DefaultInfosEntity> getInfosInStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('user') != null) {
      Map<String, dynamic> json = jsonDecode(pref.getString('user')!);
      DefaultInfosEntity user = DefaultInfosEntity.fromJson(json);
      Session.informations = user;
      return Session.informations;
    } else {
      try {
        Map<String, String> qParams = {
          'todo': 'TEMPLATE',
          'key': 'lks@k!rkjjcs662P655h',
          'version': '0',
        };
        final response = await get(Uri.parse(url).replace(queryParameters: qParams));
        final jsonData = jsonDecode(response.body);
        DefaultInfosEntity ARE = DefaultInfosEntity.fromJson(jsonData);
        print(ARE.response.toString());
        if (ARE.header.status == 200) {
          setInfosInStorage(ARE);
          Session.informations = ARE;
        }
        return Session.informations;
      } catch (err) {
        return Session.informations;
      }
    }
  }
}

class _FirstScreenState extends State<FirstScreen> {
  late DefaultInfosEntity defaultresponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Image(
                  width: double.infinity,
                  image: AssetImage('images/photopetrom.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(flex: 1, child: Container())
            ],
          ),
          Column(children: [
            const Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 40, top: 100, right: 40),
                child: Text(
                  textAlign: TextAlign.center,
                  'Notre ambition est d’accompagner la progression de nos clients et de contribuer pleinement au développement durable du Royaume',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  maxLines: 4,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
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
                          image: AssetImage('images/petrom_logo.png'),
                          height: 60,
                          width: 60,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Bienvenue à Petrom',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Decouvrez tous nos produits et services incontournables',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          maxLines: 3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Card(
                                color: Colors.red,
                                child: FlatButton(
                                  height: 30,
                                  onPressed: () => authentication(context),
                                  child: Text(
                                    'Se connecter',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Card(
                                color: Colors.blue,
                                child: FlatButton(
                                  height: 30,
                                  onPressed: () => accountCreation(context),
                                  child: Text(
                                    'Créer un compte',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Mode Demonstration',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }

  accountCreation(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AccountCreationPage.screenRoute,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  authentication(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AuthentificationPage.screenRoute,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    FirstScreen.getInfosInStorage();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FirstScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: const [
        Expanded(
          flex: 5,
          child: Center(
            child: Image(
              image: AssetImage('images/petrom_logo.png'),
              height: 200,
              width: 200,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Text('70 ANS, UNE HISTOIRE POUR UN AVENIR',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
            ),
          ),
        )
      ]),
    );
  }
}
