import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/ForgotPassword/forgot_password.dart';
import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/Screens/SignUp/sign_up.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'SignInController.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return SafeArea(
      child: Scaffold(
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
                        color: Colors.white,
                      ),
                      onPressed: () {},
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
                    padding: const EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: height / 40,
                          ),
                          Text(
                            'SIGN IN',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2),
                          ),
                          SizedBox(
                            height: height / 20,
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
                                textInputAction: TextInputAction.next,
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
                                        color: greyColor, fontSize: 12),
                                    hintText: "Email or phone"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => ClipRRect(
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
                                  obscureText: controller.obsecure.value,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  controller: controller.passwordCon,
                                  textInputAction: TextInputAction.done,
                                  decoration: new InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: greyColor,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          if (controller.obsecure.value) {
                                            controller.obsecure.value = false;
                                          } else {
                                            controller.obsecure.value = true;
                                          }
                                        },
                                        icon: Icon(Icons.remove_red_eye,
                                            color: controller.obsecure.value
                                                ? greyColor
                                                : Colors.blue),
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
                                          color: greyColor, fontSize: 12),
                                      hintText: "Password"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Get.to(ForgotPassword());
                              },
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                    color: redColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlipInY(
                            delay: Duration(milliseconds: 300),
                            child: Container(
                              // margin: EdgeInsets.only(left: 30,right: 30),
                              width: MediaQuery.of(context).size.width,
                              height: height / 16,
                              child: RaisedButton(
                                color: blueColor,
                                onPressed: () {
                                  if (controller.emailCon.text.isNotEmpty) {
                                    if (controller.emailCon.text.isNotEmpty) {
                                      controller.loading.value = true;
                                      ApiUtils.loginApi(controller);
                                    } else {
                                      snackBarFailer('Please enter password');
                                    }
                                  } else {
                                    snackBarFailer('Please enter email first');
                                  }
                                },
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: greyColorlight,
                                ),
                              ),
                              Text(
                                'Or Sign in with',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: greyColorlight,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image(
                                    height: height / 30,
                                    image:
                                        AssetImage('assets/icons/google.png'),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image(
                                    height: height / 30,
                                    image:
                                        AssetImage('assets/icons/facebook.png'),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image(
                                    height: height / 30,
                                    image:
                                        AssetImage('assets/icons/twitter.png'),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: new TextSpan(
                                  text: 'Don\'t have an account ? ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    new TextSpan(
                                      text: ' Sign Up ',
                                      style: TextStyle(
                                          color: blueColor,
                                          fontWeight: FontWeight.bold),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(SignUp());
                                        },
                                    ),
                                  ]),
                            ),
                          ),
                        ],
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
