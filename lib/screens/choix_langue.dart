import 'package:flutter/material.dart';

class ChoixLangue extends StatefulWidget{
  static const screenRoute = '/choixdelangue';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChoixLangueState();
  }
  
}
class ChoixLangueState extends State<ChoixLangue>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('choixdelangue'),
    );
  }
}