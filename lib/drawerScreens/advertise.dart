import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Advertise extends StatefulWidget {
  @override
  _AdvertiseState createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
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
            centerTitle: false,
            title: Text(
              'Advertise'.tr,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            elevation: 0,
            backgroundColor: blueColor,
          ),
          body: Padding(
            padding: EdgeInsets.all(width * 0.030),
            child: Column(
              children: [
                //For Advertising kindly contact us for further information
                RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                      text: 'For'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        letterSpacing: 0.3,
                      ),
                      children: [
                        new TextSpan(
                          text: ' Advertising '.tr,
                          style: TextStyle(color: blueColor),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => print('Tap Here onTap'),
                        ),
                        new TextSpan(
                          text: 'kindly contact us for further information '.tr,
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => print('Tap Here onTap'),
                        )
                      ]),
                ),
                SizedBox(
                  height: height * 0.030,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(color: blueColor),
                      child: Text(
                        'advertise@dailboxx.pk'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
