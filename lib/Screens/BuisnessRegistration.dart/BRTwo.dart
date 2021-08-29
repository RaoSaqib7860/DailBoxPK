import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BuisnessRegistration.dart';
import 'BuisnessRegistrationController.dart';

class BRTwo extends StatefulWidget {
  final height;
  final width;

  const BRTwo({Key? key, this.height, this.width}) : super(key: key);

  @override
  _BRTwoState createState() => _BRTwoState();
}

class _BRTwoState extends State<BRTwo> {
  var controller = Get.find<BuisnessRegistrationController>();

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
          TextFromFieldsCustom(
            hint: 'City* / Area**'.tr,
            controller: controller.businessArea,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Website URL'.tr,
            controller: controller.businessWebsiteUrl,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Number of Employs'.tr,
            isNumber: true,
            controller: controller.businessNoOfEmployess,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'FaceBook URL'.tr,
            controller: controller.businessFb,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Instagram URL'.tr,
            controller: controller.businessInsta,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Twitter URL'.tr,
            controller: controller.businessTwitter,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Youtube URl'.tr,
            controller: controller.businessNoOfYoutube,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Service Area'.tr,
            controller: controller.businessServiceArea,
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
                  items: controller.listOfDeliveryAvailable.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('$value'),
                      onTap: () {
                        controller.currentListOfDeliveryAvailableIndex.value =
                            controller.listofSV.indexOf(value);
                        controller.listOfDeliveryAvailableHint.value = value;
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.listOfDeliveryAvailableHint.value,
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
                  items: controller.listOfBooking.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('$value'),
                      onTap: () {
                        controller.currentlistOfBookingIndex.value =
                            controller.listofSV.indexOf(value);
                        controller.listOfBookingHint.value = value;
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.listOfBookingHint.value,
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
                  items: controller.listpick_up.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('$value'),
                      onTap: () {
                        controller.currentpick_upIndex.value =
                            controller.listofSV.indexOf(value);
                        controller.pick_upHint.value = value;
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.pick_upHint.value,
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
                  items: controller.listby_appointment.map((value) {
                    return DropdownMenuItem<String>(
                      value: '$value',
                      child: Text('$value'),
                      onTap: () {
                        controller.currentby_appointmentIndex.value =
                            controller.listofSV.indexOf(value);
                        controller.by_appointmentHint.value = value;
                      },
                    );
                  }).toList(),
                  hint: Text(
                    controller.by_appointmentHint.value,
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
                if (controller.businessArea.text.isNotEmpty) {
                  if (controller.businessWebsiteUrl.text.isNotEmpty) {
                    if (controller.businessNoOfEmployess.text.isNotEmpty) {
                      if (controller.businessFb.text.isNotEmpty) {
                        if (controller.businessInsta.text.isNotEmpty) {
                          if (controller.businessTwitter.text.isNotEmpty) {
                            if (controller
                                .businessNoOfYoutube.text.isNotEmpty) {
                              if (controller
                                  .businessServiceArea.text.isNotEmpty) {
                                if (controller
                                        .listOfDeliveryAvailableHint.value !=
                                    'Delivery Available'.tr) {
                                  if (controller.pick_upHint.value !=
                                      'PickUp'.tr) {
                                    if (controller.listOfBookingHint.value !=
                                        'PickUp'.tr) {
                                      if (controller.by_appointmentHint.value !=
                                          'By Appointment'.tr) {
                                        controller.currentIndex.value = 3;
                                      } else {
                                        snackBarSuccess(
                                            'Select By AppointmentHint first');
                                      }
                                    } else {
                                      snackBarSuccess('Select Booking first');
                                    }
                                  } else {
                                    snackBarSuccess('Select PickUp first');
                                  }
                                } else {
                                  snackBarSuccess(
                                      'Select Delivery Available first');
                                }
                              } else {
                                snackBarSuccess('Add Service Area URL  first');
                              }
                            } else {
                              snackBarSuccess('Add Youtube URL  first');
                            }
                          } else {
                            snackBarSuccess('Add Twitter URL  first');
                          }
                        } else {
                          snackBarSuccess('Add Instagram URL  first');
                        }
                      } else {
                        snackBarSuccess('Add FB URL  first');
                      }
                    } else {
                      snackBarSuccess('Select No Of Employees  first');
                    }
                  } else {
                    snackBarSuccess('Select Website URL first');
                  }
                } else {
                  snackBarSuccess('Select City/Area first');
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
