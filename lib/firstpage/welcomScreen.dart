import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp00/auth/login.dart';
import 'package:myapp00/auth/signup.dart';
import '../auth/login.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  _WelcomScreenState createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blueGrey,
                        Colors.indigo,
                      ]),
                ),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 90),
                          child: Image(
                            image: AssetImage('images/camping.png'),
                            height: 90,
                            width: 90,
                          ),
                        ),
                        Container(
                            //padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                            margin: EdgeInsets.only(right: 20, top: 20),
                            alignment: Alignment.center,
                            child: Text(
                              'Bienvenue Sur Campino',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            )),
                        SizedBox(
                          height: 90,
                        ),
                      ]),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.only(right: 20, top: 20),
                  alignment: Alignment.center,
                  child: Text(
                    'Je suis votre guide de Camping',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.indigo),
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: CupertinoButton(
                        child: Text('Connexion',
                            style: TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontStyle: FontStyle.italic)),
                        color: Colors.indigo,
                        onPressed: () {
                          print("user inputs:");
                          //      print(_loginController.text);
                          //    print(_loginController.text);
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      ))
                    ],
                  )),
              SizedBox(height: 30),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: CupertinoButton(
                        child: Text('Créer un Compte',
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 20,
                                fontStyle: FontStyle.italic)),
                        color: Colors.black12,
                        onPressed: () {
                          //print("user inputs:");
                          //      print(_loginController.text);
                          //    print(_loginController.text);
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                      ))
                    ],
                  )),
              SizedBox(height: 20),
            ])));
  }
}
