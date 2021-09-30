import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/Screens/ForgotPassword/forgot_password.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Settings'.tr,
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
        body: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        height: 0,
                        width: MediaQuery.of(context).size.width,
                        color: greyColorlight,
                      ),
                      InkWell(
                        onTap: () {
                          launchURL("https://dialboxx.pk/front/terms");
                        },
                        child: findLanguageController.isEnglishLocale.value
                            ? Row(
                                children: <Widget>[
                                  Icon(Icons.privacy_tip_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Terms & Conditions'.tr,
                                    textAlign: findLanguageController
                                            .isEnglishLocale.value
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: TextStyle(fontSize: 14),
                                  )),
                                  Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 15,
                                  )
                                ],
                              )
                            : Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_back_ios,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Terms & Conditions'.tr,
                                    textAlign: findLanguageController
                                            .isEnglishLocale.value
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: TextStyle(fontSize: 14),
                                  )),
                                  Icon(Icons.privacy_tip_outlined),
                                ],
                              ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: greyColorlight,
                      ),
                      InkWell(
                        onTap: () {
                          launchURL("https://dialboxx.pk/front/privacy");
                        },
                        child: findLanguageController.isEnglishLocale.value
                            ? Row(
                                children: <Widget>[
                                  Icon(Icons.privacy_tip),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Privacy Policy'.tr,
                                    textAlign: findLanguageController
                                            .isEnglishLocale.value
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: TextStyle(fontSize: 14),
                                  )),
                                  Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 15,
                                  )
                                ],
                              )
                            : Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_back_ios,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Privacy Policy'.tr,
                                    textAlign: findLanguageController
                                            .isEnglishLocale.value
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: TextStyle(fontSize: 14),
                                  )),
                                  Icon(Icons.privacy_tip),
                                ],
                              ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: greyColorlight,
                      ),
                      findLanguageController.isEnglishLocale.value
                          ? Row(
                              children: <Widget>[
                                Icon(Icons.person_outline),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  'Version'.tr,
                                  textAlign: findLanguageController
                                          .isEnglishLocale.value
                                      ? TextAlign.left
                                      : TextAlign.right,
                                  style: TextStyle(fontSize: 14),
                                )),
                                Text(
                                  '1.0.0'.tr,
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            )
                          : Row(
                              children: <Widget>[
                                Text(
                                  '1.0.0'.tr,
                                  style: TextStyle(fontSize: 11),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  'Version'.tr,
                                  textAlign: findLanguageController
                                          .isEnglishLocale.value
                                      ? TextAlign.left
                                      : TextAlign.right,
                                  style: TextStyle(fontSize: 14),
                                )),
                                Icon(Icons.person_outline),
                              ],
                            ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: greyColorlight,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
