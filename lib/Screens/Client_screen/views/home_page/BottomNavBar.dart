import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp00/Screens/Client_screen/views/centers/centers.dart';
import 'package:myapp00/drawerpage/a_propos_de_nous.dart';
import 'package:myapp00/drawerpage/notification.dart';
import 'package:myapp00/drawerpage/parametre.dart';
import 'package:myapp00/home/marketplace.dart';

import '../../../../Authentication/Sign_in/sign_in.dart';
import '../messages/messages.dart';
import '../posts/posts.dart';

class HomePageClient extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<HomePageClient> {
  int currentIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> screens = [Posts(), MarketplaceScreen(), Messages(), Centers()];
  List<BottomNavyBarItem> items = [
    BottomNavyBarItem(icon: Icon(Icons.home), title: Text("Accuiel")),
    BottomNavyBarItem(
        icon: Icon(Icons.storefront_sharp), title: Text("Achats")),
    BottomNavyBarItem(icon: Icon(Icons.message), title: Text("Messages")),
    BottomNavyBarItem(icon: Icon(Icons.location_on), title: Text("Centres")),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            elevation: 36.0,
            child: ListView(padding: EdgeInsets.zero, children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.indigo, Colors.indigo])),
                child: Text('campino',
                    style: TextStyle(
                      decorationColor: Colors.tealAccent,
                    )),
              ),
              ListTile(
                title: const Text('Mes commandes'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mescmd()));
                },
              ),
              ListTile(
                title: const Text('parametre'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Parametre()));
                },
              ),
              ListTile(
                title: const Text('à propos de nous'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AproposScreen()));
                },
              ),
              ListTile(
                title: const Text('Log-Out'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
            ]),
          ),
          bottomNavigationBar: BottomNavyBar(
            onItemSelected: (int value) {
              setState(() {
                currentIndex = value;
              });
            },
            selectedIndex: currentIndex,
            items: items,
          ),
          body: screens[currentIndex]),
    );
  }
}