import 'package:flutter/material.dart';
class Mescmd extends StatefulWidget {
  const Mescmd({Key? key}) : super(key: key);

  @override
  _MescmdState createState() => _MescmdState();
}

class _MescmdState extends State<Mescmd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title:const Text("Mes commandes", ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
                child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Container(

                      )]))));

  }
}
