import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp00/home/homesscreen.dart';

class ChangermdpScreen extends StatelessWidget {
  const ChangermdpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title:const Text("Changer votre mot de passe", ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 6),
                        ),
                      ]),
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Colors.indigo,
                      ),
                      hintText: 'Mot de passe',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black38),
                    ),
                  ),
                ),
                SizedBox(height:15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 6),
                        ),
                      ]),
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Colors.indigo,
                      ),
                      hintText: 'Confirmer mot de passe',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black38),
                    ),
                  ),
                ),

                SizedBox(height:25),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: CupertinoButton(
                                child: Text('Enregistrer',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic)),
                                color: Colors.indigo,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              BottomNavBar()));
                                }
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
