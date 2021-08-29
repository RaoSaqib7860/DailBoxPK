import 'package:animate_do/animate_do.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/Screens/AddProduct.dart/AddProductController.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BROne.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistrationController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BRThree.dart';
import 'BRTwo.dart';

class BuisnessRegistration extends StatefulWidget {
  const BuisnessRegistration({Key? key}) : super(key: key);

  @override
  _BuisnessRegistrationState createState() => _BuisnessRegistrationState();
}

class _BuisnessRegistrationState extends State<BuisnessRegistration> {
  var controller = Get.put(BuisnessRegistrationController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
        child: Scaffold(
          appBar: appBarGlobal('Business Registration'.tr),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.020,
                  ),
                  RichText(
                    text: new TextSpan(
                        text: 'Create your'.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                        children: [
                          new TextSpan(
                            text: ' Business '.tr,
                            style: TextStyle(color: blueColor),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => print('Tap Here onTap'),
                          ),
                          new TextSpan(
                            text: 'Account free and get Register your business'.tr,
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => print('Tap Here onTap'),
                          )
                        ]),
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
    return Container(
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
    );
  }
}

class TextFromFieldsCustom extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final IconData? iconData;
  final isNumber;
  final Widget? postIcon;

  const TextFromFieldsCustom(
      {Key? key,
      this.controller,
      this.hint,
      this.iconData,
      this.isNumber = false,
      this.postIcon})
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
          cursorColor: Colors.black,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
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
              ),
              hintStyle: TextStyle(color: greyColor, fontSize: 12),
              hintText: widget.hint!),
        ),
      ),
    );
  }
}
