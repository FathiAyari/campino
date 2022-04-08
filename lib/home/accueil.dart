import 'package:flutter/material.dart';
class AccueilScreen extends StatefulWidget {
  const AccueilScreen({Key? key}) : super(key: key);

  @override
  _AccueilScreenState createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Text(
          'Accueil'
          , style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ), )



    );
  }
}
