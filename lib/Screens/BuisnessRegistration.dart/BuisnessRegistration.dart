import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BROne.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BRThree.dart';
import 'BRTwo.dart';

ScrollController scrollController = ScrollController();
bool isEditBusiness = false;

class BuisnessRegistration extends StatefulWidget {
  final int? currentPackage;
  final Map? mapData;

  const BuisnessRegistration(
      {Key? key, this.currentPackage = 0, this.mapData = const {}})
      : super(key: key);

  @override
  _BuisnessRegistrationState createState() => _BuisnessRegistrationState();
}

class _BuisnessRegistrationState extends State<BuisnessRegistration> {
  var controller = Get.put(BuisnessRegistrationController());

  @override
  void initState() {
    if (widget.mapData!.isNotEmpty) {
      isEditBusiness = true;
      printlog('mapData = ${widget.mapData!}');
      controller.businessName.text =
          '${widget.mapData!['business_name'] ?? ''}';
      controller.agentID.value = '${widget.mapData!['agent_id']}';
      controller.herarAbout.value = '${widget.mapData!['hear_about']}';
      controller.businessEmail.text =
          '${widget.mapData!['business_email'] ?? ""}';
      controller.businessPhone.text = '${widget.mapData!['cell_number'] ?? ''}'
          .toString()
          .replaceAll('+92', '')
          .trim()
          .toString();
      controller.businessLandline.text =
          '${widget.mapData!['landline_number'] ?? ''}';
      controller.businessAddress.text =
          '${widget.mapData!['business_address'] ?? ''}';
      controller.businessArea.text = '${widget.mapData!['area'] ?? ''}';
      // controller.b_lat.value = '${widget.mapData!['b_lat']}';
      // controller.b_lng.value = '${widget.mapData!['b_log']}';
      controller.businessWebsiteUrl.text =
          '${widget.mapData!['web_url'] ?? ''}';
      controller.businessDiscription.text =
          '${widget.mapData!['business_description'] ?? ''}';
      controller.businessNoOfYoutube.text =
          '${widget.mapData!['youtube'] ?? ''}';
      controller.businessFb.text = '${widget.mapData!['facebook'] ?? ''}';
      controller.businessInsta.text = '${widget.mapData!['insta'] ?? ''}';
      controller.businessServiceArea.text =
          '${widget.mapData!['service_areas'] ?? ''}';
      if (widget.mapData!['p_v_store'] != null ||
          widget.mapData!['p_v_store'] != '') {
        if ('${widget.mapData!['p_v_store']}' == 'Virtual') {
          controller.currentSVIndex.value = 1;
          controller.SVHint.value = 'Virtual';
        } else if ('${widget.mapData!['p_v_store']}' == 'Physical Location') {
          controller.currentSVIndex.value = 0;
          controller.SVHint.value = 'Physical Location';
        }
      }

      if (widget.mapData!['delivery_available'] != null ||
          widget.mapData!['delivery_available'] != '') {
        if ('${widget.mapData!['delivery_available']}' == 'No') {
          controller.currentListOfDeliveryAvailableIndex.value = 1;
          controller.listOfDeliveryAvailableHint.value = 'No';
        } else if ('${widget.mapData!['delivery_available']}' == 'Yes') {
          controller.currentListOfDeliveryAvailableIndex.value = 0;
          controller.listOfDeliveryAvailableHint.value = 'Yes';
        }
      }
      if (widget.mapData!['booking'] != null ||
          widget.mapData!['booking'] != '') {
        if ('${widget.mapData!['booking']}' == 'No') {
          controller.currentlistOfBookingIndex.value = 1;
          controller.listOfBookingHint.value = 'No';
        } else if ('${widget.mapData!['booking']}' == 'Yes') {
          controller.currentlistOfBookingIndex.value = 0;
          controller.listOfBookingHint.value = 'Yes';
        }
      }
      if (widget.mapData!['pick_up'] != null ||
          widget.mapData!['pick_up'] != '') {
        if ('${widget.mapData!['pick_up']}' == 'No') {
          controller.currentpick_upIndex.value = 1;
          controller.pick_upHint.value = 'No';
        } else if ('${widget.mapData!['pick_up']}' == 'Yes') {
          controller.currentpick_upIndex.value = 0;
          controller.pick_upHint.value = 'Yes';
        }
      }
      if (widget.mapData!['by_appointment'] != null ||
          widget.mapData!['by_appointment'] != '') {
        if ('${widget.mapData!['by_appointment']}' == 'No') {
          controller.currentby_appointmentIndex.value = 1;
          controller.by_appointmentHint.value = 'No';
        } else if ('${widget.mapData!['by_appointment']}' == 'Yes') {
          controller.currentby_appointmentIndex.value = 0;
          controller.by_appointmentHint.value = 'Yes';
        }
      }
      List list = widget.mapData!['industry_sub_name'] ?? [];
      for (var i = 0; i < list.length; i++) {
        controller.listselectedofSubCatids
            .add({'industry_cat': '${list[i]['main_cat_id']}'});
        controller.listselectedofSubname.add('${list[i]['main_cat_name']}');
      }
      if (widget.mapData!['timings'] != null ||
          widget.mapData!['timings'] != '') {
        printlog('timings = ${widget.mapData!['timings']}');
        List time = '${widget.mapData!['timings']}'.split('\n');
        time.forEach((element) {
          int index = time.indexOf(element);
          String value = '$element'.replaceRange(0, 4, '').trim();
          printlog('0 = $value');
          if (index == 0) {
            controller.mon.value = value;
          } else if (index == 1) {
            controller.tue.value = value;
          } else if (index == 2) {
            controller.wed.value = value;
          } else if (index == 3) {
            controller.thus.value = value;
          } else if (index == 4) {
            controller.fri.value = value;
          } else if (index == 5) {
            controller.sat.value = value;
          } else if (index == 6) {
            controller.sun.value = value;
          }
        });
        controller.listing_image.value = '${widget.mapData!['listing_image']}';
        controller.business_id.value = '${widget.mapData!['business_id']}';
      }
    }
    controller.currentPackage.value = widget.currentPackage!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return WillPopScope(
        onWillPop: () async {
          if (controller.currentIndex.value != 1) {
            controller.currentIndex.value = controller.currentIndex.value - 1;
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: blueColor,
            elevation: 0,
            title: Text(
              widget.mapData!.isNotEmpty
                  ? 'Update Business'.tr
                  : 'Business Registration'.tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  if (controller.currentIndex.value != 1) {
                    controller.currentIndex.value =
                        controller.currentIndex.value - 1;
                  } else {
                    Get.back();
                  }
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: scrollController,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.020,
                  ),
                  Obx(
                    () => controller.currentIndex.value == 1
                        ? RichText(
                            text: new TextSpan(
                              text: 'Fill in the'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500),
                              children: [
                                new TextSpan(
                                  text: ' business '.tr,
                                  style: TextStyle(color: blueColor),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                ),
                                new TextSpan(
                                  text:
                                      'form and submit listing. Once approved, you can start listing products & services.'
                                          .tr,
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                )
                              ],
                            ),
                            textAlign:
                                findLanguageController.isEnglishLocale.value
                                    ? TextAlign.left
                                    : TextAlign.right,
                          )
                        : SizedBox(),
                  ),
                  Obx(
                    () => controller.currentIndex.value == 1
                        ? BROne(
                            height: height,
                            width: width,
                          )
                        : controller.currentIndex.value == 2
                            ? BRTwo(
                                height: height,
                                width: width,
                              )
                            : BRThree(
                                height: height,
                                width: width,
                              ),
                  ),
                  Obx(
                    () => Row(
                      children: [1, 2, 3].map((e) {
                        return controller.currentIndex.value == e
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.020),
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(color: blueColor),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.015),
                                height: 6,
                                width: 6,
                                decoration:
                                    BoxDecoration(color: Colors.blueGrey[300]),
                              );
                      }).toList(),
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.030,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class DropDownCustom extends StatefulWidget {
  final Function(int)? ontap;
  final String? hint;
  final List<dynamic>? listofDropDown;

  const DropDownCustom({Key? key, this.hint, this.listofDropDown, this.ontap})
      : super(key: key);

  @override
  _DropDownCustomState createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${widget.hint!}',
          style: TextStyle(fontSize: 12),
        ),
        Container(
          height: height * 0.060,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.030),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<dynamic>(
                items: widget.listofDropDown!.map((value) {
                  return DropdownMenuItem<String>(
                    value: '$value',
                    child: Text('salc'.tr),
                    onTap: widget.ontap!(widget.listofDropDown!.indexOf(value)),
                  );
                }).toList(),
                hint: Text(
                  widget.hint!,
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
                offset: Offset(0.0, 3), //(x,y)
                blurRadius: 5.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TextFromFieldsCustom extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final IconData? iconData;
  final isNumber;
  final bool? enable;
  final Widget? postIcon;

  const TextFromFieldsCustom(
      {Key? key,
      this.controller,
      this.hint,
      this.iconData,
      this.isNumber = false,
      this.postIcon,
      this.enable = true})
      : super(key: key);

  @override
  _TextFromFieldsCustomState createState() => _TextFromFieldsCustomState();
}

class _TextFromFieldsCustomState extends State<TextFromFieldsCustom> {
  @override
  Widget build(BuildContext context) {
    return FlipInX(
      delay: Duration(milliseconds: 500),
      duration: Duration(milliseconds: 700),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0.0, 3), //(x,y)
              blurRadius: 5.0,
            ),
          ],
        ),
        child: TextFormField(
          textAlign:
              // widget.isNumber?TextAlign.left:
              findLanguageController.isEnglishLocale.value
                  ? TextAlign.left
                  : TextAlign.right,
          cursorColor: Colors.black,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          enabled: widget.enable,
          keyboardType:
              widget.isNumber ? TextInputType.number : TextInputType.text,
          decoration: new InputDecoration(
              // prefixIcon: Icon(
              //   widget.iconData,
              //   color: greyColor,
              // ),
              suffixIcon: widget.postIcon,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 15,
                bottom: 11,
                top: 11,
                right: 10,
              ),
              hintStyle: TextStyle(color: greyColor, fontSize: 12),
              hintText: widget.hint!),
        ),
      ),
    );
  }
}
