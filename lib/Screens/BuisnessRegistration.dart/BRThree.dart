import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ApiUtisAllFiles.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'BuisnessRegistration.dart';
import 'BuisnessRegistrationController.dart';

class BRThree extends StatefulWidget {
  final height;
  final width;

  const BRThree({Key? key, this.height, this.width}) : super(key: key);

  @override
  _BRThreeState createState() => _BRThreeState();
}

class _BRThreeState extends State<BRThree> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<BuisnessRegistrationController>();
    var height = widget.height;
    var width = widget.width;
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: height * 0.020,
          ),
          Container(
            height: height * 0.240,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3),
                  //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.010,
                ),
                Text(
                  'Timings'.tr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text('Monday :'.tr),
                        InkWell(
                          onTap: () async {
                            TimeRange result = await showTimeRangePicker(
                                context: context,
                                disabledColor: Colors.red.withOpacity(0.5),
                                strokeWidth: 2,
                                use24HourFormat: true,
                                ticks: 24,
                                ticksOffset: -7,
                                ticksLength: 15,
                                ticksColor: Colors.grey,
                                labels: [
                                  "12 pm",
                                  "3 am",
                                  "6 am",
                                  "9 am",
                                  "12 am",
                                  "3 pm",
                                  "6 pm",
                                  "9 pm"
                                ].asMap().entries.map((e) {
                                  return ClockLabel.fromIndex(
                                      idx: e.key, length: 8, text: e.value);
                                }).toList(),
                                labelOffset: 35,
                                rotateLabels: false,
                                padding: 60);
                            controller.mon.value =
                                '${result.startTime.hour.toString()}:${result.startTime.minute}-${result.endTime.hour}:${result.endTime.minute}';
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                controller.mon.value,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('Tuesday :'.tr),
                        InkWell(
                          onTap: () async {
                            TimeRange result = await showTimeRangePicker(
                                context: context,
                                disabledColor: Colors.red.withOpacity(0.5),
                                strokeWidth: 2,
                                use24HourFormat: true,
                                ticks: 24,
                                ticksOffset: -7,
                                ticksLength: 15,
                                ticksColor: Colors.grey,
                                labels: [
                                  "12 pm",
                                  "3 am",
                                  "6 am",
                                  "9 am",
                                  "12 am",
                                  "3 pm",
                                  "6 pm",
                                  "9 pm"
                                ].asMap().entries.map((e) {
                                  return ClockLabel.fromIndex(
                                      idx: e.key, length: 8, text: e.value);
                                }).toList(),
                                labelOffset: 35,
                                rotateLabels: false,
                                padding: 60);
                            controller.tue.value =
                                '${result.startTime.hour}:${result.startTime.minute}-${result.endTime.hour}:${result.endTime.minute}';
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                controller.tue.value,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text('Wednesday :'.tr),
                        InkWell(
                          onTap: () async {
                            TimeRange result = await showTimeRangePicker(
                                context: context,
                                disabledColor: Colors.red.withOpacity(0.5),
                                strokeWidth: 2,
                                use24HourFormat: true,
                                ticks: 24,
                                ticksOffset: -7,
                                ticksLength: 15,
                                ticksColor: Colors.grey,
                                labels: [
                                  "12 pm",
                                  "3 am",
                                  "6 am",
                                  "9 am",
                                  "12 am",
                                  "3 pm",
                                  "6 pm",
                                  "9 pm"
                                ].asMap().entries.map((e) {
                                  return ClockLabel.fromIndex(
                                      idx: e.key, length: 8, text: e.value);
                                }).toList(),
                                labelOffset: 35,
                                rotateLabels: false,
                                padding: 60);
                            controller.wed.value =
                                '${result.startTime.hour}:${result.startTime.minute}-${result.endTime.hour}:${result.endTime.minute}';
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                controller.wed.value,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('Thursday :'.tr),
                        InkWell(
                          onTap: () async {
                            TimeRange result = await showTimeRangePicker(
                                context: context,
                                disabledColor: Colors.red.withOpacity(0.5),
                                strokeWidth: 2,
                                use24HourFormat: true,
                                ticks: 24,
                                ticksOffset: -7,
                                ticksLength: 15,
                                ticksColor: Colors.grey,
                                labels: [
                                  "12 pm",
                                  "3 am",
                                  "6 am",
                                  "9 am",
                                  "12 am",
                                  "3 pm",
                                  "6 pm",
                                  "9 pm"
                                ].asMap().entries.map((e) {
                                  return ClockLabel.fromIndex(
                                      idx: e.key, length: 8, text: e.value);
                                }).toList(),
                                labelOffset: 35,
                                rotateLabels: false,
                                padding: 60);
                            controller.thus.value =
                                '${result.startTime.hour}:${result.startTime.minute}-${result.endTime.hour}:${result.endTime.minute}';
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                controller.thus.value,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text('Friday :'.tr),
                        InkWell(
                          onTap: () async {
                            TimeRange result = await showTimeRangePicker(
                                context: context,
                                disabledColor: Colors.red.withOpacity(0.5),
                                strokeWidth: 2,
                                use24HourFormat: true,
                                ticks: 24,
                                ticksOffset: -7,
                                ticksLength: 15,
                                ticksColor: Colors.grey,
                                labels: [
                                  "12 pm",
                                  "3 am",
                                  "6 am",
                                  "9 am",
                                  "12 am",
                                  "3 pm",
                                  "6 pm",
                                  "9 pm"
                                ].asMap().entries.map((e) {
                                  return ClockLabel.fromIndex(
                                      idx: e.key, length: 8, text: e.value);
                                }).toList(),
                                labelOffset: 35,
                                rotateLabels: false,
                                padding: 60);
                            controller.fri.value =
                                '${result.startTime.hour}:${result.startTime.minute}-${result.endTime.hour}:${result.endTime.minute}';
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                controller.fri.value,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('Saturday :'.tr),
                        InkWell(
                          onTap: () async {
                            TimeRange result = await showTimeRangePicker(
                                context: context,
                                disabledColor: Colors.red.withOpacity(0.5),
                                strokeWidth: 2,
                                use24HourFormat: true,
                                ticks: 24,
                                ticksOffset: -7,
                                ticksLength: 15,
                                ticksColor: Colors.grey,
                                labels: [
                                  "12 pm",
                                  "3 am",
                                  "6 am",
                                  "9 am",
                                  "12 am",
                                  "3 pm",
                                  "6 pm",
                                  "9 pm"
                                ].asMap().entries.map((e) {
                                  return ClockLabel.fromIndex(
                                      idx: e.key, length: 8, text: e.value);
                                }).toList(),
                                labelOffset: 35,
                                rotateLabels: false,
                                padding: 60);
                            controller.sat.value =
                                '${result.startTime.hour}:${result.startTime.minute}-${result.endTime.hour}:${result.endTime.minute}';
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                controller.sat.value,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [
                    Text('Sunday :'.tr),
                    InkWell(
                      onTap: () async {
                        TimeRange result = await showTimeRangePicker(
                            context: context,
                            disabledColor: Colors.red.withOpacity(0.5),
                            strokeWidth: 2,
                            use24HourFormat: true,
                            ticks: 24,
                            ticksOffset: -7,
                            ticksLength: 15,
                            ticksColor: Colors.grey,
                            labels: [
                              "12 pm",
                              "3 am",
                              "6 am",
                              "9 am",
                              "12 am",
                              "3 pm",
                              "6 pm",
                              "9 pm"
                            ].asMap().entries.map((e) {
                              return ClockLabel.fromIndex(
                                  idx: e.key, length: 8, text: e.value);
                            }).toList(),
                            labelOffset: 35,
                            rotateLabels: false,
                            padding: 60);
                        controller.sun.value =
                            '${result.startTime.hour}:${result.startTime.minute}-${result.endTime.hour}:${result.endTime.minute}';
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            controller.sun.value,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          InkWell(
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                controller.Date.value = '${date.year}';
              }, onConfirm: (date) {
                print('confirm $date');
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Container(
              height: height * 0.060,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Center(
                child: Row(
                  children: [
                    Text(controller.Date.value),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0.0, 3),
                    //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'keywords'.tr,
            postIcon: IconButton(
              onPressed: () {
                print('Now Click'.tr);
                if (controller.keyWordController.text.isNotEmpty) {
                  print('Now Click'.tr);
                  controller.listOfKeyWord
                      .add(controller.keyWordController.text.toString().trim());
                  print('listOfKeyWord = ${controller.listOfKeyWord}');
                  controller.keyWordController.clear();
                }
              },
              icon: Icon(
                Icons.add,
                color: blueColor,
              ),
            ),
            controller: controller.keyWordController,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            width: width,
            child: Wrap(
              children: controller.listOfKeyWord.map((element) {
                return FadeInRight(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: width * 0.010,vertical: 3),
                    child: Text('$element'),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(5)),
                  ),
                );
              }).toList(),
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3),
                  //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            height: height * 0.060,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                  items: controller.listofCat.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('${value['main_cat_name']}'),
                      onTap: () {
                        controller.currentlistofCatIndex.value =
                            controller.listofCat.indexOf(value);
                        controller.listofCatHint.value = value['main_cat_name'];
                        ApiUtilsForAll.getgetMainSubCatapp(value['id']);
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.listofCatHint.value,
                    style: TextStyle(fontSize: 14),
                  ),
                  onChanged: (_) {},
                  isExpanded: true),
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3),
                  //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            height: height * 0.060,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                  items: controller.listofSubCat.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('${value['main_cat_name']}'),
                      onTap: () {
                        controller.currentlistofSubCatIndex.value =
                            controller.listofSubCat.indexOf(value);
                        controller.listofSubCatHint.value =
                            value['main_cat_name'];
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.listofSubCatHint.value,
                    style: TextStyle(fontSize: 14),
                  ),
                  onChanged: (_) {},
                  isExpanded: true),
            ),
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Hear About'.tr,
            controller: controller.hearAboutController,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          InkWell(
            onTap: () {
              controller.displayBottomSheet();
            },
            child: Container(
              height: height * 0.2,
              width: width,
              child: controller.isf1.value
                  ? Image.file(
                      controller.f1.value,
                      fit: BoxFit.cover,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Select Image'.tr),
                        Center(
                          child: Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0.0, 3),
                    //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.030,
          ),
          FadeInUpBig(
            child: InkWell(
              onTap: () {
                if (controller.mon.value != 'Select time' &&
                    controller.mon.value != 'Select time' &&
                    controller.mon.value != 'Select time' &&
                    controller.mon.value != 'Select time' &&
                    controller.mon.value != 'Select time' &&
                    controller.mon.value != 'Select time' &&
                    controller.mon.value != 'Select time') {
                  if (controller.Date.value != 'Select time') {
                    if (controller.listOfKeyWord.isNotEmpty) {
                      if (controller.listofCatHint.value != 'Category') {
                        if (controller.hearAboutController.text.isNotEmpty) {
                          if (controller.isf1.value) {
                            ApiUtilsAllFiles.getaddListing(controller);
                          } else {
                            snackBarSuccess('Select image first');
                          }
                        } else {
                          snackBarSuccess('Write here about');
                        }
                      } else {
                        snackBarSuccess('Add Category first');
                      }
                    } else {
                      snackBarSuccess('Add Keyword first');
                    }
                  } else {
                    snackBarSuccess('Please Date first');
                  }
                } else {
                  snackBarSuccess('Please all select time first');
                }
              },
              child: Container(
                height: height * 0.070,
                width: width,
                child: Center(
                  child: Text(
                    'SUBMIT'.tr,
                    style: TextStyle(color: Colors.white, letterSpacing: 0.5),
                  ),
                ),
                decoration: BoxDecoration(color: blueColor),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.030,
          ),
        ],
      ),
    );
  }
}
