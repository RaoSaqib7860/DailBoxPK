import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/Profile/EditProfileController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GetStorage storage = GetStorage();
  final controller = Get.put(EditProfileController());

  @override
  void initState() {
    controller.phoneCon.text = storage.read('mobile');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Edit Profile'.tr,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            elevation: 0,
            backgroundColor: blueColor,
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.030),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Previous password'.tr,
                      style: TextStyle(fontSize: 12, color: greyColor),
                    ),
                    SizedBox(
                      height: 5,
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
                            obscureText:
                                controller.absecuretextOne.value ? false : true,
                            decoration: new InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: greyColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    print('Click');
                                    if (controller.absecuretextOne.value) {
                                      controller.absecuretextOne.value = false;
                                    } else {
                                      controller.absecuretextOne.value = true;
                                    }
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: controller.absecuretextOne.value
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
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintStyle:
                                    TextStyle(color: greyColor, fontSize: 12),
                                hintText: "New Password".tr),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'New password'.tr,
                      style: TextStyle(fontSize: 12, color: greyColor),
                    ),
                    SizedBox(
                      height: 5,
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
                            controller: controller.p2Con,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            obscureText: !controller.absecuretextTwo.value
                                ? true
                                : false,
                            decoration: new InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: greyColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    if (controller.absecuretextTwo.value) {
                                      controller.absecuretextTwo.value = false;
                                    } else {
                                      controller.absecuretextTwo.value = true;
                                    }
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: controller.absecuretextTwo.value
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
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintStyle:
                                    TextStyle(color: greyColor, fontSize: 14),
                                hintText: "Confirm Password".tr),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mobile No*'.tr,
                      style: TextStyle(fontSize: 12, color: greyColor),
                    ),
                    SizedBox(
                      height: 5,
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
                          controller: controller.phoneCon,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
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
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintStyle:
                                  TextStyle(color: greyColor, fontSize: 14),
                              hintText: "OTP"),
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
                              if (controller.phoneCon.text.isNotEmpty) {
                                controller.loading.value = true;
                                ApiUtils.geteditMyProfile(
                                    controller: controller);
                              } else {
                                snackBarFailer(
                                    'Phone number fields should not is empty');
                              }
                            } else {
                              snackBarFailer(
                                  'Please fields should not is empty');
                            }
                          } else {
                            snackBarFailer('Please fields should not is empty');
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
    });
  }
}
