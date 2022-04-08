import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

//import 'homescreen.dart';
import 'login.dart';
final _formkey = GlobalKey<FormState>();

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);


  @override
  _ForgotPassScreenState createState()=>_ForgotPassScreenState();
}
class _ForgotPassScreenState extends State<ForgotPassScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold( body:
       SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey,
        child: Column( children:[
          Container(
            //margin: EdgeInsets.symmetric(horizontal: 20),
            //padding: const EdgeInsets.symmetric(horizontal: 20),
            height:350,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90),),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors:
                  [Colors.blueGrey,
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
                    // SizedBox(height: 10),
                    Container(
                      margin:EdgeInsets.only(top: 20),
                      child:
                      Text(
                        'Restaurer votre mot de passe ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            //  fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),)],)),),
          SizedBox(height:30),

          //backgroundColor: Colors.white10,
        //appBar: AppBar(
        //backgroundColor: Colors.green,
          //title: Text('Forgot Password'),
         // centerTitle: true,
        //),
       Container(margin: EdgeInsets.symmetric(horizontal: 16),
    alignment: Alignment.center,

    decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius:6,
                    offset: Offset(0,6),
                  ),
                ]
            ),
            height: 50,
            child: TextFormField(
              validator: (Value){
                if (Value!.isEmpty )
                  return "s'il vous plait saisir un email valide ";
    },
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black87,
              ),

              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),
                prefixIcon: Icon(Icons.email,
                  color: Colors.indigo,),
                labelText: 'exemple@gmail.com',
               labelStyle: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.black38),

              ),

            ),
          ),
                  SizedBox(height: 30,),
                  Container (
                      margin: EdgeInsets.symmetric(horizontal: 30) ,
                      child: Row(
                         children: [
                          Expanded(
                              child: CupertinoButton(
                                child: Text('Envoyer',
                                    style:TextStyle( color: Colors.white,fontStyle: FontStyle.italic  )),
                                color: Colors.indigo,
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {

                                    //      print(_loginController.text);
                                    //    print(_loginController.text);
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                          }
                         }
                        )
                       )
                      ],
                    )
                  ),
                  SizedBox(height:20),
                  Container (
                      margin: EdgeInsets.symmetric(horizontal: 50) ,
                      child: Row(
                        children: [
                          Expanded(
                              child: CupertinoButton(
                                child: Text("Retour à la page connection ",
                                    style:TextStyle( color: Colors.indigo,fontSize: 16,fontStyle: FontStyle.italic  )),
                                color: Colors.black12,
                                onPressed: () {
                                  print("user inputs:");
                            //      print(_loginController.text);
                              //    print(_loginController.text);
                                  Navigator.of(context).pop(
                                    );
                                },
                              )
                          )
                        ],
                      )
                  ),
          ])
          )
    ));
  }
         }