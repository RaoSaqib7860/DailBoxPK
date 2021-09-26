import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/SignUp/SignUpController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool istermsCheck = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                          keyboardType: TextInputType.text,
                                          controller: controller.fNameCon,
                                          textInputAction: TextInputAction.next,
                                          decoration: new InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.person_outline,
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
                                          controller: controller.lNameCon,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          decoration: new InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.person_outline,
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
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    controller: controller.phoneCon,
                                    decoration: new InputDecoration(
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
                                    controller: controller.emailCon,
                                    keyboardType: TextInputType.text,
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
                                    controller: controller.passwordCon,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: new InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: greyColor,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            if (controller
                                                .obsecurefirst.value) {
                                              controller.obsecurefirst.value =
                                                  false;
                                            } else {
                                              controller.obsecurefirst.value =
                                                  true;
                                            }
                                          },
                                          icon: Icon(Icons.remove_red_eye,
                                              color:
                                                  controller.obsecurefirst.value
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
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: new InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: greyColor,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            if (controller
                                                .obsecuresecond.value) {
                                              controller.obsecuresecond.value =
                                                  false;
                                            } else {
                                              controller.obsecuresecond.value =
                                                  true;
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
                              Row(
                                children: [
                                  Checkbox(
                                    value: istermsCheck,
                                    onChanged: (v) {
                                      setState(() {
                                        istermsCheck = v!;
                                      });
                                    },
                                    activeColor: blueColor,
                                    visualDensity: VisualDensity.comfortable,
                                  ),
                                  SizedBox(
                                    width: width * 0.030,
                                  ),
                                  Text(
                                    'I agree to Dialboxx Terms & Conditions',
                                    style: TextStyle(fontSize: 12),
                                  )
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
                                                    'Please confirm Terms and Condition');
                                              }
                                            } else {
                                              snackBarFailer(
                                                  'Password didn\'t match');
                                            }
                                          } else {
                                            snackBarFailer(
                                                'Please enter password first');
                                          }
                                        } else {
                                          snackBarFailer(
                                              'Please enter phone number first');
                                        }
                                      } else {
                                        snackBarFailer(
                                            'Please enter last name');
                                      }
                                    } else {
                                      snackBarFailer('Please enter first name');
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
                                      'Terms ',
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
                                      ' Privacy Policy',
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
                                  Card(
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
                                  SizedBox(
                                    width: width * 0.1,
                                  ),
                                  Card(
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
}
