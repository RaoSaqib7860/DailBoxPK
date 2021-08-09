import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/login/register_selection.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/board.png'))),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: blueColor.withOpacity(0.8),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Choose your language',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'اپنی زبان کا انتخاب کریں',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeInUp(delay: Duration(milliseconds: 500),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      width: MediaQuery.of(context).size.width,
                      height: height/16,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Get.to(RegisterSelection());
                        },
                        child: Text(
                          "ENGLISH",
                          style: TextStyle(color: blueColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeInUp(delay: Duration(milliseconds: 500),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      width: MediaQuery.of(context).size.width,
                      height: height/16,
                      child: RaisedButton(
                        color: redColor,
                        onPressed: () {},
                        child: Text(
                          "اردو",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
