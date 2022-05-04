import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp00/Screens/Client_screen/views/market_place/product_details.dart';

import '../../../../Models/ProductModel.dart';
import '../../../../constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        padding:
                            EdgeInsets.only(top: Constants.screenHeight * 0.02),
                        child: Text(
                          "Liste de demandes",
                          style: TextStyle(
                              fontSize: Constants.screenHeight * 0.025),
                        ),
                      ),
                    ),
                    Image.asset(
                      'images/request.png',
                      height: Constants.screenHeight * 0.07,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("marketplace")
                  .where("state", isEqualTo: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.size != 0) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          List<Product> MyProductList = [];
                          var listOfData = snapshot.data!.docs.toList();

                          for (var product in listOfData) {
                            MyProductList.add(Product.fromJson(
                                product.data() as Map<String, dynamic>));
                          }
                          return InkWell(
                            onTap: () {
                              Get.to(ProductDetails(
                                  product: MyProductList[index]));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    onTap: () {
                                      snapshot.data!.docs[index].reference
                                          .delete();
                                    },
                                    caption: "Supprimer",
                                    icon: Icons.close,
                                    color: Colors.red,
                                  ),
                                  IconSlideAction(
                                    caption: "Accepter",
                                    icon: Icons.done,
                                    color: Colors.green,
                                    onTap: () {
                                      snapshot.data!.docs[index].reference
                                          .update({'state': true});
                                    },
                                  )
                                ],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MyProductList[index].state
                                                ? Colors.green
                                                : Colors.red),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: Constants.screenHeight * 0.2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Hero(
                                            tag: MyProductList[index].id,
                                            child: Image.network(
                                              "${MyProductList[index].image}",
                                              fit: BoxFit.cover,
                                              height:
                                                  Constants.screenHeight * 0.15,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "Nom : ${MyProductList[index].name}"),
                                                Text(
                                                  "Adresse : ${MyProductList[index].adresse}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                    "Prix : ${MyProductList[index].price}"),
                                                Text(
                                                    "état : ${MyProductList[index].state ? "Accepté" : "en cours"}"),
                                                Row(
                                                  children: [
                                                    Text("Disponibilité : "),
                                                    Text(
                                                      "${MyProductList[index].sold ? "Non" : "Oui"}",
                                                      style: TextStyle(
                                                          color: MyProductList[
                                                                      index]
                                                                  .sold
                                                              ? Colors.red
                                                              : Colors.green),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
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
                              child: Text("vous avez aucune demande"),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
