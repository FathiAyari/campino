import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Services/AuthServices.dart';
import '../Forgot_password/forgotpass.dart';
import '../Sign_up/signup.dart';
import 'components/infoMessage.dart';

TextEditingController _loginController = TextEditingController();
TextEditingController _passController = TextEditingController();

final _formkey = GlobalKey<FormState>();

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
              key: _formkey,
              child: Column(children: [
                Container(
                  height: 280,
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
                        margin: EdgeInsets.only(top: 50),
                        child: Image(
                          image: AssetImage('images/camping.png'),
                          height: 100,
                          width: 100,
                        ),
                      ),
                      // SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Se Connecter ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              //  fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  )),
                ),
                SizedBox(height: 80),
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
                  child: TextFormField(
                    controller: _loginController,
                    validator: (Value) {
                      if (Value!.isEmpty)
                        return "s'il vous plait saisir un email valide ";
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(Icons.email, color: Colors.indigo),
                      hintText: 'exemple@gmail.com',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black38),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                  child: TextFormField(
                    controller: _passController,
                    validator: (Value) {
                      if (Value!.isEmpty)
                        return "s'il vous plait saisir un mot de passe valide ";
                    },
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.lock,
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
                SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ForgotPassScreen()));
                    },
                    child: Text(
                      "mot de passe oublié?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black54,
                          //fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )),
                SizedBox(
                  height: 20,
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                                child: CupertinoButton(
                                    child: Text('Connexion',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic)),
                                    color: Colors.indigo,
                                    onPressed: () {
                                      if (!_formkey.currentState!.validate()) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        AuthServices()
                                            .signIn("ayarif648@gmail.com",
                                                "12345673389")
                                            .then((value) {
                                          if (value) {
                                            print("done");
                                            setState(() {
                                              isLoading = false;
                                            });
                                          } else {
                                            InfoMessage(
                                              press: () {
                                                Get.back();
                                              },
                                              lottieFile: "images/error.json",
                                              action: "Ressayer",
                                              message:
                                                  "Merci de vierfier vos données ",
                                            ).show(context);
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        });
                                      }
                                    }))
                          ],
                        )),
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(
                            child: CupertinoButton(
                          child: Text("Besoin d'un nouveau compte?",
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic)),
                          color: Colors.black12,
                          onPressed: () {
                            Get.to(SignupScreen());
                          },
                        ))
                      ],
                    )),
              ])),
        ));
  }
}
