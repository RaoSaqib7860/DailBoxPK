import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

double? lat;
double? long;

Future getLocation() async {
  Position? position = await Geolocator.getLastKnownPosition();
  if (position != null) {
    lat = position.latitude;
    long = position.longitude;
  } else {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
  }
  printlog('lat = $lat');
  printlog('long = $long');
}

Future gpsService(BuildContext context) async {
  if (!(await Geolocator.isLocationServiceEnabled())) {
    await checkGps(context);
    return null;
  } else
    return true;
}

Future checkGps(BuildContext context) async {
  if (!(await Geolocator.isLocationServiceEnabled())) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Can't get gurrent location".tr),
              content:
               Text('Please make sure you enable GPS and try again'.tr),
              actions: <Widget>[
                FlatButton(
                    child: Text('Ok'.tr),
                    onPressed: () {
                      // final AndroidIntent intent = AndroidIntent(
                      //     action:
                      //         'android.settings.LOCATION_SOURCE_SETTINGS');
                      // intent.launch();
                    })
              ],
            );
          });
    }
  }
}