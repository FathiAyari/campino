import 'package:flutter/material.dart';
class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Text(
          'Maps'
          , style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ), )



    );
  }
}
