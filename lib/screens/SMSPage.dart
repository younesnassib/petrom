import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/authentification_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as IO;
import '../models/accountcreation.dart';
import '../models/auth_response_entity.dart';

class SMSPage extends StatefulWidget {
  static const screenRoute = '/sms';

  const SMSPage({Key? key}) : super(key: key);

  @override
  State<SMSPage> createState() => _SMSPageState();
}

class _SMSPageState extends State<SMSPage> {
  final url = 'http://card.petrom.ma/api/AttarikPro.php/';
  late AuthResponseEntity authresponse;
  var codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.red,
              ),
            ),
            Expanded(flex: 4, child: Container())
          ]),
          Column(children: [
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 40, top: 70, right: 40),
                child: Text(
                  textAlign: TextAlign.center,
                  'Bienvenue',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 4,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Card(
                margin: const EdgeInsets.only(left: 15, right: 15),
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
                          'Merci de saisir le code de vérification envoyé à votre numéro de téléphone',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: codeController,
                              decoration: InputDecoration(
                                hintText: 'Code',
                                border: InputBorder.none,
                              ),
                            )),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Card(
                                color: Colors.blue,
                                child: TextButton(
                                  onPressed: () =>
                                      {verifysms(Session.accountCreation)},
                                  child: Text(
                                    'Suivant',
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
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: new Column(
                          children: <Widget>[
                            new Text('Vous  n' 'avez pas recu le code ? '),
                            InkWell(
                              onTap: () {
                                if (Session.accountCreation.email != '') {
                                  sendsmsprocessforcreation(
                                      Session.accountCreation);
                                } else
                                  sendsmsprocess(Session.accountCreation);
                              },
                              child: new Text(
                                'RENVOYER LE CODE',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
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

  generateMd5(String data) {
    var bytesToHash = utf8.encode(data);
    var md5Digest = md5.convert(bytesToHash);
    return md5Digest;
  }

  toLogin(BuildContext context) {
    Navigator.of(context).pushNamed(AuthentificationPage.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }

  Future sendsmsprocess(AccountCreation AC) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      final response = await post(
        Uri.parse(Session.url + 'login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'password': AC.password,
          'phone': AC.tel,
          'device_id': Session.deviceid
        }),
      );
      Navigator.of(context).pop();
      setState(
        () {
          if (response.statusCode == 401) {
            Fluttertoast.showToast(
                msg: 'Code envoyé avec succés',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[200],
                textColor: Colors.black,
                fontSize: 16.0);
          } else
            Fluttertoast.showToast(
                msg: 'Erreur survenue, merci de reessayer plus tard',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[200],
                textColor: Colors.black,
                fontSize: 16.0);
        },
      );
    } catch (err) {}
  }

  Future sendsmsprocessforcreation(AccountCreation AC) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      final response = await http.post(
        Uri.parse(Session.url + 'register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          // 'phone': Common.telFormatToSend(tel),
          // 'email': email,
          // 'password': Password,
          // 'password_confirmation': confirmpassword,
          // 'device_id': Session.deviceid,
          'phone': AC.tel,
          'email': AC.email,
          'password': AC.password,
          'password_confirmation': AC.password,
          'device_id': Session.deviceid,
          'date_birth': AC.datenaissance,
          'gender': 'Mr',
          'adresse': AC.adresse,
          'profession': AC.profession,
          'city': AC.city
        }),
      );
      Navigator.of(context).pop();
      setState(
        () {
          if (response.statusCode == 200) {
            Fluttertoast.showToast(
                msg: 'Code envoyé avec succés',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[200],
                textColor: Colors.black,
                fontSize: 16.0);
          } else
            Fluttertoast.showToast(
                msg: 'Erreur survenue, merci de reessayer plus tard',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[200],
                textColor: Colors.black,
                fontSize: 16.0);
        },
      );
    } catch (err) {}
  }

  Future verifysms(AccountCreation AC) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      Map<String, String> qParams;
      if (AC.password == '') {
        qParams = {
          'phone': AC.tel,
          'device_id': Session.deviceid,
          'code': codeController.text,
        };
      } else {
        qParams = {
          'phone': AC.tel,
          'email': AC.email,
          'password': AC.password,
          'password_confirmation': AC.password,
          'device_id': Session.deviceid,
          'date_birth': AC.datenaissance2,
          'gender': 'Mr',
          'adresse': AC.adresse,
          'profession': AC.profession,
          'city': AC.city,
          'code': codeController.text,
        };
      }

      final response = await http.post(
        Uri.parse(Session.url + 'verify_sms'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(qParams),
      );

      Navigator.of(context).pop();
      setState(
        () {
          if (response.statusCode == 200) {
            toLogin(context);
          } else if (response.statusCode == 302) {
            Fluttertoast.showToast(
                msg: 'les mots de passes ne sont pas identiques',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[200],
                textColor: Colors.black,
                fontSize: 16.0);
          } else {
            Fluttertoast.showToast(
                msg: 'Erreur survenue, merci de reessayer plus tard',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[200],
                textColor: Colors.black,
                fontSize: 16.0);
          }
        },
      );
    } catch (err) {}
  }
}
