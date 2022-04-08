import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Bnimtir extends StatelessWidget {
  const Bnimtir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title:const Text("détails center", ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
                child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Container(
                          child: Image(
                            image: AssetImage('images/bnimtir1.jpg'),
                            height: 900,
                            width:900,
                          ),

                        ),
            ]))));
  }
}
