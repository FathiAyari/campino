import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AproposScreen extends StatefulWidget {
  const AproposScreen({Key? key}) : super(key: key);

  @override
  _AproposScreenState createState() => _AproposScreenState();
}

class _AproposScreenState extends State<AproposScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'à propos de nous',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                child: Image(
                  image: AssetImage('images/camping.png'),
                  height: 90,
                  width: 90,
                ),
              ),
              Container(
                  //padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  margin: EdgeInsets.only(right: 10, top: 20),
                  alignment: Alignment.center,
                  child: Text(
                    ' Campino',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.indigo,
                        letterSpacing: 1.2),
                  )),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  margin: EdgeInsets.only(right: 10, top: 20),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Campino est une application mobile qui vous aide à trouver les centrese camping '
                    'vous pouvez aussi partager votre expériences avec vos amis et le réagir avec les publication '
                    'vous pouvez aussi communiquer entre vous dans la page message  ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                        letterSpacing: 1.2),
                  )),
            ])));
  }
}
