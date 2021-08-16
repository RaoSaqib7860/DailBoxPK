import 'package:dail_box/Screens/ForgotPassword/forgot_password.dart';
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
            'Settings',
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
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(ForgotPassword());
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(CupertinoIcons.padlock_solid),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              'Change Password',
                              style: TextStyle(fontSize: 14),
                            )),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: greyColorlight,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.privacy_tip_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'Terms & Conditions',
                            style: TextStyle(fontSize: 14),
                          )),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 15,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: greyColorlight,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.privacy_tip),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'Privacy Policy',
                            style: TextStyle(fontSize: 14),
                          )),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 15,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: greyColorlight,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.person_outline),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'Version',
                            style: TextStyle(fontSize: 14),
                          )),
                          Text(
                            '1.0.0',
                            style: TextStyle(fontSize: 11),
                          )
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
