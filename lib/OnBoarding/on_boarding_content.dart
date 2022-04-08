import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Content extends StatelessWidget {
  final String title;
  final String img;
  final String description;

  const Content(
      {Key? key,
      required this.title,
      required this.img,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo,
                  Colors.blueGrey,
                ]),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  "$title",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Lottie.asset(img, height: 320),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Text(
                  "$description",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
