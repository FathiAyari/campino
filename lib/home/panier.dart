import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class PanierScreen extends StatefulWidget {
  const PanierScreen({Key? key,}) : super(key: key);


  @override
  _PanierScreenState createState()=>_PanierScreenState();
}
class _PanierScreenState extends State<PanierScreen> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Panier',
                style: TextStyle(
                color: Colors.indigo,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  fontSize: 40
              ),
              ),
            ],
          ),

            Row(
              children: [
                Center(
                  child: Image(image:AssetImage('images/tente.jpg'),
                  height: 100,
                  width: 150,),
                ),

                Container(
                  child: Text('Tente imperméable'
                  ' pour 2 personne ',style:
                        TextStyle(fontSize:12,
                            color: Colors.black54),),
                ),

                    Text('100 ',style: TextStyle(fontSize: 10,color: Colors.black54),),
                    Text('DT ', style: TextStyle(fontSize: 10,color: Colors.red),),
                  ],
                ),
          Expanded(
              child:Column(
                children: [
                  Text('1'),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                        print('hi');
                        });
                      }, icon: Icon(Icons.remove_circle_outline)),
                      IconButton(onPressed: (){
                        setState(() {
                          print('hi');
                        });
                      }, icon: Icon(Icons.add_circle_outline))

                  ],


            ),
                ],
              )
          )


              ],

            )



    );



    }}