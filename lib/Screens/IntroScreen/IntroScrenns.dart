import 'package:dail_box/Screens/IntroScreen/IntroOne.dart';
import 'package:dail_box/Screens/IntroScreen/IntroThree.dart';
import 'package:dail_box/Screens/IntroScreen/IntroTwo.dart';
import 'package:dail_box/Screens/IntroScreen/Introfour.dart';
import 'package:dail_box/Screens/SignIn/sign_in.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({Key? key}) : super(key: key);

  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  int currentIndex = 0;
  List listdot = [1, 2, 3, 4];
  PageController pageController = PageController();
  List<Widget> listOfWidget = [
    IntroOne(),
    IntroTwo(),
    IntroThree(),
    IntroFour()
  ];

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            PageView.builder(
              itemBuilder: (c, index) {
                return listOfWidget[index];
              },
              controller: pageController,
              itemCount: listOfWidget.length,
              physics: NeverScrollableScrollPhysics(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.090,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: width * 0.045),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: listdot.map((e) {
                        int index = listdot.indexOf(e);
                        return currentIndex == index
                            ? Container(
                                height: 8,
                                width: 8,
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: blueColor),
                              )
                            : Container(
                                height: 8,
                                width: 8,
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.black38)),
                              );
                      }).toList(),
                    ),
                    InkWell(
                      onTap: () {
                        if (currentIndex != 3) {
                          setState(() {
                            currentIndex = currentIndex + 1;
                          });
                          pageController.nextPage(
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeIn);
                        } else {
                          Get.offAll(SignIn());
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              color: blueColor,
                              letterSpacing: 1,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.010,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: blueColor,
                            size: 15,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
