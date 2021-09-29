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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Business Address*'.tr,
            controller: controller.businessArea,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Website link'.tr,
            controller: controller.businessWebsiteUrl,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          // Text(
          //   'Number of Employees (can we have dropdown with 3 options: 1-10,10-49,50+',
          //   style: TextStyle(fontSize: 12),
          // ),
          // SizedBox(
          //   height: height * 0.010,
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(5.0),
          //     color: Colors.grey[200],
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(0.1),
          //         offset: Offset(0.0, 3),
          //         //(x,y)
          //         blurRadius: 5.0,
          //       ),
          //     ],
          //   ),
          //   height: height * 0.060,
          //   width: width,
          //   padding: EdgeInsets.symmetric(horizontal: width * 0.030),
          //   child: DropdownButtonHideUnderline(
          //     child: DropdownButton<dynamic>(
          //         items: controller.listofEmployee.map((value) {
          //           return DropdownMenuItem<String>(
          //             value: '$value',
          //             child: Text('$value'),
          //             onTap: () {
          //               controller.currentlistofEmployeeIndex.value =
          //                   controller.listofEmployee.indexOf(value);
          //               controller.listofEmployeeHint.value = value;
          //             },
          //           );
          //         }).toList(),
          //         hint: Text(
          //           controller.listofEmployeeHint.value,
          //           style: TextStyle(fontSize: 14),
          //         ),
          //         onChanged: (_) {},
          //         isExpanded: true),
          //   ),
          // ),
          // SizedBox(
          //   height: height * 0.020,
          // ),
          TextFromFieldsCustom(
            hint: 'Facebook Link'.tr,
            controller: controller.businessFb,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Instagram Link'.tr,
            controller: controller.businessInsta,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          // TextFromFieldsCustom(
          //   hint: 'Twitter Link'.tr,
          //   controller: controller.businessTwitter,
          // ),
          // SizedBox(
          //   height: height * 0.020,
          // ),
          TextFromFieldsCustom(
            hint: 'YouTube Link'.tr,
            controller: controller.businessNoOfYoutube,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          TextFromFieldsCustom(
            hint: 'Service Areas'.tr,
            controller: controller.businessServiceArea,
          ),
          SizedBox(
            height: height * 0.020,
          ),
          Text(
            'Delivery Available*'.tr,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 3,
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
                            controller.listOfDeliveryAvailable.indexOf(value);
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
          Text(
            'Booking Available*'.tr,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 3,
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
                            controller.listOfBooking.indexOf(value);
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
          Text(
            'Take Away/Pick up'.tr,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 3,
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
                            controller.listpick_up.indexOf(value);
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
          Text(
            'By Appointment'.tr,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 3,
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
                            controller.listby_appointment.indexOf(value);
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
                if (controller.businessArea.text.trim().isNotEmpty) {
                  if (controller.listOfDeliveryAvailableHint.value !=
                      'Delivery Available*'.tr) {
                    if (controller.listOfBookingHint.value !=
                        'Booking Available*'.tr) {
                      controller.currentIndex.value = 3;
                      scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      );
                    } else {
                      snackBarFailer('Select Booking Available first'.tr);
                    }
                  } else {
                    snackBarFailer('Select Delivery Available first'.tr);
                  }
                } else {
                  snackBarFailer('Enter Physical business address or Virtual city area'.tr);
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
