import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dail_box/AppUtils.dart/ApiUtisAllFiles.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      () => Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.020,
              ),
              Container(
                height: height * 0.255,
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                                    backgroundWidget: Padding(
                                      padding: EdgeInsets.all(80),
                                      child: SvgPicture.asset(
                                          'assets/svg/dialbox final -icon.svg'),
                                    ),
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
                                print(
                                    'length is = ${result.startTime.hour.toString().length}');
                                controller.mon.value =
                                    '${result.startTime.hour.toString().length != 1 ? result.startTime.hour.toString() : '0${result.startTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.startTime.minute.toString().length != 1 ? result.startTime.minute.toString() : '0${result.startTime.minute.toString()}'}' +
                                        '-' +
                                        '${result.endTime.hour.toString().length != 1 ? result.endTime.hour.toString() : '0${result.endTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.endTime.minute.toString().length != 1 ? result.endTime.minute.toString() : '0${result.endTime.minute.toString()}'}';
                              },
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    controller.mon.value.trim().isEmpty
                                        ? 'Select time'.tr
                                        : controller.mon.value,
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
                                    backgroundWidget: Padding(
                                      padding: EdgeInsets.all(80),
                                      child: SvgPicture.asset(
                                          'assets/svg/dialbox final -icon.svg'),
                                    ),
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
                                    '${result.startTime.hour.toString().length != 1 ? result.startTime.hour.toString() : '0${result.startTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.startTime.minute.toString().length != 1 ? result.startTime.minute.toString() : '0${result.startTime.minute.toString()}'}' +
                                        '-' +
                                        '${result.endTime.hour.toString().length != 1 ? result.endTime.hour.toString() : '0${result.endTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.endTime.minute.toString().length != 1 ? result.endTime.minute.toString() : '0${result.endTime.minute.toString()}'}';
                              },
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    controller.tue.value.trim().isEmpty
                                        ? 'Select time'.tr
                                        : controller.tue.value,
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
                                    backgroundWidget: Padding(
                                      padding: EdgeInsets.all(80),
                                      child: SvgPicture.asset(
                                          'assets/svg/dialbox final -icon.svg'),
                                    ),
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
                                    '${result.startTime.hour.toString().length != 1 ? result.startTime.hour.toString() : '0${result.startTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.startTime.minute.toString().length != 1 ? result.startTime.minute.toString() : '0${result.startTime.minute.toString()}'}' +
                                        '-' +
                                        '${result.endTime.hour.toString().length != 1 ? result.endTime.hour.toString() : '0${result.endTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.endTime.minute.toString().length != 1 ? result.endTime.minute.toString() : '0${result.endTime.minute.toString()}'}';
                              },
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    controller.wed.value.trim().isEmpty
                                        ? 'Select time'.tr
                                        : controller.wed.value,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text('Thursday:'.tr),
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
                                    backgroundWidget: Padding(
                                      padding: EdgeInsets.all(80),
                                      child: SvgPicture.asset(
                                          'assets/svg/dialbox final -icon.svg'),
                                    ),
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
                                    '${result.startTime.hour.toString().length != 1 ? result.startTime.hour.toString() : '0${result.startTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.startTime.minute.toString().length != 1 ? result.startTime.minute.toString() : '0${result.startTime.minute.toString()}'}' +
                                        '-' +
                                        '${result.endTime.hour.toString().length != 1 ? result.endTime.hour.toString() : '0${result.endTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.endTime.minute.toString().length != 1 ? result.endTime.minute.toString() : '0${result.endTime.minute.toString()}'}';
                              },
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    controller.thus.value.trim().isEmpty
                                        ? 'Select time'.tr
                                        : controller.thus.value,
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
                                    backgroundWidget: Padding(
                                      padding: EdgeInsets.all(80),
                                      child: SvgPicture.asset(
                                          'assets/svg/dialbox final -icon.svg'),
                                    ),
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
                                    '${result.startTime.hour.toString().length != 1 ? result.startTime.hour.toString() : '0${result.startTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.startTime.minute.toString().length != 1 ? result.startTime.minute.toString() : '0${result.startTime.minute.toString()}'}' +
                                        '-' +
                                        '${result.endTime.hour.toString().length != 1 ? result.endTime.hour.toString() : '0${result.endTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.endTime.minute.toString().length != 1 ? result.endTime.minute.toString() : '0${result.endTime.minute.toString()}'}';
                              },
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    controller.fri.value.trim().isEmpty
                                        ? 'Select time'.tr
                                        : controller.fri.value,
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
                                    backgroundWidget: Padding(
                                      padding: EdgeInsets.all(80),
                                      child: SvgPicture.asset(
                                          'assets/svg/dialbox final -icon.svg'),
                                    ),
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
                                    '${result.startTime.hour.toString().length != 1 ? result.startTime.hour.toString() : '0${result.startTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.startTime.minute.toString().length != 1 ? result.startTime.minute.toString() : '0${result.startTime.minute.toString()}'}' +
                                        '-' +
                                        '${result.endTime.hour.toString().length != 1 ? result.endTime.hour.toString() : '0${result.endTime.hour.toString()}'}' +
                                        ':' +
                                        '${result.endTime.minute.toString().length != 1 ? result.endTime.minute.toString() : '0${result.endTime.minute.toString()}'}';
                              },
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    controller.sat.value.trim().isEmpty
                                        ? 'Select time'.tr
                                        : controller.sat.value,
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
                                backgroundWidget: Padding(
                                  padding: EdgeInsets.all(80),
                                  child: SvgPicture.asset(
                                      'assets/svg/dialbox final -icon.svg'),
                                ),
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
                                '${result.startTime.hour.toString().length != 1 ? result.startTime.hour.toString() : '0${result.startTime.hour.toString()}'}' +
                                    ':' +
                                    '${result.startTime.minute.toString().length != 1 ? result.startTime.minute.toString() : '0${result.startTime.minute.toString()}'}' +
                                    '-' +
                                    '${result.endTime.hour.toString().length != 1 ? result.endTime.hour.toString() : '0${result.endTime.hour.toString()}'}' +
                                    ':' +
                                    '${result.endTime.minute.toString().length != 1 ? result.endTime.minute.toString() : '0${result.endTime.minute.toString()}'}';
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                controller.sun.value.trim().isEmpty
                                    ? 'Select time'.tr
                                    : controller.sun.value,
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
              // InkWell(
              //   onTap: () {
              //     DatePicker.showDatePicker(context,
              //         showTitleActions: true,
              //         minTime: DateTime(1947, 6, 7),
              //         maxTime: DateTime.now(), onChanged: (date) {
              //       controller.Date.value = '${date.year}';
              //     }, onConfirm: (date) {
              //       print('confirm $date');
              //     }, currentTime: DateTime.now(), locale: LocaleType.en);
              //   },
              //   child: Container(
              //     height: height * 0.060,
              //     width: width,
              //     padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              //     child: Center(
              //       child: Row(
              //         children: [
              //           Text(controller.Date.value),
              //         ],
              //       ),
              //     ),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5.0),
              //       color: Colors.grey[200],
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withOpacity(0.1),
              //           offset: Offset(0.0, 3),
              //           //(x,y)
              //           blurRadius: 5.0,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.020,
              // ),
              TextFromFieldsCustom(
                hint: 'Keywords'.tr,
                postIcon: IconButton(
                  onPressed: () {
                    print('Now Click'.tr);
                    if (controller.keyWordController.text.isNotEmpty) {
                      print('Now Click'.tr);
                      controller.listOfKeyWord.add(
                          controller.keyWordController.text.toString().trim());
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
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.010, vertical: 3),
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
              isEditBusiness
                  ? Container(
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
                      child: Row(
                        children: [
                          Text('${controller.herarAbout}'),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.030),
                    )
                  : Container(
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
                            items: controller.listofHearAbout.map((value) {
                              return DropdownMenuItem<String>(
                                value: '$value',
                                child: Text('$value'),
                                onTap: () {
                                  controller.currentlistofHearAboutIndex.value =
                                      controller.listofHearAbout.indexOf(value);
                                  controller.listofHearAboutHint.value = value;
                                },
                              );
                            }).toList(),
                            hint: Text(
                              controller.listofHearAboutHint.value,
                              style: TextStyle(fontSize: 14),
                            ),
                            onChanged: (_) {},
                            isExpanded: true),
                      ),
                    ),
              SizedBox(
                height: height * 0.030,
              ),
              isEditBusiness
                  ? TextFromFieldsCustom(
                      enable: false,
                      hint: '${controller.agentID}'.tr,
                      controller: controller.agentId,
                    )
                  : controller.listofHearAboutHint.value ==
                          'How did you hear about us?'
                      ? SizedBox()
                      : TextFromFieldsCustom(
                          hint: 'Agent ID'.tr,
                          controller: controller.agentId,
                        ),
              SizedBox(
                height: height * 0.030,
              ),
              isEditBusiness
                  ? InkWell(
                      onTap: () {
                        controller.displayBottomSheet();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.black,
                          ),
                          Text('Business profile image'.tr),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: height * 0.010,
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
                      : isEditBusiness == true
                          ? CachedNetworkImage(
                              width: width,
                              height: height * 0.2,
                              fit: BoxFit.cover,
                              imageUrl: '${controller.listing_image.value}',
                              placeholder: (context, url) =>
                                  SpinKitSquareCircle(
                                color: Colors.blue,
                                size: 20.0,
                              ),
                              errorWidget: (context, url, error) => Image.network(
                                  'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Business profile image'.tr),
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
                  onTap: () async {
                    if (isEditBusiness) {
                      print('Edit call going');
                      controller.loading.value = true;
                      await ApiUtilsAllFiles.geteditBusiness(controller);
                      controller.loading.value = false;
                    } else {
                      if (controller.listofHearAboutHint.value !=
                          'How did you hear about us?') {
                        if (controller.isf1.value) {
                          controller.loading.value = true;
                          await ApiUtilsAllFiles.getaddListing(controller);
                          controller.loading.value = false;
                        } else {
                          snackBarSuccess('Please upload image!'.tr);
                        }
                      } else {
                        snackBarSuccess('Select how did you hear about us?'.tr);
                      }
                    }
                  },
                  child: Container(
                    height: height * 0.070,
                    width: width,
                    child: Center(
                      child: Text(
                        controller.listing_image.value != ''
                            ? 'Update'.tr
                            : 'SUBMIT'.tr,
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 0.5),
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
          controller.loading.value == true
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
              : SizedBox()
        ],
      ),
    );
  }
}
