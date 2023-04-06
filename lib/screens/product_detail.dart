import 'package:flutter/material.dart';
import 'package:petrom_fidelite/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/default_infos_entity.dart';
import '../models/session.dart';

class ProductDetail extends StatefulWidget {
  static const screenRoute = '/productdetail';
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductDetailState();
  }
}

class ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.product.title,
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
                  image: AssetImage(widget.product.image),
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
                      child: Text(widget.product.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ))),
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
