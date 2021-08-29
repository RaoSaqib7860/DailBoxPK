import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ApiUtisAllFiles.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistration.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'AddProductController.dart';

class AddProduct extends StatefulWidget {
  final String? id;

  const AddProduct({Key? key, this.id}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final controller = Get.put(AddProductController());

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
    return LayoutBuilder(builder: (context, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
          child: Scaffold(
        appBar: appBarGlobal('Add Product'.tr),
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.020,
                  ),
                  Expanded(
                      child: Obx(
                    () => SingleChildScrollView(
                      child: !controller.firstTab.value
                          ? Column(
                              children: [
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.030),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<dynamic>(
                                        items: controller.listofBuisness
                                            .map((value) {
                                          return DropdownMenuItem<String>(
                                            value: '$value',
                                            child: Text(
                                                '${value['business_name']}'),
                                            onTap: () {
                                              controller.buisnessIDforservice
                                                      .value =
                                                  controller.listofBuisness
                                                      .indexOf(value);
                                              controller
                                                      .selectserviceHint.value =
                                                  value['business_name'];
                                            },
                                          );
                                        }).toList(),
                                        hint: Text(
                                          controller.selectserviceHint.value,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        onChanged: (_) {},
                                        isExpanded: true),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.030,
                                ),
                                TextFromFieldsCustom(
                                  controller: controller.sNameCon,
                                  hint: 'Service Name'.tr,
                                ),
                                SizedBox(
                                  height: height * 0.030,
                                ),
                                TextFromFieldsCustom(
                                  controller: controller.sPriceCon,
                                  hint: 'Service Cost'.tr,
                                  isNumber: true,
                                ),
                                SizedBox(
                                  height: height * 0.030,
                                ),
                                TextFromFieldsCustom(
                                  controller: controller.sDetailsCon,
                                  hint: 'Service Details'.tr,
                                ),
                                SizedBox(
                                  height: height * 0.030,
                                ),
                                FadeInUpBig(
                                  child: InkWell(
                                    onTap: () {
                                      if (controller.selectserviceHint.value !=
                                          'Select Business'.tr) {
                                        if (controller
                                            .sNameCon.text.isNotEmpty) {
                                          if (controller
                                              .sPriceCon.text.isNotEmpty) {
                                            if (controller
                                                .sDetailsCon.text.isNotEmpty) {
                                              controller.loading.value = true;
                                              ApiUtilsForAll.getaddservice(
                                                  controller,
                                                  controller.listofBuisness[
                                                      controller
                                                          .buisnessIDforservice
                                                          .value]['business_id']);
                                            } else {
                                              snackBarFailer(
                                                  'Please select product details first');
                                            }
                                          } else {
                                            snackBarFailer(
                                                'Please select product price first');
                                          }
                                        } else {
                                          snackBarFailer(
                                              'Please select product name first');
                                        }
                                      } else {
                                        snackBarFailer(
                                            'Please select service first');
                                      }
                                    },
                                    child: Container(
                                      height: height * 0.070,
                                      width: width,
                                      child: Center(
                                        child: Text(
                                          'Add Service'.tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 0.5),
                                        ),
                                      ),
                                      decoration:
                                          BoxDecoration(color: blueColor),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Obx(
                              () => Column(
                                children: [
                                  Container(
                                    height: height * 0.060,
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.030),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<dynamic>(
                                          items: controller.listofBuisness
                                              .map((value) {
                                            return DropdownMenuItem<String>(
                                              value: '$value',
                                              child: Text(
                                                  '${value['business_name']}'),
                                              onTap: () {
                                                controller.buisnessIDforProduct
                                                        .value =
                                                    controller.listofBuisness
                                                        .indexOf(value);
                                                controller.selectBusinessHint
                                                        .value =
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
                                  SizedBox(
                                    height: height * 0.030,
                                  ),
                                  TextFromFieldsCustom(
                                    controller: controller.pNameCon,
                                    hint: 'Product Name'.tr,
                                  ),
                                  SizedBox(
                                    height: height * 0.030,
                                  ),
                                  TextFromFieldsCustom(
                                    controller: controller.pPriceCon,
                                    hint: 'Product Price'.tr,
                                    isNumber: true,
                                  ),
                                  SizedBox(
                                    height: height * 0.030,
                                  ),
                                  TextFromFieldsCustom(
                                    controller: controller.pDetailsCon,
                                    hint: 'Product Details'.tr,
                                  ),
                                  SizedBox(
                                    height: height * 0.030,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Product image 1'.tr,
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Product image 2'.tr,
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Product image 3'.tr,
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.010,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.displayBottomSheet(
                                                tag: '1');
                                          },
                                          child: Container(
                                            child: Container(
                                              height: height * 0.150,
                                              child: Card(
                                                color: Colors.blueGrey[100],
                                                child: controller.isf1.value
                                                    ? Image.file(
                                                        controller.f1.value,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.displayBottomSheet(
                                                tag: '2');
                                          },
                                          child: Container(
                                            child: Container(
                                              height: height * 0.150,
                                              child: Card(
                                                color: Colors.blueGrey[100],
                                                child: controller.isf2.value
                                                    ? Image.file(
                                                        controller.f2.value,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.displayBottomSheet(
                                                tag: '3');
                                          },
                                          child: Container(
                                            child: Container(
                                              height: height * 0.150,
                                              child: Card(
                                                color: Colors.blueGrey[100],
                                                child: controller.isf3.value
                                                    ? Image.file(
                                                        controller.f3.value,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    child: SizedBox(
                                      height: height * 0.030,
                                    ),
                                  ),
                                  FadeInUpBig(
                                    child: InkWell(
                                      onTap: () {
                                        if (controller
                                                .selectBusinessHint.value !=
                                            'Select Business'.tr) {
                                          if (controller
                                              .pNameCon.text.isNotEmpty) {
                                            if (controller
                                                .pPriceCon.text.isNotEmpty) {
                                              if (controller.pDetailsCon.text
                                                  .isNotEmpty) {
                                                if (controller.isf1.value &&
                                                    controller.isf2.value &&
                                                    controller.isf3.value) {
                                                  controller.loading.value =
                                                      true;
                                                  ApiUtilsAllFiles.gethomeproducts(
                                                      controller,
                                                      controller.listofBuisness[
                                                              controller
                                                                  .buisnessIDforProduct
                                                                  .value]
                                                          ['business_id']);
                                                } else {
                                                  snackBarFailer(
                                                      'Please select all images first'.tr);
                                                }
                                              } else {
                                                snackBarFailer(
                                                    'Please select product details first');
                                              }
                                            } else {
                                              snackBarFailer(
                                                  'Please select product price first');
                                            }
                                          } else {
                                            snackBarFailer(
                                                'Please select product name first');
                                          }
                                        } else {
                                          snackBarFailer(
                                              'Please select Business first');
                                        }
                                      },
                                      child: Container(
                                        height: height * 0.070,
                                        width: width,
                                        child: Center(
                                          child: Text(
                                            'Add Product'.tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 0.5),
                                          ),
                                        ),
                                        decoration:
                                            BoxDecoration(color: blueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ))
                ],
              ),
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
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    ),
                  )
                : SizedBox())
          ],
        ),
      ));
    });
  }
}
