import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class IntroThree extends StatefulWidget {
  const IntroThree({Key? key}) : super(key: key);

  @override
  _IntroThreeState createState() => _IntroThreeState();
}

class _IntroThreeState extends State<IntroThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: width * 0.040),
        child: Transform.translate(
          offset: Offset(0, -30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/db main.svg',
                height: height / 3,
              ),
              Expanded(
                child: Transform.translate(
                  offset: Offset(0, -60),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Use Db discussion forum '.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  height: 1.3,
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text:
                                  ' to connect with likeminded people in our community.'.tr,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: height * 0.040,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: 40,
                                color: Colors.red[900],
                                child: Theme(
                                  data: new ThemeData(
                                      canvasColor: Colors.red[900],
                                      primaryColor: Colors.black,
                                      accentColor: Colors.black,
                                      hintColor: Colors.black),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'INDUSTRY'.tr,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: 40,
                                color: blueColor,
                                child: Theme(
                                  data: new ThemeData(
                                      canvasColor: Colors.red[900],
                                      primaryColor: Colors.black,
                                      accentColor: Colors.black,
                                      hintColor: Colors.black),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'CATEGORIES'.tr,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.030,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/images/nature.jpg'))),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                'Furqan Mustafa',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Text(
                                              '12:00 pm',
                                              style: TextStyle(
                                                  color: greyColor,
                                                  fontSize: 8),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Categories > business'.tr,
                                          style: TextStyle(
                                              color: greyColor, fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: width,
                                child: Text(
                                  'Register your business with Dialboxx to gain visibility in the market-place.Showcase your business information products + service .... '.tr,
                                  style: new TextStyle(
                                      fontSize: 12, color: Colors.black38),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: height * 0.2,
                                  width: width,
                                  child: Image.asset(
                                    'assets/images/p1.jpeg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Container(
                                color: greyColor,
                                width: MediaQuery.of(context).size.width,
                                height: 0.5,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          CupertinoIcons.hand_thumbsup_fill,
                                          color: blueColor,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '120 Likes',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          CupertinoIcons.chat_bubble,
                                          color: blueColor,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '50 Comments',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.only(top: 10),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
