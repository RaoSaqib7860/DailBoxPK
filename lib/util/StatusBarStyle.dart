
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

Widget statusBarStyle({Widget? child}) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: Platform.isAndroid
        ? SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: blueColor,
        systemNavigationBarColor: blueColor,
        statusBarIconBrightness: Brightness.light)
        : SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: blueColor,
        systemNavigationBarColor: blueColor,
        statusBarIconBrightness: Brightness.light),
    child: child!,
  );
}