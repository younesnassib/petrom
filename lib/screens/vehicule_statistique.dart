import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petrom_fidelite/models/statistique.dart';

import '../models/car_response_entity.dart';
import '../models/session.dart';
import '../models/transactions_entity.dart';
import 'package:http/http.dart' as http;

class VehiculeStatistique extends StatefulWidget {
  static const screenRoute = '/vehiculestatistique';
  final CarResponseEntity cardetail;
  final List<TransactionsEntity> transactions;

  const VehiculeStatistique(
      {super.key, required this.cardetail, required this.transactions});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VehiculeStatistiqueState();
  }
}

class VehiculeStatistiqueState extends State<VehiculeStatistique> {
  late String thisyEAR;

  late Statistique statistique;
  late List<TransactionsEntity> transactions;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'STATISTIQUES',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProduct(widget.cardetail),
            BuildTitle("INFORMATIONS GENERALES"),
            buildGeneralInfos(),
            BuildTitle("TOTAL DES TRANSACTIONS PAR MOIS"),
            BuildTitleSecond("Selectionnez une année"),
            buildPickerYear(),
            BuildMonthTotal("Mois"),
            BuildMonthDetail(1),
            BuildMonthDetail(2),
            BuildMonthDetail(3),
            BuildMonthDetail(4),
            BuildMonthDetail(5),
            BuildMonthDetail(6),
            BuildMonthDetail(7),
            BuildMonthDetail(8),
            BuildMonthDetail(9),
            BuildMonthDetail(10),
            BuildMonthDetail(11),
            BuildMonthDetail(12),
            BuildTitle("TOTAL DES TRANSACTIONS PAR ANNEE"),
            getMonthComponent(
                "MONTANT MOYEN", getMontantMoyen(transactions) + " dhs"),
            getMonthComponent(
                "MONTANT MAX", getMontantMax(transactions) + " dhs"),
            getMonthComponent(
                "MONTANT MIN", getMontantMin(transactions) + " dhs")
          ],
        ),
      ),
    );
  }

  Widget BuildTitle(String title) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            child: Text(title,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold))));
  }

  Widget buildProduct(CarResponseEntity response) => Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8,
        shadowColor: Colors.grey[50],
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Expanded(
                flex: 9,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Image(
                            image: AssetImage('images/auto.png'),
                            height: 50,
                            width: 50,
                            color: Color(0xFF42A5F5)),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1, child: Text('Nom du vehicule :')),
                                Expanded(
                                    flex: 1, child: Text(response.libelle)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1, child: Text('Type du vehicule :')),
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
                                Expanded(flex: 1, child: Text('Carburant :')),
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
                                Expanded(flex: 1, child: Text('Matricule :')),
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
                  ],
                ),
              ),
            ]),
          ),
        ),
      );

  Widget buildGeneralInfos() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.all(5),
                    child: buildGeneralComponent(1))),
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.all(5), child: buildGeneralComponent(2)))
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.all(5),
                    child: buildGeneralComponent(3))),
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.all(5), child: buildGeneralComponent(4)))
          ],
        ),
        Container(
            child: Container(
                margin: EdgeInsets.all(5), child: buildGeneralComponent(5)))
      ],
    );
  }

  Widget buildGeneralComponent(int i) {
    if (i == 1) {
      return buildDetailComponent(
          "Station Frequentée", statistique.stationfrequente);
    } else if (i == 2) {
      return buildDetailComponent("Montant Total", statistique.montanttotal);
    } else if (i == 3) {
      return buildDetailComponent("Kilométrage", "Kilométrage");
    } else if (i == 4) {
      return buildDetailComponent(
          "Carburant Total", statistique.carburanttotal);
    } else if (i == 5) {
      return buildDetailComponent(
          "NBR Transactions", statistique.nbrtransactions);
    } else {
      return Container();
    }
  }

  Widget buildDetailComponent(String title, String Value) {
    return Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8,
        shadowColor: Colors.grey[50],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [Text(title), SizedBox(height: 5), Text(Value)],
          ),
        ));
  }

  Widget BuildTitleSecond(String title) {
    return Container(child: Text(title));
  }

  Widget buildPickerYear() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: DropdownButton<String>(
          isExpanded: true,
          value: thisyEAR,
          items: GetYears()
              .map((item) =>
                  DropdownMenuItem<String>(value: item, child: Text(item)))
              .toList(),
          onChanged: (item) => setState(() =>
              {thisyEAR = item!, gettransactions(widget.cardetail, thisyEAR)})),
    );
  }

  List<String> GetYears() {
    return ["2023", "2022", "2021"];
  }

  Widget BuildTitleMonthTotal(String title) {
    return Row(
      children: [
        Text(title),
        Text("Montant"),
      ],
    );
  }

  Widget BuildMonthTotal(String title) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Text(title),
                Spacer(),
                Text(statistique.montanttotal),
              ],
            )));
  }

  // Janvier, février, mars, avril, mai, juin, juillet, août, septembre, octobre, novembre et décembre
  Widget BuildMonthDetail(int Month) {
    if (Month == 1) {
      return getMonthComponent("janvier",
          ((statistique.janvier * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 2) {
      return getMonthComponent("février",
          ((statistique.fevrier * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 3) {
      return getMonthComponent(
          "mars", ((statistique.mars * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 4) {
      return getMonthComponent("avril",
          ((statistique.avril * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 5) {
      return getMonthComponent(
          "mai", ((statistique.mai * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 6) {
      return getMonthComponent(
          "juin", ((statistique.juin * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 7) {
      return getMonthComponent("juillet",
          ((statistique.juillet * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 8) {
      return getMonthComponent(
          "août", ((statistique.aout * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 9) {
      return getMonthComponent("septembre",
          ((statistique.septembre * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 10) {
      return getMonthComponent("octobre",
          ((statistique.octobre * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 11) {
      return getMonthComponent("novembre",
          ((statistique.novembre * 100).toInt() / 100).toString() + " dhs");
    }
    if (Month == 12) {
      return getMonthComponent("décembre",
          ((statistique.decembre * 100).toInt() / 100).toString() + " dhs");
    } else
      return Container();
  }

  Widget BuildYearDetail(int Id) {
    if (Id == 1) {
      return Row(
        children: [
          Text("MONTANT MOYEN"),
          Text("Montant"),
        ],
      );
    }
    if (Id == 2) {
      return Row(
        children: [
          Text("MONTANT MAX"),
          Text("Montant"),
        ],
      );
    }
    if (Id == 3) {
      return Row(
        children: [
          Text("mars"),
          Text("MONTANT MIN"),
        ],
      );
    } else
      return Container();
  }

  Widget getMonthComponent(String month, String Value) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        shadowColor: Colors.grey[50],
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(month),
                    Spacer(),
                    Align(alignment: Alignment.centerRight, child: Text(Value)),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    thisyEAR = '2023';
    transactions = widget.transactions;
    statistique = getStatistiques(transactions);
  }

  Statistique getStatistiques(List<TransactionsEntity> transactions) {
    Statistique S = Statistique();
    S.stationfrequente = getStationFrequentee(transactions);
    S.montanttotal = getMontantTotal(transactions);
    S.carburanttotal = getCarburantTotal(transactions);
    S.nbrtransactions = getNombreTransaction(transactions);
    getMonthMontants(S, transactions);
    return S;
  }

  String getStationFrequentee(List<TransactionsEntity> mTransactions) {
    int max = 0;
    int curr = 0;
    String currKey = "";
    Set<String> unique = Set<String>.from(getStationsNames(mTransactions));
    for (String key in unique) {
      curr =
          getStationsNames(mTransactions).where((name) => name == key).length;
      if (max < curr) {
        max = curr;
        currKey = key;
      }
    }
    return currKey;
  }

  List<String> getStationsNames(List<TransactionsEntity> mTransactions) {
    List<String> mList = [];

    for (TransactionsEntity mTransaction in mTransactions) {
      if (mTransaction != null) {
        mList.add(mTransaction.sTATION);
      }
    }

    return mList;
  }

  String getMontantTotal(List<TransactionsEntity> mTransactions) {
    double mTotal = 0.0;
    for (TransactionsEntity mTransaction in mTransactions) {
      if (mTransaction != null) {
        mTotal += double.parse(mTransaction.m);
      }
    }
    int montantcent = (mTotal * 100).toInt();

    return (montantcent / 100).toString();
    return mTotal.toString();
  }

  String getCarburantTotal(List<TransactionsEntity> mTransactions) {
    double mTotal = 0.0;

    for (TransactionsEntity mTransaction in mTransactions) {
      if (mTransaction != null) {
        mTotal += double.parse(mTransaction.q);
      }
    }
    int montantcent = (mTotal * 100).toInt();

    return (montantcent / 100).toString();
  }

  String getNombreTransaction(List<TransactionsEntity> mTransactions) {
    return mTransactions.length.toString();
  }

  void getMonthMontants(Statistique s, List<TransactionsEntity> transactions) {
    for (TransactionsEntity T in transactions) {
      int month = int.parse(T.dH.substring(3, 5));
      // response.pAN.substring(response.pAN.length - 5, response.pAN.length);
      // int mMonth = Integer.parseInt(mTransaction.getmDateTime().split("\\s+")[0].split("/")[1]);

      switch (month) {
        case 1:
          s.janvier += double.parse(T.m);
          break;

        case 2:
          s.fevrier += double.parse(T.m);
          break;

        case 3:
          s.mars += double.parse(T.m);
          break;

        case 4:
          s.avril += double.parse(T.m);
          break;

        case 5:
          s.mai += double.parse(T.m);
          break;

        case 6:
          s.juin += double.parse(T.m);
          break;

        case 7:
          s.juillet += double.parse(T.m);
          break;

        case 8:
          s.aout += double.parse(T.m);
          break;

        case 9:
          s.septembre += double.parse(T.m);
          break;

        case 10:
          s.octobre += double.parse(T.m);
          break;

        case 11:
          s.novembre += double.parse(T.m);
          break;

        case 12:
          s.decembre += double.parse(T.m);
          break;
      }
    }
  }

  String getMontantMax(List<TransactionsEntity> mTransactions) {
    double max = 0.0;
    if (mTransactions.length > 0) {
      for (TransactionsEntity mTransaction in mTransactions) {
        if (mTransaction != null) {
          if (max < double.parse(mTransaction.m)) {
            max = double.parse(mTransaction.m);
          }
        }
      }
    }
    // int montantcent=(mTotal*100).toInt();

    return max.toString();
  }

  String getMontantMin(List<TransactionsEntity> mTransactions) {
    double max;
    if (mTransactions.length > 0) {
      max = double.parse(mTransactions[0].m);

      for (TransactionsEntity mTransaction in mTransactions) {
        if (mTransaction != null) {
          if (max > double.parse(mTransaction.m)) {
            max = double.parse(mTransaction.m);
          }
        }
      }
    } else
      max = 0.0;
    // int montantcent=(mTotal*100).toInt();

    return max.toString();
  }

  String getMontantMoyen(List<TransactionsEntity> mTransactions) {
    double max = 0.0;
    double result = 0.0;
    if (mTransactions.length > 0) {
      for (TransactionsEntity mTransaction in mTransactions) {
        if (mTransaction != null) {
          max += double.parse(mTransaction.m);
        }
      }
      result = max / mTransactions.length;
    }
    // int montantcent=(mTotal*100).toInt();
    return ((result * 100).toInt() / 100).toString();
  }

  gettransactions(CarResponseEntity car, String date) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    print('datedatedatedatedatedatedatedate${date}');
    final response = await http.post(
      Uri.parse(Session.url + 'detailscards'),
      headers: <String, String>{
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Bearer ' + Session.infosUser.data.token,
      },
      body: jsonEncode(<String, String>{
        'date_debut': '${date}0101',
        'date_fin': '${date}1231',
        'pan': car.modele.substring(car.modele.length - 5, car.modele.length),
        'code_sap': Session.infosUser.data.user.codeSap
      }),
    );
    print(response.toString());
    Navigator.of(context).pop();
    if (response.statusCode == 200) {
      setState(() {
        transactions = (json.decode(response.body) as List)
            .map((i) => TransactionsEntity.fromJson(i))
            .toList();
        statistique = getStatistiques(transactions);
      });
    } else
      Fluttertoast.showToast(
          msg: 'Erreur',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[200],
          textColor: Colors.black,
          fontSize: 16.0);
  }
}
