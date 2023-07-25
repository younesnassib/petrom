import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/SMSPage.dart';
import 'package:petrom_fidelite/screens/account_creation_screen.dart';
import 'package:petrom_fidelite/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as IO;
import '../models/accountcreation.dart';
import '../models/auth_response_entity.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../services/LocalAuth.dart';
import '../tools/Common.dart';
import 'ForgetPassword1.dart';

class AuthentificationPage extends StatefulWidget {
  static const screenRoute = '/authentification';

  const AuthentificationPage({Key? key}) : super(key: key);

  @override
  State<AuthentificationPage> createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {
  late AuthResponseEntity authresponse;
  var telController = new TextEditingController();
  var passwordController = new TextEditingController();
  String loginvalue = '';
  String passwordvalue = '';
  bool authbiometry = false;

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
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: InkWell(
                            onTap: () => {
                              Navigator.of(context)
                                  .pushNamed(ForgetPassword1.screenRoute)
                                  .then(
                                (result) {
                                  if (result != null) {}
                                },
                              )
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: new Text(
                                'Mot de passe oublié ?',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: getConnectionButton()
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: new Column(
                            children: <Widget>[
                              new Text(
                                  'Vous ne possédez encore pas de compte ? '),
                              InkWell(
                                onTap: () => {
                                  Navigator.of(context)
                                      .pushNamed(
                                          AccountCreationPage.screenRoute)
                                      .then(
                                    (result) {
                                      if (result != null) {}
                                    },
                                  )
                                },
                                child: new Text(
                                  'Créer un compte ',
                                  style: TextStyle(
                                    color: Colors.red[300],
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

  tosms(BuildContext context) {
    Navigator.of(context).pushNamed(SMSPage.screenRoute).then(
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

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginvalue = await prefs.getString('login') ?? '';
    passwordvalue = await prefs.getString('password') ?? '';
    telController.text = loginvalue;
    // passwordController.text = passwordvalue;
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

  Future login2(String Username, String Password) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      String Telephone = Common.telFormatToSend(Username);
      final response = await post(
        Uri.parse(Session.url + 'login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'password': Password,
          'phone': Telephone,
          'device_id': Session.deviceid
        }),
      );
      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        AuthResponseEntity ARE = AuthResponseEntity.fromJson(jsonData);
        Session.infosUser = ARE!;
        Common.setUserData(Username, Password);
        tohome(context);
        Session.infosUser = ARE!;
      } else if (response.statusCode == 401) {
        Session.accountCreation = AccountCreation(Telephone, '', Password, '', '', '', '', '');
        tosms(context);
      } else if (response.statusCode == 404) {
        Fluttertoast.showToast(
            msg: 'Mot de passe incorrecte',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey[200],
            textColor: Colors.black,
            fontSize: 16.0);
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

  Widget getConnectionButton() {
    if (passwordvalue == '') {
      return Expanded(
        child: Card(
          color: Colors.blue,
          child: TextButton(
            onPressed: () async {
              if (telController.text == '' || passwordController.text == '') {
                Common.showToast('Veuillez remplire tous les champs ');
              } else {
                login2(telController.text.trim(), passwordController.text);
              }
            },
            child: Text(
              'Se connecter',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      return Row(
        children: [
          Expanded(
            flex: 4,
            child: Card(
              color: Colors.blue,
              child: TextButton(
                onPressed: () async {
                  if (telController.text == '' ||
                      passwordController.text == '') {
                    Common.showToast('Veuillez remplire tous les champs ');
                  } else {
                    await CurrentPosition();
                    login2(telController.text.trim(), passwordController.text);
                  }
                },
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
              child: TextButton(
                onPressed: () async {
                  if (passwordvalue != '') {
                    final authenticate = await LocalAuth.authenticate();
                    setState(() {
                      authbiometry = authenticate;
                    });
                    if (authbiometry == true) {
                      print('yeeeeeeeeeeees');
                      login2(telController.text.trim(), passwordvalue);
                    }
                  } else {
                  }
                },
                child: Image(
                  image: AssetImage('images/biometrie.png'),
                  height: 30,
                  width: 30,
                  color: Colors.white,
                )
              ),
            ),
          )
        ],
      );
    }
  }
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> CurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => Session.currentposition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
