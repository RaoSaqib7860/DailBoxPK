import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistration.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'AddnewBuisenessController.dart';

class AddNewBuiseness extends StatefulWidget {
  @override
  _AddNewBuisenessState createState() => _AddNewBuisenessState();
}

class _AddNewBuisenessState extends State<AddNewBuiseness> {
  final controller = Get.put(AddNewBusinessController());

  @override
  void initState() {
    ApiUtilsForAll.getgetpackgesForAddBusiness(controller: controller);
    super.initState();
  }

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
            centerTitle: true,
            title: Text(
              'Add Business'.tr,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            elevation: 0,
            backgroundColor: blueColor,
          ),
          body: Obx(
            () => !controller.loading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: findLanguageController.isEnglishLocale.value? CrossAxisAlignment.start: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 20, bottom: 20, left: 15, right: 15),
                            decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Register your business with dialboxx and go online today! Help potential buyers get in touch with you using Dialboxx search engine.'
                                  .tr,
                              textAlign:
                                  findLanguageController.isEnglishLocale.value
                                      ? TextAlign.left
                                      : TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Choose the best subscription package for your business:'
                                .tr,
                            textAlign:
                                findLanguageController.isEnglishLocale.value
                                    ? TextAlign.left
                                    : TextAlign.right,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                        
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        isEditBusiness = false;
                                        Get.to(BuisnessRegistration(
                                          currentPackage: 0,
                                        ));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 15),
                                        decoration: BoxDecoration(
                                            color: blueColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Stack(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  '${controller.listofPackage[0]['package_name']}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      '${controller.listofPackage[0]['package_price']}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'PKR',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  '${controller.listofPackage[0]['package_duration']} Days ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              top: 20,
                                              right: 10,
                                              child: Container(
                                                width: 70,
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                    top: 8,
                                                    bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Free'.tr,
                                                      style: TextStyle(
                                                          color: blueColor,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shape: CircleBorder(),
                                      elevation: 5,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: blueColor,
                                        ),
                                        child: Center(
                                            child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        isEditBusiness = false;
                                        Get.to(BuisnessRegistration(
                                          currentPackage: 1,
                                        ));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 15),
                                        decoration: BoxDecoration(
                                            color: redColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Stack(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  '${controller.listofPackage[1]['package_name']}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      '${controller.listofPackage[1]['package_price']}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'PKR',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  '${controller.listofPackage[1]['package_duration']} Days ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              top: 20,
                                              right: 10,
                                              child: Container(
                                                width: 70,
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                    top: 8,
                                                    bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      '50% Off',
                                                      style: TextStyle(
                                                          color: blueColor,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shape: CircleBorder(),
                                      elevation: 5,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: redColor,
                                        ),
                                        child: Center(
                                            child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        isEditBusiness = false;
                                        Get.to(BuisnessRegistration(
                                          currentPackage: 2,
                                        ));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 15),
                                        decoration: BoxDecoration(
                                            color: yellowColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Stack(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  '${controller.listofPackage[2]['package_name']}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      '${controller.listofPackage[2]['package_price']}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'PKR',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  '${controller.listofPackage[2]['package_duration']} Days ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              top: 20,
                                              right: 10,
                                              child: Container(
                                                width: 70,
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                    top: 8,
                                                    bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      '50% Off',
                                                      style: TextStyle(
                                                          color: blueColor,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shape: CircleBorder(),
                                      elevation: 5,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: yellowColor,
                                        ),
                                        child: Center(
                                            child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Package Benefits'.tr,
                            textAlign:
                                findLanguageController.isEnglishLocale.value
                                    ? TextAlign.left
                                    : TextAlign.right,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: Get.width,
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${controller.listofPackage[0]['package_name']}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${controller.listofPackage[0]['package_details']}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: Get.width,
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${controller.listofPackage[1]['package_name']}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${controller.listofPackage[1]['package_details']}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: Get.width,
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${controller.listofPackage[2]['package_name']}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${controller.listofPackage[2]['package_details']}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
          )),
    );
  }
}
