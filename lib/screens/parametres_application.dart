import 'package:flutter/material.dart';

class ParametresApplication extends StatefulWidget{
  static const screenRoute = '/parametresapplication';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ParametresApplicationState();
  }
  
}
class ParametresApplicationState extends State<ParametresApplication>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('Parametres Application'),
    );
  }
  
}