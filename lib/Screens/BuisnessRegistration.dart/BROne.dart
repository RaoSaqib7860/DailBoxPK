import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ApiUtisAllFiles.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BuisnessRegistration.dart';

class BROne extends StatefulWidget {
  final height;
  final width;

  const BROne({Key? key, this.height, this.width}) : super(key: key);

  @override
  _BROneState createState() => _BROneState();
}

class _BROneState extends State<BROne> {
  var controller = Get.find<BuisnessRegistrationController>();

  @override
  void initState() {
    ApiUtilsForAll.getgetpackges();
    ApiUtilsForAll.getgetmainindurty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = widget.height;
    var width = widget.width;
    return Obx(
      () => Column(
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
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                  items: controller.listofPackage.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('${value['package_name']}'),
                      onTap: () {
                        controller.currentPackageIndex.value =
                            controller.listofPackage.indexOf(value);
                        controller.packageHint.value = value['package_name'];
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.packageHint.value,
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
                  items: controller.listofIndustry.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('${value['industry_name']}'),
                      onTap: () {
                        controller.currentlistofIndustryIndex.value =
                            controller.listofIndustry.indexOf(value);
                        controller.listofIndustryHint.value =
                            value['industry_name'];
                        ApiUtilsForAll.getgetMainCatapp(value['id']);
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.listofIndustryHint.value,
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
            hint: 'Business name*'.tr,
            controller: controller.businessName,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Business Description*'.tr,
            controller: controller.businessDiscription,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          // TextFromFieldsCustom(
          //   hint: 'Contact Person',
          // ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            controller: controller.businessEmail,
            hint: 'Business email'.tr,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            controller: controller.businessPhone,
            hint: 'Cell number'.tr,
            isNumber: true,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            controller: controller.businessLandline,
            hint: 'Landline number'.tr,
            isNumber: true,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            controller: controller.businessWhatsApp,
            hint: 'WhatsApp number'.tr,
            isNumber: true,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            controller: controller.businessCity,
            hint: 'City'.tr,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            controller: controller.businessAddress,
            hint: 'City'.tr,
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
                  items: controller.listofSV.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('$value'),
                      onTap: () {
                        controller.currentSVIndex.value =
                            controller.listofSV.indexOf(value);
                        controller.SVHint.value = value;
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.SVHint.value,
                    style: TextStyle(fontSize: 14),
                  ),
                  onChanged: (_) {},
                  isExpanded: true),
            ),
          ),
          SizedBox(
            height: height * 0.030,
          ),
          FadeInUpBig(
            child: InkWell(
              onTap: () {
                if (controller.packageHint.value != 'Select Package') {
                  if (controller.listofIndustryHint.value !=
                      'Select Industry') {
                    if (controller.businessName.text.isNotEmpty) {
                      if (controller.businessEmail.text.isNotEmpty) {
                        if (controller.businessPhone.text.isNotEmpty) {
                          if (controller.businessLandline.text.isNotEmpty) {
                            if (controller.businessWhatsApp.text.isNotEmpty) {
                              if (controller.businessCity.text.isNotEmpty) {
                                if (controller.SVHint.value !=
                                    'Physical store* / Virtual store*'.tr) {
                                  controller.currentIndex.value = 2;
                                } else {
                                  snackBarSuccess(
                                      'Select Physical store* / Virtual store* first');
                                }
                              } else {
                                snackBarSuccess('Add city first');
                              }
                            } else {
                              snackBarSuccess('Add Whats App number first');
                            }
                          } else {
                            snackBarSuccess('Add Landline number first');
                          }
                        } else {
                          snackBarSuccess('Add cell number first');
                        }
                      } else {
                        snackBarSuccess('Add business email first');
                      }
                    } else {
                      snackBarSuccess('Add business name first');
                    }
                  } else {
                    snackBarSuccess('Select Industry first');
                  }
                } else {
                  snackBarSuccess('Select package first');
                }
              },
              child: Container(
                height: height * 0.070,
                width: width,
                child: Center(
                  child: Text(
                    'NEXT'.tr,
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
