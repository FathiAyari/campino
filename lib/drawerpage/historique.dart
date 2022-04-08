import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Historique extends StatelessWidget {
  const Historique({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:const Text("Historique", ),
    centerTitle: true,
    ),
    body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Center(
    child: Column(
    children: [
    SizedBox(height: 15,),
    Container(

    )]))));
    }
}
