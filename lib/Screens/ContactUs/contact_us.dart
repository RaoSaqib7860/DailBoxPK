import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/ContactUs/ContactUsController.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  GetStorage? storage;
  final controller = Get.put(ContactUsController());

  @override
  void initState() {
    storage = GetStorage();
    controller.nameCon.text = storage!.read('name') ?? '';
    controller.emailCon.text = storage!.read('email') ?? '';
    controller.phoneCon.text = storage!.read('mobile') ?? '';
    controller.messageCon.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          'Contact Us'.tr,
          textAlign: findLanguageController.isEnglishLocale.value
              ? TextAlign.left
              : TextAlign.right,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        elevation: 0,
        backgroundColor: blueColor,
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: findLanguageController.isEnglishLocale.value?
                       CrossAxisAlignment.start: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: blueColor),
                                          child: Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Call Us'.tr,
                                        style: TextStyle(
                                            color: blueColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: findLanguageController.isEnglishLocale.value? 12 :10.5),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                launchURL("tel://02137133232");
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                launchURL('mailto:support@dialboxx.pk');
                              },
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.orange),
                                          child: Icon(
                                            Icons.email,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Email Us'.tr,
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w600,
                                            fontSize: findLanguageController.isEnglishLocale.value? 12 :10.5),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Quick Contact'.tr,

                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
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
                              textAlign: findLanguageController.isEnglishLocale.value?
                              TextAlign.left
                              :TextAlign.right,
                              controller: controller.nameCon,
                              enabled: false,
                              keyboardType: TextInputType.text,
                              decoration: findLanguageController.isEnglishLocale.value?
                               InputDecoration(
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
                                      top: 11,
                                      right: 15),
                                  hintStyle: TextStyle(
                                      color: greyColor, fontSize: 14),
                                  hintText: "First Name".tr)
                                  :InputDecoration(
                                  suffixIcon: Icon(
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
                                      top: 11,
                                      right: 0),
                                  hintStyle: TextStyle(
                                      color: greyColor, fontSize: 14),
                                  hintText: "First Name".tr),
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
                              controller: controller.emailCon,
                              cursorColor: Colors.black,
                              textAlign: findLanguageController.isEnglishLocale.value?
                              TextAlign.left
                              :TextAlign.right,
                              enabled: false,
                              keyboardType: TextInputType.text,
                              decoration: findLanguageController.isEnglishLocale.value?
                               InputDecoration(
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
                                  hintText: "Email".tr)
                                  :InputDecoration(
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
                                      top: 11,
                                      right: 0),
                                  hintStyle: TextStyle(
                                      color: greyColor, fontSize: 14),
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
                              cursorColor: Colors.black,
                              textAlign: findLanguageController.isEnglishLocale.value?
                              TextAlign.left
                              :TextAlign.right,
                              controller: controller.phoneCon,
                              enabled: false,
                              keyboardType: TextInputType.text,
                              decoration: findLanguageController.isEnglishLocale.value?
                               InputDecoration(
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
                                      top: 11,
                                      right: 15),
                                  hintStyle: TextStyle(
                                      color: greyColor, fontSize: 14),
                                  hintText: "Phone".tr)
                                  :InputDecoration(
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
                                      top: 11,
                                      right: 0),
                                  hintStyle: TextStyle(
                                      color: greyColor, fontSize: 14),
                                  hintText: "Phone".tr),
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
                              textAlign: findLanguageController.isEnglishLocale.value?
                              TextAlign.left
                              :TextAlign.right,
                              controller: controller.messageCon,
                              keyboardType: TextInputType.multiline,
                              maxLines: 6,
                              decoration: findLanguageController.isEnglishLocale.value?
                               InputDecoration(
                                  prefixIcon: Container(
                                    transform:
                                        Matrix4.translationValues(0, -50, 0),
                                    child: Icon(
                                      Icons.email,
                                      color: greyColor,
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
                                  hintText: "Message".tr)
                                  :InputDecoration(
                                  suffixIcon: Container(
                                    transform:
                                        Matrix4.translationValues(0, -50, 0),
                                    child: Icon(
                                      Icons.email,
                                      color: greyColor,
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
                                      right: 0),
                                  hintStyle: TextStyle(
                                      color: greyColor, fontSize: 14),
                                  hintText: "Message".tr),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          child: RaisedButton(
                            color: blueColor,
                            onPressed: () {
                              if (controller.messageCon.text.isNotEmpty) {
                                ApiUtils.getcontactUs(controller: controller);
                              } else {
                                snackBarFailer('Please enter message'.tr);
                              }
                            },
                            child: Text(
                              "SEND".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
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
    );
  }

  sendMessage({String? bussinies_id, String? to_msg}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController textCon = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width / 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: height / 2.50,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    'Send Message'.tr,
                    style: TextStyle(fontSize: 16),
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
                        maxLines: 6,
                        keyboardType: TextInputType.text,
                        controller: textCon,
                        textInputAction: TextInputAction.done,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle:
                                TextStyle(color: greyColor, fontSize: 12),
                            hintText: "Enter message here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (textCon.text.isNotEmpty) {
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                          snackBarFailer('Please type message to receiver'.tr);
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            'Update'.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        });
  }
}
