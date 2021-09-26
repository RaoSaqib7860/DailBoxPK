import 'dart:convert';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'FAQsController.dart';

class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  final controller = Get.put(FAQsController());

  @override
  void initState() {
    getApiData();
    super.initState();
  }

  getApiData() async {
    List list = await ApiUtilsForAll.getgetmybusinesslist();
    controller.listofBuisness.value = list;
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return SafeArea(
        child: Scaffold(
            appBar: appBarGlobal('Add FAQs'),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Obx(
                () => SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
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
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.030),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<dynamic>(
                                  items: controller.listofBuisness.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: '$value',
                                      child: Text('${value['business_name']}'),
                                      onTap: () {
                                        controller.selectBusinessid.value =
                                            controller.listofBuisness
                                                .indexOf(value);
                                        controller.selectBusinessHint.value =
                                            value['business_name'];
                                      },
                                    );
                                  }).toList(),
                                  hint: Text(
                                    controller.selectBusinessHint.value,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  onChanged: (_) {},
                                  isExpanded: true),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
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
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                controller: controller.QusCon,
                                textInputAction: TextInputAction.done,
                                decoration: new InputDecoration(
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
                                        color: greyColor, fontSize: 12),
                                    hintText: "Questions ?"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
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
                                controller: controller.AnsCon,
                                textInputAction: TextInputAction.done,
                                decoration: new InputDecoration(
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
                                        color: greyColor, fontSize: 12),
                                    hintText: "Type your answer here"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (controller.QusCon.text
                                      .trim()
                                      .isNotEmpty) {
                                    if (controller.AnsCon.text
                                        .trim()
                                        .isNotEmpty) {
                                      if (!controller.qusAnsMap.contains({
                                        'faq_q': '${controller.QusCon.text}',
                                        'faq_a': '${controller.AnsCon.text}'
                                      })) {
                                        controller.qusAnsMap.add({
                                          'faq_q': '${controller.QusCon.text}',
                                          'faq_a': '${controller.AnsCon.text}'
                                        });
                                        controller.QusCon.clear();
                                        controller.AnsCon.clear();
                                      }
                                    } else {
                                      snackBarFailer(
                                          'Please add your questions');
                                    }
                                  } else {
                                    snackBarFailer('Please add your questions');
                                  }
                                },
                                child: Icon(
                                  Icons.add_box_rounded,
                                  color: blueColor,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              if (controller.selectBusinessHint.value !=
                                  'Select Business'.tr) {
                                if (controller.qusAnsMap.isNotEmpty) {
                                  controller.loading.value = true;
                                  await ApiUtilsForAll.getpostFAQ(
                                      faqs_id: jsonEncode(controller.qusAnsMap),
                                      controller: controller,
                                      b_id:
                                          '${controller.listofBuisness[controller.selectBusinessid.value]['business_id']}');
                                  controller.loading.value = false;
                                } else {
                                  snackBarFailer(
                                      'Please add your questions first');
                                }
                              } else {
                                snackBarFailer('Please select service first');
                              }
                            },
                            child: Container(
                              height: height * 0.055,
                              width: width * 0.3,
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          Container(
                            width: width,
                            child: Wrap(
                              children: controller.qusAnsMap.map((element) {
                                int index =
                                    controller.qusAnsMap.indexOf(element);
                                return Container(
                                  width: width,
                                  margin: EdgeInsets.only(
                                    top: height * 0.020,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Questions (${index + 1}) : ${element['faq_q']}',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blueColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.qusAnsMap
                                                  .removeAt(index);
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              size: 20,
                                              color:
                                                  Colors.red.withOpacity(0.5),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Ans : ${element['faq_a']}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black38),
                                      )
                                    ],
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
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            )
                          : SizedBox())
                    ],
                  ),
                ),
              ),
            )));
  }
}
