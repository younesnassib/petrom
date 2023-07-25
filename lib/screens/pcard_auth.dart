import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/carte_first.dart';
import 'package:petrom_fidelite/screens/home_page.dart';
import 'package:petrom_fidelite/tools/Common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as IO;
import '../models/accountcreation.dart';
import '../models/auth_response_entity.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'SMSPage.dart';

class PcardAuthPage extends StatefulWidget {
  static const screenRoute = '/pcardauth';

  const PcardAuthPage({Key? key}) : super(key: key);

  @override
  State<PcardAuthPage> createState() => _PcardAuthPageState();
}

class _PcardAuthPageState extends State<PcardAuthPage> {
  late AuthResponseEntity authresponse;
  var usernameController = new TextEditingController();
  var passwordController = new TextEditingController();
  var codesapController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(children: [
          Expanded(
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
                    'Pour continuer sur cet onglet vous devez être un client Petrom',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
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
                            flex: 8,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText: 'utilisateur',
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
                            flex: 8,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: TextField(
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
                            flex: 8,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: TextField(
                                controller: codesapController,
                                decoration: InputDecoration(
                                  hintText: 'Code SAP',
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
                // 'date_birth': '12-12-1993',
                // 'gender': 'Mr',
                // 'adresse': 'hay el wahda',
                // 'profession': 'testeur',
                // 'city': 'mohammedia'

                SizedBox(height: 10),
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
                              if (passwordController.text.length == 0 ||
                                  usernameController.text == 0 ||
                                  codesapController.text == 0)
                                {
                                  Common.showToast(
                                      'Le mot de passe doit contenir 6 chiffres au minimum')
                                }
                              else
                                ActivationSap(
                                    usernameController.text,
                                    passwordController.text,
                                    codesapController.text),
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
              ],
            ),
          )),
        ]),
      ),
    ));
  }

  tohome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.screenRoute);
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

  tocarte(BuildContext context) {
    Navigator.pushReplacementNamed(context, CarteFirsrScreen.screenRoute);
  }

  Future ActivationSap(String username, String Password, String codeSap) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      Map<String, String> qParams;

      qParams = {
        'username': username,
        'password': Password,
        'code_sap': codeSap,
      };

      final response = await http.post(
        Uri.parse(Session.url + 'activation_sap'),
        headers: <String, String>{
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization': 'Bearer ' + Session.infosUser.data.token
        },
        body: jsonEncode(qParams),
      );

      Navigator.of(context).pop();
      setState(
        () {
          if (response.statusCode == 200) {
            Session.infosUser.data.user.codeSap = codeSap;
            tohome(context);
            Fluttertoast.showToast(
                msg: 'les donnees sont synchronisees avec succees',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[200],
                textColor: Colors.black,
                fontSize: 16.0);
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

}
