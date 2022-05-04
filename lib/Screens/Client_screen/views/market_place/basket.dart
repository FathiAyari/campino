import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp00/Models/ProductModel.dart';
import 'package:myapp00/Screens/Client_screen/views/market_place/product_details.dart';
import 'package:myapp00/constants.dart';

import '../../../../Models/Users.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  late List<Product> myBasket;
  Future<List<Product>> getProducts() async {
    var allProducts =
        await FirebaseFirestore.instance.collection("marketplace").get();
    var itemsList = await FirebaseFirestore.instance
        .collection("users")
        .doc(Constants.user['uid'])
        .get();
    var myListOfProductsId =
        Cusers.fromJson(itemsList.data() as Map<String, dynamic>).basket;
    /*   print(allProducts.docs.toList());
    print(allProducts.docs.toList()[0].get('id'));*/
    List<Product> myBasket = [];
    for (var product in allProducts.docs.toList()) {
      if (myListOfProductsId.contains(product.id)) {
        myBasket.add(Product.fromJson(product.data() as Map<String, dynamic>));
      }
    }

    return myBasket;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffe3eaef),
            body: Column(
              children: [
                back_button(Colors.blueAccent, "Panier"),
                Expanded(
                  child: FutureBuilder<List<Product>>(
                    future: getProducts(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(ProductDetails(
                                        product: snapshot.data[index]));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
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
                                            "${snapshot.data[index].image}",
                                            fit: BoxFit.cover,
                                            height:
                                                Constants.screenHeight * 0.15,
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
                                                    "Nom : ${snapshot.data[index].name}"),
                                                Text(
                                                    "Adresse : ${snapshot.data[index].adresse}"),
                                                Text(
                                                    "Prix : ${snapshot.data[index].price}"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            )));
  }
}
