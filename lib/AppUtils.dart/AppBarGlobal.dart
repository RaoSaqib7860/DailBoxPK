import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

AppBar appBarGlobal(String title) {
  return AppBar(
    backgroundColor: blueColor,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        )),
  );
}

launchURL(String aaa) async {
  final url = '$aaa';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
