import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/VideoPlayerClass.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HowItWorks extends StatefulWidget {
  const HowItWorks({Key? key}) : super(key: key);

  @override
  _HowItWorksState createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, size) {
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
            'How it Works'.tr,
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
              Container(
                height: height * 0.3,
                width: width,
                child: VideoApp(),
                decoration: BoxDecoration(color: Colors.black),
              ),
              SizedBox(
                height: height * 0.030,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquet nunc id diam ultrices sollicitudin. Phasellus eu urna eget mi pretium tempus non ut massa. Pellentesque et rhoncus turpis. Proin enim magna, fermentum ac porttitor quis, luctus nec elit. Maecenas facilisis orci ante. Phasellus finibus porttitor tortor et aliquet. In rutrum iaculis elit vel consequat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec ligula tellus, accumsan nec tellus vitae, pulvinar pulvinar nulla. Aenean interdum diam porttitor molestie tempus. Quisque tempor ut leo quis tincidunt. Ut aliquet condimentum elit, non feugiat lacus pellentesque quis. Sed cursus vulputate accumsan. Suspendisse volutpat ultricies leo, quis ultrices erat fringilla et. Integer dictum ligula velit, quis suscipit orci malesuada ac.'.tr,
                textAlign: TextAlign.justify,
                style: TextStyle(),
              ),
              SizedBox(
                height: height * 0.030,
              ),
            ],
          ),
        ),
      ));
    });
  }
}
