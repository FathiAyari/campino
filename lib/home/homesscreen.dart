import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myapp00/drawerpage/a_propos_de_nous.dart';
import 'package:myapp00/drawerpage/historique.dart';
import 'package:myapp00/drawerpage/notification.dart';
import 'package:myapp00/drawerpage/parametre.dart';
import 'package:myapp00/home/marketplace.dart';
import 'package:myapp00/home/profil.dart';
import 'package:myapp00/home/search.dart';
import '../auth/login.dart';
import 'accueil.dart';
import 'center.dart';
import 'panier.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
List<Widget> screens=
    [
      CenterScreen(),
      MarketplaceScreen(),
      PanierScreen(),
      ProfilScreen(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.indigo,

      leading:Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchScreen() ));  },
            tooltip: MaterialLocalizations.of(context).searchFieldLabel,
          );
        },
      ),

      title: Text('Campino',),
      centerTitle: true,
    ),

        endDrawer: Drawer(
          elevation: 36.0,
          child:
          ListView(padding:EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.indigo,
                        Colors.indigo
                      ])
                  ),
                  child:
                Text('campino',style: TextStyle(decorationColor: Colors.tealAccent,
                 )
                  ),
                ),
                ListTile(
                  title: const Text('Mes commandes'),
                  onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>Mescmd() ));
                  },
                ),

                ListTile(
                  title: const Text('parametre'),
                  onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Parametre() ));
                  },
                ),
                ListTile(
                  title: const Text('à propos de nous'),
    onTap: () {Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => AproposScreen() ));
    },

                ),
                ListTile(
                  title: const Text('Log-Out'),
                  onTap: () {Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen() ));
                  },
                ),
              ]),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[

            Icon(Icons.map_outlined, size: 20,color: Colors.white,),
            Icon(Icons.storefront_sharp, size: 20,color: Colors.white,),
            Icon(Icons.shopping_cart_outlined, size:20,color: Colors.white,),
            Icon(Icons.location_on_outlined, size: 20,color: Colors.white,),
          ],
          color: Colors.indigo,
          buttonBackgroundColor: Colors.indigo,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              currentIndex= index ;
            });
          },
          letIndexChange: (index) => true,

            ),
      body:screens[currentIndex]
          );
  }
}