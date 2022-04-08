import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myapp00/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp00/home/marketplace.dart';

import 'home/center.dart';
import 'home/panier.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  //void _closeDrawer() {
    //Navigator.of(context).pop();
  //}
  Widget buildCenter(){
    return Column (
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'centre',
          style: TextStyle(
              color: Colors.indigo,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          ),
        )
      ],
    );
  }
  Widget buildMarketPlace(){
    return Column (
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Marketplace',
          style: TextStyle(
              color: Colors.indigo,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          ),
        )
      ],
    );
  }
  Widget buildMaps(){
    return Column (
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'profil',
          style: TextStyle(
              color: Colors.indigo,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) => DefaultTabController(
  length:3,
  child: Scaffold(

      appBar:   AppBar(

  //  title: Text('Campino',style: TextStyle(color:
    //Colors.blueGrey),textAlign: TextAlign.left
   //,),
    //centerTitle: true ,
      // ],
backgroundColor: Colors.grey ,
      bottom: TabBar(

        indicatorWeight: 5,
         // indicatorColor: Colors.white,
          tabs: [
          Tab(icon: Icon(Icons.map_sharp ,color: Colors.blueGrey)),
          Tab(icon: Icon(Icons.shop,color: Colors.blueGrey,) ),
          Tab(icon: Icon(Icons.place_outlined,color: Colors.blueGrey) ),
        ]
      ),
elevation: 20,
        titleSpacing: 20,
       ),
  drawer: Drawer(
    elevation: 36.0,
  child:
  ListView(padding:EdgeInsets.zero,
    children: [
    const DrawerHeader(
    decoration: BoxDecoration(
   gradient: LinearGradient(colors: [Colors.blueGrey,
   Colors.black54
   ])
  ),
      child:
      Text('campino',style: TextStyle(decorationColor: Colors.tealAccent,
  )
  ),
    ),
      ListTile(
        title: const Text('se connecter'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),

      ListTile(
        title: const Text('à propos de nous'),
        onTap: () {

          Navigator.pop(context);
        },
      ),
      ListTile(
        title: const Text('Log-Out'),
        onTap: () {Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginScreen() ));
        },
          ),
  ]),
    ),
body: TabBarView(
children: [
  CenterScreen(),
  MarketplaceScreen(),
  PanierScreen(),
],
)),
  );
          }
