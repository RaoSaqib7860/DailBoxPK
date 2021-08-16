import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/ForgotPassword/ForgotPasswordController.dart';
import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: FadeInUp(
                        delay: Duration(milliseconds: 300),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: height / 30,
                            ),
                            RichText(
                              text: new TextSpan(
                                  text: 'Forgot',
                                  style: TextStyle(
                                      color: blueColor,
                                      fontSize: 20,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    new TextSpan(
                                      text: ' your ',
                                      style: TextStyle(color: Colors.black),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () => print('Tap Here onTap'),
                                    ),
                                    new TextSpan(
                                      text: 'password ',
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () => print('Tap Here onTap'),
                                    ),
                                    new TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      text: 'so Try again..',
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () => print('Tap Here onTap'),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: height / 50,
                            ),
                            Text(
                              'Register your bussiness with dialboxx to gain visibility in the marketplace.',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey[100],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[400]!,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  controller: controller.emailCon,
                                  decoration: new InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: greyColor,
                                      ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintStyle: TextStyle(
                                          color: greyColor, fontSize: 14),
                                      hintText: "Email"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 40,
                            ),
                            Container(
                              // margin: EdgeInsets.only(left: 30,right: 30),
                              width: MediaQuery.of(context).size.width,
                              height: height / 16,
                              child: RaisedButton(
                                color: blueColor,
                                onPressed: () {
                                  if (controller.emailCon.text.isNotEmpty) {
                                    controller.loading.value = true;
                                    ApiUtils.forgetpasswordApi(controller);
                                  } else {
                                    snackBarFailer(
                                        'Please enter email or password');
                                  }
                                },
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(() => controller.loading.value == true
                ? InkWell(
                    onTap: () {
                      controller.loading.value = false;
                    },
                    child: Container(
                      height: height,
                      width: width,
                      child: Center(
                        child: SpinKitPulse(
                          color: Colors.white,
                          size: 80.0,
                        ),
                      ),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    ),
                  )
                : SizedBox())
          ],
        ),
      ),
    );
  }
}
