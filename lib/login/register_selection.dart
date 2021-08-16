import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/Screens/SignIn/sign_in.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegisterSelection extends StatefulWidget {
  @override
  _RegisterSelectionState createState() => _RegisterSelectionState();
}

class _RegisterSelectionState extends State<RegisterSelection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Transform.translate(
                offset: Offset(0, -height / 9),
                child: SvgPicture.asset(
                  'assets/svg/db main.svg',
                  height: height / 3,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                InkWell(
                  onTap: () {
                    Get.offAll(HomeScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Skip',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'SIGN UP AS',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Text(
                'Register your bussiness with dialboxx to gain visibility in the marketplace. Showcase your bussiness information.',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlipInX(
              delay: Duration(milliseconds: 300),
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                height: height / 16,
                child: RaisedButton(
                  color: blueColor,
                  onPressed: () {},
                  child: Text(
                    "BUSSINES OWNER",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlipInX(
              delay: Duration(milliseconds: 300),
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                height: height / 16,
                child: RaisedButton(
                  color: redColor,
                  onPressed: () {
                    Get.to(SignIn());
                  },
                  child: Text(
                    "USER",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
