import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petrom_fidelite/screens/ForgetPassword3.dart';

import '../models/accountcreation.dart';
import '../models/session.dart';

import 'package:http/http.dart' as http;

class ForgetPassword2 extends StatefulWidget {
  static const screenRoute = '/ForgetPassword2';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgetPassword2State();
  }
}

class ForgetPassword2State extends State<ForgetPassword2> {
  var codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                                      {verifysms(Session.username)},
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
                                // sendsmsprocess(Session.accountCreation);
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

  Future verifysms(String username) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      Map<String, String> qParams;
      qParams = {
        'code': codeController.text,
        'phone': username,
      };

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
            toStep3(context);
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

  void toStep3(BuildContext context) {
    Navigator.of(context).pushNamed(ForgetPassword3.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }
}
