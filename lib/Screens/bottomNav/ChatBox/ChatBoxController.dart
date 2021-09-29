import 'dart:io';
import 'package:dail_box/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatBoxController extends GetxController {
  TextEditingController emailCon = TextEditingController();
  var listofChatBox = [].obs;
  var loadmainList = false.obs;

  var loading = false.obs;
  var firstTab = true.obs;

  var f1 = File('path').obs;
  var isf1 = false.obs;

  final ImagePicker _picker = ImagePicker();

  onImageButtonPressed(ImageSource source, {String? tag}) async {
    try {
      final pickedFile = await _picker.getImage(
        source: source,
      );
      setImageFile(f: pickedFile, tag: tag);
    } catch (e) {}
  }

  setImageFile({PickedFile? f, String? tag}) async {
    final filePath = f!.path;
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    final compressedImage = await FlutterImageCompress.compressAndGetFile(
        filePath, outPath,
        minWidth: 800, minHeight: 1500, quality: 60);
    f1.value = compressedImage!;
    isf1.value = true;
  }

  void displayBottomSheet() {
    var height = Get.height;
    var width = Get.width;
    showModalBottomSheet(
        context: Get.context!,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(width / 30),
            height: MediaQuery.of(Get.context!).size.height / 5,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: findLanguageController.isEnglishLocale.value? MainAxisAlignment.start: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            onImageButtonPressed(ImageSource.camera);
                            Navigator.of(Get.context!).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(width / 100),
                            height: height / 10,
                            width: width / 5,
                            child: Image.asset('assets/images/camera.png'),
                          ),
                        ),
                        Text(
                          'Camera'.tr,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Comfortaa',
                              letterSpacing: 0.3,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            onImageButtonPressed(ImageSource.gallery);
                            Navigator.of(Get.context!).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(width / 35),
                            height: height / 10,
                            width: width / 5,
                            child: Image.asset('assets/images/gallary.png'),
                          ),
                        ),
                        Text(
                          'Photos'.tr,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Comfortaa',
                              letterSpacing: 0.3,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          );
        });
  }

  var writeCommentCon = TextEditingController().obs;
  var searchCon = TextEditingController().obs;

  var listofIndustry = [].obs;
  var currentlistofIndustryIndex = 0.obs;
  var listofIndustryHint = 'Industry'.tr.obs;

  var listofCat = [].obs;
  var currentlistofCatIndex = 0.obs;
  var listofCatHint = 'Category'.tr.obs;

  var listofIndustrytwo = [].obs;
  var currentlistofIndustryIndextwo = 0.obs;
  var listofIndustryHinttwo = 'Select Industry'.tr.obs;

  var listofCattwo = [].obs;
  var currentlistofCatIndextwo = 0.obs;
  var listofCatHinttwo = 'Category'.tr.obs;

  var listofbuisness = [].obs;
  var currentlistofbuisnessIndex = 0.obs;
  var listoflistofbuisnessHint = 'Business'.tr.obs;
}
