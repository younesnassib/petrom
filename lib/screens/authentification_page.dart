import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as IO;
import '../models/auth_response_entity.dart';
import 'package:platform_device_id/platform_device_id.dart';

class AuthentificationPage extends StatefulWidget {
  static const screenRoute = '/authentification';

  const AuthentificationPage({Key? key}) : super(key: key);

  @override
  State<AuthentificationPage> createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {
  final url = 'http://card.petrom.ma/api/AttarikPro.php/';
  late AuthResponseEntity authresponse;
  var telController = new TextEditingController();
  var passwordController = new TextEditingController();
  String loginvalue = '';
  String passwordvalue = '';

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
                          'Authentification',
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
                                      obscureText: true,
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
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Card(
                                color: Colors.blue,
                                child: FlatButton(
                                  height: 30,
                                  onPressed: () => login(telController.text,
                                      passwordController.text),
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
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: new Column(
                          children: <Widget>[
                            new Text(
                                'Vous ne possédez encore pas de compte ? '),
                            new Text(
                              'Créer un compte ',
                              style: TextStyle(
                                color: Colors.red,
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

  tohome(BuildContext context) {
    Navigator.of(context).pushNamed(HomePage.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }

  Future login(String Username, String Password) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    String passwd = generateMd5(Password).toString();
    try {
      Map<String, String> qParams = {
        'todo': 'AUTHENTICATION',
        'U': Username,
        'P': passwd,
        'key': 'lks@k!rkjjcs662P655h',
      };
      final response =
          await get(Uri.parse(url).replace(queryParameters: qParams));
      final jsonData = jsonDecode(response.body);
      AuthResponseEntity ARE = AuthResponseEntity.fromJson(jsonData);
      Navigator.of(context).pop();
      setState(
        () {
          authresponse = ARE;
          if (authresponse.header.status == 200) {
            tohome(context);
            Session.infosUser = authresponse;
            setUserData(Username, Password);
          } else {}
        },
      );
    } catch (err) {}
  }

  generateMd5(String data) {
    var bytesToHash = utf8.encode(data);
    var md5Digest = md5.convert(bytesToHash);
    return md5Digest;
  }

  static Future<void> setUserData(String login, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('login', login);
    await prefs.setString('password', password);
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginvalue = await prefs.getString('login') ?? '';
    passwordvalue = await prefs.getString('password') ?? '';
    telController.text = loginvalue;
    passwordController.text = passwordvalue;
    _getInfo();
  }

  @override
  void initState() {
    super.initState();
    getUserData();
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
}


