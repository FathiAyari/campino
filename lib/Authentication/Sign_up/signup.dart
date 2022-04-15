import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../Sign_in/sign_in.dart';

final _formkey = GlobalKey<FormState>();

TextEditingController nameController = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController gsmController = TextEditingController();
TextEditingController _passController = TextEditingController();

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  File? _image;
  bool check = false;
  Future getProfileImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _image = File(image!.path);
      check = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
                child: Column(
              children: [
                Container(
                  height: 250,
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
                          height: 90,
                          width: 90,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Créer un compte Campino',
                          textAlign: TextAlign.right,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        backgroundImage: _image == null
                            ? AssetImage('images/user.png') as ImageProvider
                            : FileImage(_image!),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.indigo,
                        radius: 20,
                        child: IconButton(
                            onPressed: () {
                              getProfileImage();
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
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
                    validator: (Value) {
                      if (Value!.isEmpty ||
                          !(RegExp(r'^[a-z A-Z]+$')).hasMatch(Value))
                        return "s'il vous plait saisir un nom valide ";
                    },
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.indigo,
                      ),
                      hintText: 'Nom Complet',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black38),
                    ),
                  ),
                ),
                SizedBox(height: 15),
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
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.indigo,
                      ),
                      hintText: 'exemple@gmail.com',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black38),
                    ),
                  ),
                ),
                SizedBox(height: 15),
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
                    controller: gsmController,
                    validator: (Value) {
                      if (Value!.isEmpty ||
                          (RegExp(r'^[0..9]+$')).hasMatch(Value))
                        return "s'il vous plait saisir votre numéro de télephone  ";
                      else if (Value.length > 8)
                        return "le numéro de téléphone ne dépasse pas 8 chiffres  ";
                    },
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.indigo,
                      ),
                      hintText: '12345678 ',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black38),
                    ),
                  ),
                ),
                SizedBox(height: 25),
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
                        return "s'il vous plait saisir un mot de passe  valide ";
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
                SizedBox(height: 15),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: CupertinoButton(
                                child: Text(
                                  'S\'inscrire',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontStyle: FontStyle
                                        .italic, // fontWeight: FontWeight.bold )
                                  ),
                                ),
                                color: Colors.indigo,
                                onPressed: () {}))
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Avez-vous déja un compte ? ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            //  fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                          child: Text(
                            "se connecter   ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.indigo,
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ))));
  }
}
