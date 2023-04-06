import 'package:flutter/material.dart';

class InformationsPaiement extends StatefulWidget{
  static const screenRoute = '/informationpaiement';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InformationsPaiementState();
  }
  
}
class InformationsPaiementState extends State<InformationsPaiement>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('Infos Paiement'),
    );
  }
  
}