import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp00/drawerpage/changeradresse.dart';
import 'package:myapp00/drawerpage/changernum.dart';

import 'changermdp.dart';
import 'changernm.dart';

class Parametre extends StatefulWidget {
  const Parametre({Key? key}) : super(key: key);

  @override
  _ParametreState createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:const Text("Parametre", ),
    centerTitle: true,
        ),
    body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Center(
    child: Column(
      children: [
        SizedBox(height: 15,),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: CupertinoButton(
                        child: Text('Changer votre nom',
                            style: TextStyle(
                                color: Colors.black54,
                                fontStyle: FontStyle.italic)),
                        color: Colors.indigo,
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ChangernomScreen()));
                        }))
              ],
            )),
        SizedBox(height: 15,),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: CupertinoButton(
                        child: Text('Changer votre mot de passe',
                            style: TextStyle(
                                color: Colors.black54,
                                fontStyle: FontStyle.italic)),
                        color: Colors.indigo,
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ChangermdpScreen()));
                        }))
              ],
            )),
        SizedBox(height: 15,),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: CupertinoButton(
                        child: Text('Changer votre adresse',
                            style: TextStyle(
                                color: Colors.black54,
                                fontStyle: FontStyle.italic)),
                        color: Colors.indigo,
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ChangerAdress()));
                        }))
              ],
            )),
        SizedBox(height: 15,),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: CupertinoButton(
                        child: Text('Changer votre numéro ',
                            style: TextStyle(
                                color: Colors.black54,
                                fontStyle: FontStyle.italic)),
                        color: Colors.indigo,
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Changernum()));
                        }))
              ],
            )),
        SizedBox(height: 15,),
      ],
    ))));
  }
}
