import 'dart:convert';
import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/BaseUtils.dart';
import 'package:dail_box/AppUtils.dart/LocationData.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/ForgotPassword/forgot_password.dart';
import 'package:dail_box/Screens/SignUp/sign_up.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'SignInController.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final controller = Get.put(SignInController());

  @override
  void initState() {
    getLocation();
    GetStorage storage = GetStorage();
    storage.write('isFirst', 'true');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Skip'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            findLanguageController.isEnglishLocale.value
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: height / 40,
                          ),
                          Text(
                            'Sign in'.tr,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2),
                          ),
                          SizedBox(
                            height: height / 30,
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
                                  textAlign: findLanguageController
                                          .isEnglishLocale.value
                                      ? TextAlign.left
                                      : TextAlign.right,
                                  textInputAction: TextInputAction.next,
                                  decoration: findLanguageController
                                          .isEnglishLocale.value
                                      ? InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.phone,
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
                                              top: 15,
                                              right: 15),
                                          hintStyle: TextStyle(
                                              color: greyColor, fontSize: 12),
                                          hintText: "Email or Phone".tr)
                                      : InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.phone,
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
                                              top: 15,
                                              right: 15),
                                          hintStyle: TextStyle(
                                              color: greyColor, fontSize: 12),
                                          hintText: "Email or Phone".tr)),
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
                                  textAlign: findLanguageController
                                          .isEnglishLocale.value
                                      ? TextAlign.left
                                      : TextAlign.right,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  controller: controller.passwordCon,
                                  textInputAction: TextInputAction.done,
                                  decoration: findLanguageController
                                          .isEnglishLocale.value
                                      ? InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.lock_outline,
                                            color: greyColor,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              if (controller.obsecure.value) {
                                                controller.obsecure.value =
                                                    false;
                                              } else {
                                                controller.obsecure.value =
                                                    true;
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
                                              top: 15,
                                              right: 15),
                                          hintStyle: TextStyle(
                                              color: greyColor, fontSize: 12),
                                          hintText: "Password".tr)
                                      : InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.lock_outline,
                                            color: greyColor,
                                          ),
                                          prefixIcon: IconButton(
                                            onPressed: () {
                                              if (controller.obsecure.value) {
                                                controller.obsecure.value =
                                                    false;
                                              } else {
                                                controller.obsecure.value =
                                                    true;
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
                                              top: 15,
                                              right: 15),
                                          hintStyle: TextStyle(
                                              color: greyColor, fontSize: 12),
                                          hintText: "Password".tr),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment:
                                findLanguageController.isEnglishLocale.value
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                Get.to(ForgotPassword());
                              },
                              child: Text(
                                'Forgot Password'.tr,
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
                                      snackBarFailer(
                                          'Please enter password'.tr);
                                    }
                                  } else {
                                    snackBarFailer(
                                        'Please enter email first'.tr);
                                  }
                                },
                                child: Text(
                                  "SIGN IN".tr,
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
                                'or Sign in with'.tr,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  signInWithGoogle();
                                },
                                child: Card(
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
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              InkWell(
                                onTap: () {
                                  _fblogin();
                                },
                                child: Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image(
                                      height: height / 30,
                                      image: AssetImage(
                                          'assets/icons/facebook.png'),
                                    ),
                                  ),
                                ),
                              ),
                              // Card(
                              //   elevation: 3,
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(10.0),
                              //     child: Image(
                              //       height: height / 30,
                              //       image:
                              //           AssetImage('assets/icons/twitter.png'),
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: new TextSpan(
                                  text: 'Donʼt have an account ? '.tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    new TextSpan(
                                      text: ' Sign up '.tr,
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

  Future signInWithGoogle({String? type}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    printlog(
        'googleSignInAuthentication = ${googleSignInAuthentication.accessToken}');
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;
    printlog(
        'email = > ${user!.email} name = > ${user.displayName} unique id = > ${user.uid} unique id = > ${user.photoURL} phone number = > ${user.phoneNumber}}');
    Map map = {
      'email_id': '${user.email}',
      'social_id': '${user.uid}',
      'fullname': '${user.displayName}',
      'f_name': '${user.displayName}'.split(' ')[0],
      'l_name': '${user.displayName}'.split(' ')[1],
      'picture': '${user.photoURL}',
      'login_type': 'google',
      'device_type': device_type,
      'device_token': firebaseToken,
    };
    controller.loading.value = true;
    ApiUtils.socialloginApi(controller: controller, mapData: map);
  }

  Future<void> signOutGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    print("User Signed Out");
  }

  Future<Null> _fblogin() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final response = await Dio().get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,picture,email&access_token=${result.accessToken!.token}');
      log('fb responce = ${response.data}');
      Map map = json.decode(response.data);
      log('fb responce = $map');
      Map mapdata = {
        'email_id': '${map['email']}',
        'social_id': '${map['id']}',
        'fullname': '${map['name']}',
        'f_name': '${map['first_name']}',
        'l_name': '${map['last_name']}',
        'picture': '${map['picture']['data']['url']}',
        'login_type': 'fb',
        'device_type': device_type,
        'device_token': firebaseToken,
      };
      controller.loading.value = true;
      ApiUtils.socialloginApi(controller: controller, mapData: mapdata);
    }
  }
}
