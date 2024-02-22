import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:studize/constants/splashController.dart';
import 'package:studize/onBoardingScreens/screen1.dart';
import 'package:studize/onBoardingScreens/screen2.dart';
import 'package:studize/onBoardingScreens/screen3.dart';
import 'package:studize/onBoardingScreens/screen4.dart';
import 'package:studize/onBoardingScreens/screen5.dart';
import 'package:studize/screens/main_container.dart';

class OnBoarding1 extends StatefulWidget {
  OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  int indexindicator = 0;
  SplashController splash = Get.find();
  bool spl = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spl = splash.GetSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SplashDecider(),
    );
  }

  SplashDecider() {
    if (spl == true) {
      return MainContainer();
    } else {
      return SplashScreens();
    }
  }

  Container SplashScreens() {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        Color.fromARGB(255, 7, 26, 41),
        const Color.fromARGB(255, 3, 12, 20),
      ])),
      child: Column(
        children: [
          Expanded(
              child: Container(
                  child: CarouselSlider(
                      items: [
                Screen1(),
                Screen2(),
                Screen3(),
                Screen4(),
                Screen5(),
              ],
                      options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: false,
                          autoPlayInterval: Duration(milliseconds: 5000),
                          onPageChanged: (index, reason) {
                            setState(() {
                              indexindicator = index;
                            });
                          },
                          height: double.maxFinite,
                          viewportFraction: 1)))),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 10,
                  width: 150,
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 10,
                          width: (index == indexindicator) ? 40 : 10,
                          decoration: BoxDecoration(
                              color: (index == indexindicator)
                                  ? Colors.blue
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(40)),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 10),
                          child: GestureDetector(
                            onTap: () {
                              splash.SetSplash(true);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MainContainer();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            height: 140,
          )
        ],
      ),
    );
  }
}
