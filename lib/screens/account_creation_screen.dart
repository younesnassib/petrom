import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/authentification_page.dart';
import 'package:petrom_fidelite/screens/home_page.dart';
import 'package:petrom_fidelite/tools/Common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as IO;
import '../models/accountcreation.dart';
import '../models/auth_response_entity.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'SMSPage.dart';

class AccountCreationPage extends StatefulWidget {
  static const screenRoute = '/accountcreation1';

  const AccountCreationPage({Key? key}) : super(key: key);

  @override
  State<AccountCreationPage> createState() => _AccountCreationPageState();
}

class _AccountCreationPageState extends State<AccountCreationPage> {
  DateTime date = new DateTime.now();
  late AuthResponseEntity authresponse;
  var telController = new TextEditingController();
  var passwordController = new TextEditingController();
  var mailController = new TextEditingController();
  var passwordconfirmController = new TextEditingController();
  var adressecontroller = new TextEditingController();
  var professioncontroller = new TextEditingController();
  var citycontroller = new TextEditingController();

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
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                            'Création de compte',
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
                                        image: AssetImage(
                                            'images/utilisateurdeprofil.png'),
                                        height: 40,
                                        width: 40,
                                      )),
                                  new Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: telController,
                                        decoration: InputDecoration(
                                          hintText: 'Numero de telephone',
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
                        SizedBox(height: 10),
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
                                      image: AssetImage(
                                        'images/emailadresse.png',
                                      ),
                                      height: 40,
                                      width: 40,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextField(
                                        controller: mailController,
                                        decoration: InputDecoration(
                                          hintText: 'Email',
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
                        SizedBox(height: 10),
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
                                        image: AssetImage('images/password.png'),
                                        height: 40,
                                        width: 40,
                                        color: Colors.grey[300],
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
                        SizedBox(height: 10),
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
                                      image: AssetImage('images/password.png'),
                                      height: 40,
                                      width: 40,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: passwordconfirmController,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Confirmation du mot de passe',
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
                        SizedBox(height: 10),
                        buildChamps('adresse', 'Adresse', 'images/adresse.png'),
                        SizedBox(height: 10),
                        buildChamps('profession', 'Profession',
                            'images/profession.png'),
                        SizedBox(height: 10),
                        buildChamps('city', 'Ville', 'images/ville.png'),
                        SizedBox(height: 10),
                        buildChamps('date naissance', 'date naissance',
                            'images/date-de-naissance.png'),
                        // 'date_birth': '12-12-1993',
                        // 'gender': 'Mr',
                        // 'adresse': 'hay el wahda',
                        // 'profession': 'testeur',
                        // 'city': 'mohammedia'

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: Colors.blue,
                                  child: TextButton(
                                    onPressed: () => {
                                      print('telController.text.length' + telController.text),
                                      print('telController.text.length' + mailController.text),
                                      print('passwordController.text.length' +passwordController.value.text),
                                      print('passwordconfirmController.text.length' + passwordconfirmController.value.text),
                                      if (telController.text == '' || passwordController.text == '' || mailController.text == '' || passwordconfirmController.text == '' || adressecontroller.text == '' || professioncontroller.text == '' || citycontroller.text == '')
                                        {
                                          Common.showToast('Veuillez remplire tous les champs ')
                                        }
                                      else
                                        {
                                          if (telController.text.length == 10)
                                            {
                                              if (passwordController.text.length > 5)
                                                {
                                                  print("passwordController.text.trim()"+passwordController.text.trim()),
                                                  print("passwordconfirmController.text.trim()"+passwordconfirmController.text.trim()),
                                                  if (passwordController.text.trim() == passwordconfirmController.text.trim())
                                                    {
                                                      sendsmsprocess(telController.text, mailController.text, passwordController.text,passwordconfirmController.text,adressecontroller.text,professioncontroller.text,citycontroller.text, '${date.day}-${date.month}-${date.year}', '${date.year}-${date.month}-${date.day}')
                                                    }
                                                  else Common.showToast('Les mots de passes ne sont pas identiques')
                                                }
                                              else Common.showToast('Le mot de passe doit contenir 6 chiffres au minimum')
                                            }
                                          else Common.showToast('Merci de verifier le numero de telephone ')
                                        }
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
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: new Column(
                            children: <Widget>[
                              new Text('Vous possédez un compte ?'),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: InkWell(
                                  onTap: () => {toLogin(context)},
                                  child: new Text(
                                    'Se connecter ',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
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
            ),
          ])
        ],
      ),
    );
  }

  tohome(BuildContext context) {
    Navigator.of(context).pushNamed(HomePage.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
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

  generateMd5(String data) {
    var bytesToHash = utf8.encode(data);
    var md5Digest = md5.convert(bytesToHash);
    return md5Digest;
  }

  @override
  void initState() {
    super.initState();
  }

  void _getInfo() async {
    if (IO.Platform.isIOS) {
      print('login Androiiiiiiid');
    } else if (IO.Platform.isAndroid) {
      print('login Iooooooooooos');
    }
    final deviceInfoPlugin = DeviceInfoPlugin();
    final result = await deviceInfoPlugin.deviceInfo;
    String? deviceId = await PlatformDeviceId.getDeviceId;
    setState(
      () {
        var _info = result.toMap();
        print(_info.toString());
      },
    );
  }

  toSMS(BuildContext context) {
    Navigator.of(context).pushNamed(SMSPage.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }

  Future sendsmsprocess(
      String tel,
      String email,
      String Password,
      String confirmpassword,
      String adresse,
      String profession,
      String city,
      String date,
      String date2) async {
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
          'phone': Common.telFormatToSend(tel),
          'email': email,
          'password': Password,
          'password_confirmation': confirmpassword,
          'device_id': Session.deviceid,
          'date_birth': date,
          'gender': 'Mr',
          'adresse': adresse,
          'profession': profession,
          'city': city
        }),
      );

      Navigator.of(context).pop();
      setState(
        () {
          if (response.statusCode == 200) {
            Session.accountCreation = AccountCreation(
                Common.telFormatToSend(tel),
                email,
                Password,
                adresse,
                profession,
                city,
                date,
                date2);

            toSMS(context);

            // tohome(context);
            // Session.infosUser = authresponse;
            // Session.password = passwd;
            // setUserData(Username, Password);
          } else if (response.statusCode == 302) {
            Fluttertoast.showToast(
                msg: 'les mots de passes ne s ont pas identiques',
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

  Widget buildChamps(String title, String hint, String image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: new Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: new Row(
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Image(
                  image: AssetImage(image),
                  height: 40,
                  width: 40,
                  color: Colors.grey[300],
                ),
              ),
              new Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: textfieldtoshow(title, hint),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textfieldtoshow(String title, String hint) {
    if (title == 'adresse') {
      return TextField(
        controller: adressecontroller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      );
    } else if (title == 'profession') {
      return TextField(
        controller: professioncontroller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      );
    } else if (title == 'city') {
      return TextField(
        controller: citycontroller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      );
    } else if (title == 'date naissance') {
      return CupertinoButton(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${date.day}-${date.month}-${date.year}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => SizedBox(
              height: 250,
              child: DatePicker(),
            ),
          );
        },
      );
    } else
      return TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      );
  }

  Widget DatePicker() => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          backgroundColor: Colors.white,
          mode: CupertinoDatePickerMode.date,
          initialDateTime: date,
          onDateTimeChanged: (DateTime newDateTime) {
            setState(() => date = newDateTime);
          },
        ),
      );
}
