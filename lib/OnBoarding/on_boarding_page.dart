import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp00/OnBoarding/on_boarding_content.dart';
import 'package:myapp00/OnBoarding/on_boarding_controller.dart';
import 'package:myapp00/constants.dart';

import '../Authentication/Sign_in/sign_in.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

PageController _controller = PageController();
int currentPage = 0;
List<Content> contentList = [
  Content(
    img: 'images/camp.json',
    description:
        'êtes-vous intéressé par le camping en Tunisie? \n Campino est le mailleure solution pour vous .',
    title: 'Bienvenue chez Campino ',
  ),
  Content(
    img: 'images/location.json',
    description:
        'Nous vous proposons un guide et  un espace de partge de vous experience en camping et et faire la reconnaissance avec des autres campeurs',
    title: '',
  ),
  Content(
    img: 'images/cart.json',
    description:
        'Avec Campino vous êtes libre de vendre et acheter des equipement de camping en ligne',
    title: '',
  )
];
OnBoardingController onBoardingController = OnBoardingController();

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: contentList.length,
                scrollDirection: Axis.horizontal, // the axis
                controller: _controller,
                itemBuilder: (context, int index) {
                  return contentList[index];
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(contentList.length, (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: Constants.screenHeight * 0.01,
                      width: (index == currentPage)
                          ? Constants.screenWidth * 0.08
                          : Constants.screenWidth *
                              0.04, // condition au lieu de if else
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (index == currentPage)
                              ? Colors.white
                              : Colors.blue.withOpacity(0.8)),
                    );
                  }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              onBoardingController.check();
                              Get.to(SignInScreen());
                            },
                            child: Text(
                              "Ignorer",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 45,
                          child: ElevatedButton(
                              onPressed: (currentPage == contentList.length - 1)
                                  ? () {
                                      Get.to(SignInScreen());
                                    }
                                  : () {
                                      onBoardingController.check();
                                      _controller.nextPage(
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.easeInOutQuint);
                                    },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                primary: Colors.blueAccent,
                              ),
                              child: (currentPage == contentList.length - 1)
                                  ? Text("Commencer")
                                  : Text('Suivant')),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
