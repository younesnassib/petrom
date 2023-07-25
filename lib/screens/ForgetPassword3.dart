import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import '../models/session.dart';
import '../tools/Common.dart';
import 'authentification_page.dart';

class ForgetPassword3 extends StatefulWidget {
  static const screenRoute = '/ForgetPassword3';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgetPassword3State();
  }
}

class ForgetPassword3State extends State<ForgetPassword3> {
  var passwordController = new TextEditingController();
  var passwordConfirmController = new TextEditingController();

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
                  child: SingleChildScrollView(
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
                            'Mot de passe',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: new Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                      flex: 1,
                                      child: new Image(
                                        image:
                                            AssetImage('images/password.png'),
                                        height: 40,
                                        width: 40,
                                      )),
                                  new Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          hintText: 'Mot de passe',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: new Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                      flex: 1,
                                      child: new Image(
                                        image:
                                            AssetImage('images/password.png'),
                                        height: 40,
                                        width: 40,
                                      )),
                                  new Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: passwordConfirmController,
                                        decoration: InputDecoration(
                                          hintText: 'Confirmer le mot de passe',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: Colors.blue,
                                  child: TextButton(
                                    onPressed: () async {
                                      ForgetStep3Process(
                                          Session.username);
                                    },
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }

  Future ForgetStep3Process(String Username) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      final response = await post(
        Uri.parse(Session.url + 'set_password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phone': Username,
          'password': passwordController.text.trim(),
          'device_id': Session.deviceid,
        }),
      );
      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        // Session.infosUser = ARE!;
        // Common.setUserData(Username, Password);
        toLogin(context);
      } else {
        Fluttertoast.showToast(
            msg: response.statusCode.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey[200],
            textColor: Colors.black,
            fontSize: 16.0);
      }
    } catch (err) {
      Navigator.of(context).pop();
      Fluttertoast.showToast(
          msg: 'ERREUR',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[200],
          textColor: Colors.black,
          fontSize: 16.0);
    } finally {}
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
}
