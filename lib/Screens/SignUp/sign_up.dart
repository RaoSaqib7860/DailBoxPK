import 'dart:convert';
import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/BaseUtils.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/SignUp/SignUpController.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool istermsCheck = false;
  final controller = Get.put(SignUpController());

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
            Obx(
              () => Column(
                crossAxisAlignment: findLanguageController.isEnglishLocale.value
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
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
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: FadeInUp(
                          delay: Duration(milliseconds: 300),
                          child: Column(
                            crossAxisAlignment:
                                findLanguageController.isEnglishLocale.value
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                            children: <Widget>[
                              RichText(
                                text: new TextSpan(
                                    text: 'Create your'.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                      new TextSpan(
                                        text: ' account '.tr,
                                        style: TextStyle(color: blueColor),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap =
                                              () => print('Tap Here onTap'),
                                      ),
                                      new TextSpan(
                                        text: 'for FREE today'.tr,
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap =
                                              () => print('Tap Here onTap'),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'You can start listing your businesses after\n registration.'
                                    .tr,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.grey[100],
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[400]!,
                                              offset: Offset(0.0, 1.0),
                                              //(x,y)
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          cursorColor: Colors.black,
                                          textAlign: findLanguageController
                                                  .isEnglishLocale.value
                                              ? TextAlign.left
                                              : TextAlign.right,
                                          keyboardType: TextInputType.text,
                                          controller: controller.fNameCon,
                                          textInputAction: TextInputAction.next,
                                          decoration: findLanguageController
                                                  .isEnglishLocale.value
                                              ? InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.person_outline,
                                                    color: greyColor,
                                                  ),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 15,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      color: greyColor,
                                                      fontSize: 12),
                                                  hintText: "First Name".tr)
                                              : InputDecoration(
                                                  suffixIcon: Icon(
                                                    Icons.person_outline,
                                                    color: greyColor,
                                                  ),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 15,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      color: greyColor,
                                                      fontSize: 12),
                                                  hintText: "First Name".tr),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.grey[100],
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[400]!,
                                              offset: Offset(0.0, 1.0),
                                              //(x,y)
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          cursorColor: Colors.black,
                                          textAlign: findLanguageController
                                                  .isEnglishLocale.value
                                              ? TextAlign.left
                                              : TextAlign.right,
                                          controller: controller.lNameCon,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          decoration: findLanguageController
                                                  .isEnglishLocale.value
                                              ? InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.person_outline,
                                                    color: greyColor,
                                                  ),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 15,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      color: greyColor,
                                                      fontSize: 12),
                                                  hintText: "Last Name".tr)
                                              : InputDecoration(
                                                  suffixIcon: Icon(
                                                    Icons.person_outline,
                                                    color: greyColor,
                                                  ),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 15,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      color: greyColor,
                                                      fontSize: 12),
                                                  hintText: "Last Name".tr),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
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
                                    textAlign: findLanguageController
                                            .isEnglishLocale.value
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    controller: controller.phoneCon,
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
                                            hintText: "03001234567".tr)
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
                                            hintText: "03001234567".tr),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
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
                                    textAlign: findLanguageController
                                            .isEnglishLocale.value
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    controller: controller.emailCon,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: findLanguageController
                                            .isEnglishLocale.value
                                        ? InputDecoration(
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
                                                top: 15,
                                                right: 15),
                                            hintStyle: TextStyle(
                                                color: greyColor, fontSize: 12),
                                            hintText: "Email".tr)
                                        : InputDecoration(
                                            suffixIcon: Icon(
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
                                                top: 15,
                                                right: 15),
                                            hintStyle: TextStyle(
                                                color: greyColor, fontSize: 12),
                                            hintText: "Email".tr),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
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
                                    obscureText: controller.obsecurefirst.value,
                                    cursorColor: Colors.black,
                                    textAlign: findLanguageController
                                            .isEnglishLocale.value
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    controller: controller.passwordCon,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: findLanguageController
                                            .isEnglishLocale.value
                                        ? InputDecoration(

                                          
                                            prefixIcon: Icon(
                                              Icons.lock_outline,
                                              color: greyColor,
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                if (controller
                                                    .obsecurefirst.value) {
                                                  controller.obsecurefirst
                                                      .value = false;
                                                } else {
                                                  controller.obsecurefirst
                                                      .value = true;
                                                }
                                              },
                                              icon: Icon(Icons.remove_red_eye,
                                                  color: controller
                                                          .obsecurefirst.value
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
                                                if (controller
                                                    .obsecurefirst.value) {
                                                  controller.obsecurefirst
                                                      .value = false;
                                                } else {
                                                  controller.obsecurefirst
                                                      .value = true;
                                                }
                                              },
                                              icon: Icon(Icons.remove_red_eye,
                                                  color: controller
                                                          .obsecurefirst.value
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
                              SizedBox(
                                height: 10,
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
                                    obscureText:
                                        controller.obsecuresecond.value,
                                    controller: controller.confirmPasswordCon,
                                    textAlign: findLanguageController
                                            .isEnglishLocale.value
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
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
                                                if (controller
                                                    .obsecuresecond.value) {
                                                  controller.obsecuresecond
                                                      .value = false;
                                                } else {
                                                  controller.obsecuresecond
                                                      .value = true;
                                                }
                                              },
                                              icon: Icon(Icons.remove_red_eye,
                                                  color: controller
                                                          .obsecuresecond.value
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
                                            hintText: "Confirm Password".tr)
                                        : InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.lock_outline,
                                              color: greyColor,
                                            ),
                                            prefixIcon: IconButton(
                                              onPressed: () {
                                                if (controller
                                                    .obsecuresecond.value) {
                                                  controller.obsecuresecond
                                                      .value = false;
                                                } else {
                                                  controller.obsecuresecond
                                                      .value = true;
                                                }
                                              },
                                              icon: Icon(Icons.remove_red_eye,
                                                  color: controller
                                                          .obsecuresecond.value
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
                                            hintText: "Confirm Password".tr),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              findLanguageController.isEnglishLocale.value
                                  ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: istermsCheck,
                                          onChanged: (v) {
                                            setState(() {
                                              istermsCheck = v!;
                                            });
                                          },
                                          activeColor: blueColor,
                                          visualDensity:
                                              VisualDensity.comfortable,
                                        ),
                                        SizedBox(
                                          width: width * 0.030,
                                        ),
                                        Text(
                                          'I agree to Dialboxx Terms & Conditions'.tr,
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    )
                                  : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'I agree to Dialboxx Terms & Conditions'.tr,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: width * 0.030,
                                        ),
                                        Checkbox(
                                          value: istermsCheck,
                                          onChanged: (v) {
                                            setState(() {
                                              istermsCheck = v!;
                                            });
                                          },
                                          activeColor: blueColor,
                                          visualDensity:
                                              VisualDensity.comfortable,
                                        ),
                                      ],
                                    ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                // margin: EdgeInsets.only(left: 30,right: 30),
                                width: MediaQuery.of(context).size.width,
                                height: height / 16,
                                child: RaisedButton(
                                  color: blueColor,
                                  onPressed: () {
                                    if (controller.fNameCon.text.isNotEmpty) {
                                      if (controller.lNameCon.text.isNotEmpty) {
                                        if (controller
                                            .phoneCon.text.isNotEmpty) {
                                          if (controller
                                              .passwordCon.text.isNotEmpty) {
                                            if (controller.passwordCon.text ==
                                                controller
                                                    .confirmPasswordCon.text) {
                                              if (istermsCheck) {
                                                printlog('button clicked');
                                                controller.loading.value = true;
                                                ApiUtils.signUpApi(controller);
                                              } else {
                                                snackBarFailer(
                                                    'Select Terms and Condition box'
                                                        .tr);
                                              }
                                            } else {
                                              snackBarFailer(
                                                  'Password didn\'t match'.tr);
                                            }
                                          } else {
                                            snackBarFailer(
                                                'Please enter password first'
                                                    .tr);
                                          }
                                        } else {
                                          snackBarFailer(
                                              'Please enter phone number first'
                                                  .tr);
                                        }
                                      } else {
                                        snackBarFailer(
                                            'Please enter last name'.tr);
                                      }
                                    } else {
                                      snackBarFailer(
                                          'Please enter first name'.tr);
                                    }
                                    // Get.to(PhoneVerification());
                                  },
                                  child: Text(
                                    "Create Account".tr,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      launchURL(
                                          "https://dialboxx.pk/front/terms");
                                    },
                                    child: Text(
                                      'Terms '.tr,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: blueColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '&',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: blueColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchURL(
                                          "https://dialboxx.pk/front/privacy");
                                    },
                                    child: Text(
                                      ' Privacy Policy'.tr,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: blueColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
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
                                    'Or Sign up with'.tr,
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
                                          image: AssetImage(
                                              'assets/icons/google.png'),
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
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: RichText(
                                  text: new TextSpan(
                                      text: 'Already have an account ?'.tr,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      children: [
                                        new TextSpan(
                                          text: ' Sign In '.tr,
                                          style: TextStyle(
                                              color: blueColor,
                                              fontWeight: FontWeight.bold),
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pop(context);
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
                  ),
                ],
              ),
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
    ApiUtils.socialloginApis(controller: controller, mapData: map);
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
      ApiUtils.socialloginApis(controller: controller, mapData: mapdata);
    }
  }
}
