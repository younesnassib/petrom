import 'package:flutter/material.dart';
import 'package:petrom_fidelite/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/default_infos_entity.dart';
import '../models/session.dart';

class LubrifiantDetail extends StatefulWidget {
  static const screenRoute = '/productdetail';
  final Lubrifiant lubrifiant;

  const LubrifiantDetail({super.key, required this.lubrifiant});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LubrifiantDetailState();
  }
}

class LubrifiantDetailState extends State<LubrifiantDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.lubrifiant.title,
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
            flex: 1,
            child: SizedBox(
              height: 300,
              child: Center(
                child: Image(
                  image: AssetImage(widget.lubrifiant.image),
                  height: 100,
                  width: 200,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Text(widget.lubrifiant.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text('Avantages :',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(widget.lubrifiant.avantages,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text('Applications :',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(widget.lubrifiant.applications,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ))
                  ])),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
