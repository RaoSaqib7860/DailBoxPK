import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/OtpCodeVarification/PhoneVarificationController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PhoneVerification extends StatefulWidget {
  final bool? fromreset;
  const PhoneVerification({Key? key, this.fromreset = false}) : super(key: key);
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVarificationController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
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
                      Image(
                        image: AssetImage('assets/icons/logo_red.png'),
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Skip'.tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: height / 30,
                            ),
                            Text('Phone verification'.tr,
                                style: TextStyle(
                                    color: blueColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Register your bussiness with dialboxx to gain visibility in the marketplace.'.tr,
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
                                  controller: controller.codeCon,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.code,
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
                                      hintText: "Otp code".tr),
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
                                  if (controller.codeCon.text.isNotEmpty) {
                                    controller.loading.value = true;
                                    ApiUtils.verifyotpApi(controller);
                                  } else {
                                    snackBarFailer('Please enter otp code');
                                  }
                                },
                                child: Text(
                                  "NEXT".tr,
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
      ),
    );
  }
}
