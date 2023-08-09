import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:petrom_fidelite/models/session.dart';
import 'package:petrom_fidelite/screens/lubrifiant_detail.dart';
import 'package:petrom_fidelite/screens/product_detail.dart';

import '../models/product.dart';

class ProductScreen extends StatefulWidget {
  static const screenRoute = '/products';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductScreenState();
  }
}

class ProductScreenState extends State<ProductScreen> {
  late Product firstproduct;
  late Product secondproduct;
  late Product thirdproduct;
  List<Product> tout = [];
  List<Product> carburant = [];
  List<Lubrifiant> lubrifiant = [];
  List<Product> cards = [];
  List<Product> gaz = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    tout = Session.products;
    lubrifiant = Session.lubrifiants;
    for (Product p in Session.products) {
      if (p.categorie == 1) {
        carburant.add(p);
      } else if (p.categorie == 3) {
        cards.add(p);
      } else if (p.categorie == 4) {
        gaz.add(p);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Nos Produits',
          style: TextStyle(
              fontSize: 16,
              color: Colors.blueprimary,
              fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.blueprimary, //change your color here
        ),
      ),
      body: DefaultTabController(
        length: 5,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.greysecondary],
                begin: Alignment.topCenter),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            children: [
              TabBar(
                indicatorColor: Colors.blueprimary,
                tabs: [
                  Tab(
                      icon: new Image.asset('images/toutproduit.png',
                          height: 20, width: 20, color: Colors.blueprimary)),
                  Tab(
                      icon: new Image.asset('images/carburant.png',
                          height: 20, width: 20, color: Colors.blueprimary)),
                  Tab(
                      icon: new Image.asset('images/lubrifiant.png',
                          height: 20, width: 20, color: Colors.blueprimary)),
                  Tab(
                      icon: new Image.asset('images/cards.png',
                          height: 20, width: 20, color: Colors.blueprimary)),
                  Tab(
                      icon: new Image.asset('images/gas.png',
                          height: 20, width: 20, color: Colors.blueprimary))
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(child: Center(child: getgridView(tout))),
                    Container(child: Center(child: getgridView(carburant))),
                    Container(child: Center(child: getgridView(lubrifiant))),
                    Container(child: Center(child: getgridView(cards))),
                    Container(child: Center(child: getgridView(gaz))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }

  Column getView(List<Product> products) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            clipBehavior: Clip.none,
            itemBuilder: (BuildContext context, int index) {
              return buildProduct(products[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget getgridView(List<Product> products) {
    List<Widget> widgets = [];
    for (Product p in products) {
      widgets.add(buildProduct(p));
    }
    return GridView.count(
      crossAxisCount: 2,
      children: widgets,
    );
  }

  Widget buildProduct(Product product) => Container(
        margin: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
        child: InkWell(
          onTap: () {
            if (product is Lubrifiant) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LubrifiantDetail(lubrifiant: product)));
            } else
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetail(product: product)));
          },
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            elevation: 3,
            shadowColor: Colors.bluesecondary,
            child: Column(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage(product.image),
                    height: 50,
                    width: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all( 5),
                  child: Column(
                      children: [
                        Text(product.title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blueprimary,
                                fontWeight: FontWeight.bold)),
                        Text(
                          textAlign: TextAlign.center,
                          product.description,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.bluesecondary
                          ),
                        ),
                      ],
                    ),
                ),

              ],
            ),
          ),
        ),
      );
}
