import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp00/constants.dart';
import 'package:myapp00/drawerpage/a_propos_de_nous.dart';
import 'package:myapp00/drawerpage/notification.dart';
import 'package:myapp00/drawerpage/parametre.dart';
import 'package:myapp00/home/marketplace.dart';

import '../../../../Authentication/Sign_in/sign_in.dart';
import '../../../Client_screen/views/posts/posts.dart';
import '../centers/admin_centers.dart';
import '../settings/settings.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<HomePageAdmin> {
  int currentIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> screens = [
    Posts(),
    MarketplaceScreen(),
    Settings(),
    AdminCentersScreen()
  ];
  List<BottomNavyBarItem> items = [
    BottomNavyBarItem(
        inactiveColor: Colors.redAccent,
        icon: Icon(Icons.home),
        title: Text("Accuiel")),
    BottomNavyBarItem(
        inactiveColor: Colors.amber,
        icon: Icon(Icons.storefront_sharp),
        title: Text("Achats")),
    BottomNavyBarItem(
        inactiveColor: Colors.green.withOpacity(0.5),
        icon: ImageIcon(
          AssetImage(
            'images/settings.png',
          ),
        ),
        title: Text("Parametres")),
    BottomNavyBarItem(
        inactiveColor: Colors.indigo,
        icon: Icon(Icons.location_on),
        title: Text("Centres")),
  ];
  Widget positive() {
    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: TextButton(
          onPressed: () {
            exit(0);
          },
          child: Text(
            "Oui",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget negative() {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Non",
          style: TextStyle(color: Colors.blueAccent),
        ));
  }

  Future<bool> avoidRteurnButton() async {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Vous etes sure de sortir"),
            actions: [
              negative(),
              positive(),
            ],
          );
        });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: avoidRteurnButton,
        child: Scaffold(
            extendBody: true,
            backgroundColor: Color(0xffe3eaef),
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Icon(
                        Icons.list,
                        color: Colors.indigo,
                      ),
                    );
                  },
                )),
            drawer: buildDrawer(context),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BottomNavyBar(
                backgroundColor: Colors.transparent,
                onItemSelected: (int value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                selectedIndex: currentIndex,
                items: items,
              ),
            ),
            body: screens[currentIndex]),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      elevation: 36.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.indigo,
                Colors.blueGrey,
              ]),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: Constants.screenHeight,
              child: ListView(padding: EdgeInsets.zero, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Constants.screenHeight * 0.1,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg"),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Mes commandes',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing:
                      Icon(Icons.shopping_cart_sharp, color: Colors.white),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mescmd()));
                  },
                ),
                ListTile(
                  title: const Text(
                    'parametre',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Parametre()));
                  },
                ),
                ListTile(
                  title: const Text(
                    'à propos de nous',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing:
                      Icon(Icons.question_mark_outlined, color: Colors.white),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AproposScreen()));
                  },
                ),
                ListTile(
                  title: const Text(
                    'Deconnecter',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                ),
              ]),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
