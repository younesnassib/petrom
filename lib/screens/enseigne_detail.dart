import 'package:flutter/material.dart';
import 'package:petrom_fidelite/models/Enseigne.dart';
import 'package:petrom_fidelite/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/default_infos_entity.dart';
import '../models/session.dart';

class EnseigneDetail extends StatefulWidget {
  static const screenRoute = '/productdetail';
  final Enseigne enseigne;

  const EnseigneDetail({super.key, required this.enseigne});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EnseigneDetailState();
  }
}

class EnseigneDetailState extends State<EnseigneDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.enseigne.title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            )),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 300,
              child: Center(
                child: Image(
                  image: AssetImage(widget.enseigne.image),
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
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.enseigne.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
