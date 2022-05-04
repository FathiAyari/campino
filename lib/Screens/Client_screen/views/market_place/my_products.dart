import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp00/Models/ProductModel.dart';
import 'package:myapp00/Screens/Client_screen/views/market_place/product_details.dart';
import 'package:myapp00/constants.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              back_button(Colors.blueAccent, "Mes produits"),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("marketplace")
                      .where("owner", isEqualTo: Constants.user['uid'])
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
                              return ClipRRect(
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
                                      caption: "Vender",
                                      icon: Icons.done,
                                      color: Colors.green,
                                      onTap: () {
                                        snapshot.data!.docs[index].reference
                                            .update({'sold': true});
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
                                            Image.network(
                                              "${MyProductList[index].image}",
                                              fit: BoxFit.cover,
                                              height:
                                                  Constants.screenHeight * 0.15,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                  child:
                                      Text("vous avez aucune produit publieé"),
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
        ),
      ),
    );
  }
}
