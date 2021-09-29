import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'CreatePasswordController.dart';

class CreatePassword extends StatefulWidget {
  final bool? fromPhone;

  const CreatePassword({Key? key, this.fromPhone}) : super(key: key);

  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePasswordController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
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
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: height * 0.020,
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
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: new TextSpan(
                                text: 'Confirm'.tr,
                                style: TextStyle(
                                    color: blueColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400),
                                children: [
                                  new TextSpan(
                                    text: ' your '.tr,
                                    style: TextStyle(color: Colors.black),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () => print('Tap Here onTap'),
                                  ),
                                  new TextSpan(
                                    text: 'password '.tr,
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () => print('Tap Here onTap'),
                                  ),
                                  new TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    text: ''.tr,
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () => print('Tap Here onTap'),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Register your business with dialboxx to gain visibility in the marketplace.'
                                .tr,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 50,
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
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: controller.p1Con,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  obscureText: controller.absecuretext.value
                                      ? false
                                      : true,
                                  decoration: new InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: greyColor,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          print('Click');
                                          if (controller.absecuretext.value) {
                                            controller.absecuretext.value =
                                                false;
                                          } else {
                                            controller.absecuretext.value =
                                                true;
                                          }
                                        },
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          color: controller.absecuretext.value
                                              ? Colors.blue
                                              : greyColor,
                                        ),
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
                                      hintText: "New Password".tr),
                                ),
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
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: controller.p2Con,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: new InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
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
                                    hintText: "Confirm Password".tr),
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
                                      offset: Offset(0.0, 1.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: controller.otpCon,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  obscureText: controller.absecureotp.value
                                      ? false
                                      : true,
                                  decoration: new InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: greyColor,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          if (controller.absecureotp.value) {
                                            controller.absecureotp.value =
                                                false;
                                          } else {
                                            controller.absecureotp.value = true;
                                          }
                                        },
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          color: controller.absecureotp.value
                                              ? Colors.blue
                                              : greyColor,
                                        ),
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
                                      hintText: "OTP".tr),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            // margin: EdgeInsets.only(left: 30,right: 30),
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            child: RaisedButton(
                              color: blueColor,
                              onPressed: () async {
                                if (controller.p1Con.text.isNotEmpty) {
                                  if (controller.p2Con.text.isNotEmpty) {
                                    if (controller.otpCon.text.isNotEmpty) {
                                      if (controller.p1Con.text ==
                                          controller.p2Con.text) {
                                        controller.loading.value = true;
                                        await ApiUtils.getverifyotp(
                                            controller: controller,
                                            fromPhone: widget.fromPhone);
                                      } else {
                                        snackBarFailer(
                                            'Otp fields should not is empty'
                                                .tr);
                                      }
                                    } else {
                                      snackBarFailer(
                                          'Otp fields should not is empty'.tr);
                                    }
                                  } else {
                                    snackBarFailer(
                                        'Please fields should not is empty'.tr);
                                  }
                                } else {
                                  snackBarFailer(
                                      'Please fields should not is empty'.tr);
                                }
                              },
                              child: Text(
                                "SUBMIT".tr,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
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
