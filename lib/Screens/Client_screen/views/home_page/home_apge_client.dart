import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp00/Screens/Client_screen/views/centers/centers.dart';
import 'package:myapp00/constants.dart';
import 'package:myapp00/drawerpage/a_propos_de_nous.dart';
import 'package:myapp00/drawerpage/notification.dart';
import 'package:myapp00/home/marketplace.dart';

import '../../../../OnBoarding/on_boarding_controller.dart';
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
  static OnBoardingController controller = OnBoardingController();
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
        icon: Icon(Icons.message),
        title: Text("Messages")),
    BottomNavyBarItem(
        inactiveColor: Colors.indigo,
        icon: Icon(Icons.location_on),
        title: Text("Centres")),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          bottomNavigationBar: BottomNavyBar(
            backgroundColor: Color(0xffe3eaef),
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

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      elevation: 36.0,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffe3eaef),
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
                    backgroundImage: NetworkImage("${Constants.user['Url']}"),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Mes commandes',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  trailing:
                      Icon(Icons.shopping_cart_sharp, color: Colors.blueAccent),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mescmd()));
                  },
                ),
                ListTile(
                  title: const Text(
                    'à propos de nous',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  trailing: Icon(Icons.question_mark_outlined,
                      color: Colors.blueAccent),
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
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  trailing: Icon(Icons.logout, color: Colors.blueAccent),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Êtes-vous sure de déconnecter ?"),
                            actions: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }, child: Text("Non"))),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blueAccent,
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                        controller.Logout();
                                      },
                                      child: Text(
                                        "Oui",
                                        style: TextStyle(color: Colors.white),
                                      ))),
                            ],
                          );
                        });
                  },
                ),
              ]),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close, color: Colors.blueAccent))
          ],
        ),
      ),
    );
  }
}
