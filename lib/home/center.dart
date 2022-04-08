import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp00/auth/login.dart';
import 'package:myapp00/drawerpage/historique.dart';
import 'package:myapp00/home/pagecentre/bnimtir.dart';
import '../imag.dart';
class CenterScreen extends StatefulWidget {
  const CenterScreen({Key? key}) : super(key: key);


  @override
  _CenterScreenState createState()=>_CenterScreenState();
}
class _CenterScreenState extends State<CenterScreen> {
  @override
  Widget build(BuildContext context) => ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                          const Bnimtir()));
                });
              },
              child: Column(
                children: [
                  FittedBox(
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      shadowColor: Colors.blueGrey,
                      elevation: 5.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container( height: 100,width: 600,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child:const Text(
                                      'Beni Mtir Outdoor',
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(''
                                        'Centre de camping',
                                    style: TextStyle(color: Colors.black54,
                                    fontSize: 18.0),),
                                  ),
                                  Center(
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: const Text('Gouvernot:',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18.0
                                        ),)
                                        ),
                                        Container(
                                            child: const Text('Jendouba',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 18.0
                                              ),)
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 90.0,
                            height: 90.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: const Image(
                                image: AssetImage(bnimtir),
                                fit: BoxFit.cover,

                              ),
                            ),
                          ),
                        ],
                      ),
                     )
                    ),
                ],
              ),
            ),
          ),

          Padding(padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                          const Historique()));
                });
              },
              child: Column(
                children: [
                  FittedBox(
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      shadowColor: Colors.blueGrey,
                      elevation: 5.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(height: 100,width: 600,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: const Text(
                                      'Beni Mtir Outdoor',
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(''
                                        'Centre de camping',
                                      style: TextStyle(color: Colors.black54,
                                          fontSize: 18.0),),
                                  ),
                                  Center(
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            child: const Text('Gouvernot:',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 18.0
                                              ),)
                                        ),
                                        Container(
                                            child: const Text('Jendouba',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 18.0
                                              ),)
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 90.0,
                            height: 90.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: const Image(
                                image: AssetImage(bnimtir),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);}