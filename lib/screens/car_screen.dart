import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:petrom_fidelite/models/car_response_entity.dart';
import 'package:petrom_fidelite/screens/car_add.dart';
import 'package:petrom_fidelite/screens/car_update.dart';
import 'package:petrom_fidelite/screens/vehicule_statistique.dart';

import '../models/carte_response_entity.dart';
import '../models/deletcar_entity.dart';
import '../models/session.dart';
import '../models/transactions_entity.dart';
import 'CarDetails.dart';
import 'home_page.dart';

enum SampleItem { itemOne, itemTwo }

class CarPage extends StatefulWidget {
  static const screenRoute = '/monvehicule';

  const CarPage({Key? key}) : super(key: key);

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  late DeletcarEntity DE;

  late Future<CarResponseEntity> carsresponse;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return tohome(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Mes vehicules',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              )),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Scrollbar(
                            child: FutureBuilder<List<CarResponseEntity>>(
                              future: getcars(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, i) {
                                        return buildProduct(snapshot.data![i]);
                                      });
                                }
                                return const Center( child: CircularProgressIndicator());
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Center(
                  child: Card(
                    color: Colors.blue,
                    child: TextButton(
                      onPressed: () {
                        getcartes(Session.infosUser.data.user.codeSap);
                      },
                      child: Text(
                        'Ajouter un vehicule',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
    ;
  }

  Widget buildProduct(CarResponseEntity response) => Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8,
        shadowColor: Colors.grey[50],
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CarDetails(cardetail: response)));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Image(
                                image: AssetImage('images/auto.png'),
                                height: 50,
                                width: 50,
                                color: Color(0xFF42A5F5)),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('Nom du vehicule :')),
                                    Expanded(
                                        flex: 1, child: Text(response.libelle)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('Type du vehicule :')),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          response.motorisation,
                                          maxLines: 2,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1, child: Text('Carburant :')),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          response.carburant,
                                          maxLines: 2,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1, child: Text('Matricule :')),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          response.matricule,
                                          maxLines: 2,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: MenuWidget(response)),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        gettransactions(response);
                      },
                      child: Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Statistiques',
                            textAlign: TextAlign.center,
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
            ]),
          ),
        ),
      );

  Future<List<CarResponseEntity>> getcars() async {
    // String passwd = Session.generateMd5('4276').toString();
    // Map<String, String> qParams = {
    //   'todo': 'MESVEHICULES',
    //   'key': 'lks@k!rkjjcs662P655h',
    //   'U': '0623504276',
    //   'P': passwd,
    // };
    final response = await http.get(
        Uri.parse(Session.url +
            'vehicules/' +
            Session.infosUser.data.user.id.toString()),
        headers: <String, String>{
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization': 'Bearer ' + Session.infosUser.data.token
        });
    return (json.decode(response.body) as List)
        .map((i) => CarResponseEntity.fromJson(i))
        .toList();
  }

  PopupMenuButton MenuWidget(CarResponseEntity response) {
    SampleItem? selectedMenu;
    return PopupMenuButton<SampleItem>(
      initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('Modifier'),
          onTap: () => Future.delayed(
            const Duration(seconds: 0),
            () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Modification du vehicule'),
                content: Text('Voulez vous vraiment modifier ce vehicule ?'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Non')),
                  TextButton(
                      onPressed: () => getcartesforupdate(
                          response, Session.infosUser.data.user.codeSap),
                      child: Text('Oui'))
                ],
              ),
            ),
          ),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('Supprimer'),
          onTap: () {
            Future.delayed(
              const Duration(seconds: 0),
              () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Suppression de vehicule'),
                  content: Text('Voulez vous vraiment supprimer ce vehicule ?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Non')),
                    TextButton(
                      child: Text('Oui'),
                      onPressed: () {
                        Navigator.pop(context);
                        deletecar2(response.id.toInt().toString());
                        // Navigate to second route when tapped.
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Future deletecar(String matricule) async {
  //   try {
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return Center(child: CircularProgressIndicator());
  //         });
  //     String passwd = Session.generateMd5('4276').toString();
  //     Map<String, String> qParams = {
  //       'todo': 'DELETEVEHICULE',
  //       'key': 'lks@k!rkjjcs662P655h',
  //       'U': '0623504276',
  //       'P': passwd,
  //       'matricule': matricule,
  //     };
  //     final response =
  //         await get(Uri.parse(url).replace(queryParameters: qParams));
  //     final jsonData = jsonDecode(response.body);
  //     print(jsonData.toString());
  //     DeletcarEntity ARE = DeletcarEntity.fromJson(jsonData);
  //     Navigator.of(context).pop();
  //     setState(() {
  //       DE = ARE;
  //       if (DE.header.status == 200) {
  //         refresh(context);
  //       } else {}
  //     });
  //   } catch (err) {}
  // }

  refresh(BuildContext context) {
    Navigator.of(context).pushNamed(CarPage.screenRoute).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }

  update(BuildContext context, CarResponseEntity response) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CarUpdate(cardetail: response)));
  }

  getcartes(String CodeSap) async {
    try {
      if (Session.cardsuser.length > 0) {
        tocaradd(context);
      } else {
        List<CarteResponseEntity> listcards;
        showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            });
        final response = await http.post(
          Uri.parse(Session.url + 'cards'),
          headers: <String, String>{
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/vnd.api+json',
            'Authorization': 'Bearer ' + Session.infosUser.data.token,
          },
          body: jsonEncode(<String, String>{
            'code_sap': CodeSap,
          }),
        );
        Navigator.of(context).pop();
        setState(
          () {
            if (response.statusCode == 200) {
              listcards = (json.decode(response.body) as List)
                  .map((i) => CarteResponseEntity.fromJson(i))
                  .toList();
              if (listcards.length > 0) {
                Session.cardsuser = listcards;
                tocaradd(context);
              }
            } else {}
          },
        );
      }
    } catch (err) {}
  }

  getcartesforupdate(CarResponseEntity CRR, String CodeSap) async {
    if (Session.cardsuser.length > 0) {
      update(context, CRR);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      try {
        List<CarteResponseEntity> listcards;
        final response = await http.post(
          Uri.parse(Session.url + 'cards'),
          headers: <String, String>{
            'Accept': 'Bearer/vnd.api+json',
            'Content-Type': 'application/vnd.api+json',
            'Authorization': 'Bearer ' + Session.infosUser.data.token,
          },
          body: jsonEncode(
            <String, String>{
              'code_sap': CodeSap,
            },
          ),
        );
        Navigator.of(context).pop();
        setState(
          () {
            if (response.statusCode == 200) {
              listcards = (json.decode(response.body) as List)
                  .map((i) => CarteResponseEntity.fromJson(i))
                  .toList();
              if (listcards.length > 0) {
                Session.cardsuser = listcards;
                update(context, CRR);
              } else {}
            }
          },
        );
      } catch (err) {}
    }
  }

  void tocaradd(BuildContext context) {
    Navigator.pushReplacementNamed(context, CarAdd.screenRoute);
  }

  Future deletecar2(String id) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      var headers = {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Bearer ' + Session.infosUser.data.token
      };
      var request =
          http.Request('DELETE', Uri.parse(Session.url + 'vehicules/' + id));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        refresh(context);
      } else {
        print(response.reasonPhrase);
      }
    } catch (err) {}
  }

  tohome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.screenRoute);
  }

  Future gettransactions(CarResponseEntity car) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    final response = await http.post(
      Uri.parse(Session.url + 'detailscards'),
      headers: <String, String>{
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Bearer ' + Session.infosUser.data.token,
      },
      body: jsonEncode(<String, String>{
        'date_debut': '20230101',
        'date_fin': '20231231',
        'pan': car.modele.substring(car.modele.length - 5, car.modele.length),
        'code_sap': Session.infosUser.data.user.codeSap
      }),
    );
    print(response.toString());
    Navigator.of(context).pop();
    if (response.statusCode == 200) {
      List<TransactionsEntity> ARE = (json.decode(response.body) as List)
          .map((i) => TransactionsEntity.fromJson(i))
          .toList();
      tostatistiques(context, car, ARE);
    } else
      Fluttertoast.showToast(
          msg: 'Erreur',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[200],
          textColor: Colors.black,
          fontSize: 16.0);
  }

  tostatistiques(BuildContext context, CarResponseEntity car, List<TransactionsEntity> ARE) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VehiculeStatistique(cardetail: car, transactions: ARE)));
  }
}
