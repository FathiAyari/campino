import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants.dart';

var postsData = FirebaseFirestore.instance.collection("posts").snapshots();

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffe3eaef),
        body: StreamBuilder<QuerySnapshot>(
          stream: postsData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.size != 0) {
                return ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: Constants.screenHeight * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      width: double.infinity,
                      child: Column(
                        children: [],
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
                          child: Text("Pas des publications pour le moment "),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
