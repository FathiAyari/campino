import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp00/home/homesscreen.dart';
class Changernum extends StatelessWidget {
  const Changernum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title:const Text("Changer votre numéro", ),
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
                        child: TextFormField(
                          validator: (Value) {
                            if (Value!.isEmpty ||
                                (RegExp(r'^[0..9]+$')).hasMatch(Value))

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
                      SizedBox(height:15),Container(
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
                    ]))));
  }
}
