import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroFour extends StatefulWidget {
  const IntroFour({Key? key}) : super(key: key);

  @override
  _IntroFourState createState() => _IntroFourState();
}

class _IntroFourState extends State<IntroFour> {
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
                  child: Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Get in touch',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                letterSpacing: 1,
                                height: 1.3,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text:
                                    ' with businesses directly using our Message system. ',
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
                      Expanded(
                          child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.030),
                        child: ListView.separated(
                          itemCount: 4,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: blueColor, width: 1),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/images/man.jpeg'))),
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
                                                'Wqas Ahmed',
                                                style: TextStyle(
                                                    color: blueColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Hi , there ',
                                          style: TextStyle(
                                              color: greyColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '12 pm',
                                        style: TextStyle(
                                            color: greyColor, fontSize: 11),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      true
                                          ? Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: blueColor),
                                              child: Text(
                                                '2',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext ctxt, int index) {
                            return Divider(
                              thickness: 10,
                              color: Colors.transparent,
                            );
                          },
                        ),
                      ))
                    ],
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
