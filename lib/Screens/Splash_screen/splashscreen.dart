import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp00/Authentication/Sign_in/sign_in.dart';
import 'package:myapp00/constants.dart';

import '../../OnBoarding/on_boarding_page.dart';
import '../Admin_screen/views/home_page/home_page_admin.dart';
import '../Client_screen/views/home_page/home_apge_client.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var resultSeen = GetStorage().read("seen");
  var auth = GetStorage().read("auth");

  var type_auth = GetStorage().read("type_auth");
  @override
  void initState() {
    super.initState();
    var timer = Timer(
        Duration(seconds: 3),
        () => Get.to(resultSeen == 1
            ? (auth == 1
                ? (type_auth == 1 ? HomePageAdmin() : HomePageClient())
                : SignInScreen())
            : OnBoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.indigo,
                    Colors.blueGrey,
                  ]),
            ),
            child: Column(children: <Widget>[
              SizedBox(
                height: size.height * 0.2,
              ),
              Image(
                image: AssetImage('images/camping.png'),
                height: 90.0,
                width: 90.0,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                Constants.HomeText,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Lottie.asset("images/loading.json", height: 50),
            ])));
  }
}
