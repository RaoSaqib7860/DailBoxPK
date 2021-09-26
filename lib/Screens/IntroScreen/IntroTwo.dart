import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroTwo extends StatefulWidget {
  const IntroTwo({Key? key}) : super(key: key);

  @override
  _IntroTwoState createState() => _IntroTwoState();
}

class _IntroTwoState extends State<IntroTwo> {
  List list = [
    'p1.jpeg',
    'p2.jpg',
    'p3.jpg',
  ];

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
                              text: 'List your business',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  height: 1.3,
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text:
                                      ' on Dialboxx to gain leads and to showcase your products, services & business information online.',
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
                          height: height * 0.030,
                        ),
                        Column(
                          children: list.map((e) {
                            return Container(
                              height: height * 0.170,
                              width: width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black12, width: 1))),
                              child: Row(
                                children: [
                                  Container(
                                    height: height * 0.150,
                                    width: width * 0.300,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5, color: blueColor),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(2),
                                      child: Image.asset(
                                        'assets/images/$e',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.020,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'RMS Pack & Movers Service',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'blue area islamabad',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black26),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '4.0',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black26),
                                          ),
                                          SizedBox(
                                            width: width * 0.010,
                                          ),
                                          Row(
                                            children: [1, 2, 3, 4, 5].map((e) {
                                              return InkWell(
                                                child: Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: Colors.yellow[700],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                          Text(
                                            '125 reviews',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black26),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.010,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: height * 0.040,
                                            width: width * 0.220,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.call,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Call',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                          Container(
                                            height: height * 0.040,
                                            width: width * 0.220,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.messenger_outline,
                                                  color: blueColor,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Message',
                                                  style: TextStyle(
                                                      color: blueColor,
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    width: 1,
                                                    color: blueColor)),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                                  Icon(
                                    CupertinoIcons.suit_heart,
                                    color: Colors.black38,
                                  )
                                ],
                              ),
                            );
                          }).toList(),
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
