import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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
                                      ' to connect with likeminded people in our community.'
                                          .tr,
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
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade400,
                                        width: 1.7)),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: 35,
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
                                        'Select Industry'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,fontSize: 12),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.black45,
                                        size: 27,
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
                                height: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade400,
                                        width: 1.7)),
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
                                        'Category'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,fontSize: 12),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.black45,
                                        size: 27,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.010,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Write some thing here...',
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                              )),
                          enabled: false,
                        ),
                        SizedBox(
                          height: height * 0.030,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 30,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Upload Picture',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[100],
                              borderRadius: BorderRadius.circular(5),
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: Colors.black.withOpacity(0.1),
                              //       offset: Offset(2, 2),
                              //       blurRadius: 5)
                              // ]

                              ),
                          child: Text(
                            'Publish'.tr,
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 10,
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
                                                'assets/images/fm.jpeg'))),
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
                                  'I am a Business Analyst,I will conduct market analysis,both product lines and the overall profitability of the business. I will ensure business data and reporting needs are met.'
                                      .tr,
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
                                    'assets/images/business.jpeg',
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
