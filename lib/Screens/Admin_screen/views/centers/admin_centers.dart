import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp00/Models/centerModel.dart';
import 'package:myapp00/constants.dart';

import 'map.dart';

var dataSnapshot = FirebaseFirestore.instance
    .collection("centers")
    .orderBy("creationDate", descending: false);

class AdminCentersScreen extends StatefulWidget {
  const AdminCentersScreen({Key? key}) : super(key: key);

  @override
  _CentersState createState() => _CentersState();
}

class _CentersState extends State<AdminCentersScreen> {
  Future<Placemark> test(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    var test = await placemarks[0];

    return test;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xffe3eaef),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Constants.screenHeight * 0.03,
                  top: Constants.screenHeight * 0.1),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: Constants.screenHeight * 0.02),
                          child: Text(
                            "Liste de centres de camping",
                            style: TextStyle(
                                fontSize: Constants.screenHeight * 0.025),
                          ),
                        ),
                      ),
                      Image.asset(
                        'images/tente.png',
                        height: Constants.screenHeight * 0.07,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
              stream: dataSnapshot.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.size == 0) {
                    return Center(
                      child: Container(
                        height: Constants.screenHeight * 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset("images/error.json",
                                repeat: false,
                                height: Constants.screenHeight * 0.1),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Pas de centres pour le moment "),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          List<CenterModel> centersList = [];
                          var listOfData = snapshot.data!.docs.toList();

                          for (var center in listOfData) {
                            centersList.add(CenterModel.fromJson(
                                center.data() as Map<String, dynamic>));
                          }

                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    onTap: () {
                                      Slidable.of(context)?.renderingMode ==
                                              SlidableRenderingMode.none
                                          ? Slidable.of(context)?.open()
                                          : Slidable.of(context)?.close();
                                    },
                                    caption: "Annuler",
                                    icon: Icons.close,
                                    color: Colors.red,
                                  ),
                                  IconSlideAction(
                                    caption: "Supprimer",
                                    icon: Icons.delete,
                                    color: Colors.green,
                                    onTap: () {
                                      snapshot.data!.docs[index].reference
                                          .delete();
                                    },
                                  )
                                ],
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                    ),
                                    height: Constants.screenHeight * 0.15,
                                    child: ListTile(
                                      title: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Nom de centre : ${centersList[index].name}"),
                                          Row(
                                            children: [
                                              Text(
                                                  "Adresse : ${centersList[index].adresse}"),
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.blueAccent,
                                              )
                                            ],
                                          ),
                                          Text(
                                              "Date de création : ${DateFormat('MM/dd/yyyy hh:mm').format(centersList[index].creationDate)}"),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          );
                        });
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(MapScreen());
          },
          child: Icon(Icons.location_on),
        ),
      ),
    );
  }
}
