import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  TextEditingController pNameCon = TextEditingController();
  TextEditingController pPriceCon = TextEditingController();
  TextEditingController pDetailsCon = TextEditingController();

  TextEditingController sNameCon = TextEditingController();
  TextEditingController sPriceCon = TextEditingController();
  TextEditingController sDetailsCon = TextEditingController();
  var buisnessIDforProduct = 100.obs;
  var listofBuisness = [].obs;
  var selectBusinessHint = 'Select Business'.obs;
  var selectBusinessid = 'Select Business'.obs;

  var buisnessIDforservice = 100.obs;
  var selectserviceHint = 'Select Business'.obs;
  var selectserviceid = 'Select Business'.obs;

  var loading = false.obs;
  var firstTab = true.obs;

  var f1 = File('path').obs;
  var isf1 = false.obs;
  var f2 = File('path').obs;
  var isf2 = false.obs;
  var f3 = File('path').obs;
  var isf3 = false.obs;

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
    if (tag == '1') {
      f1.value = compressedImage!;
      isf1.value = true;
    } else if (tag == '2') {
      f2.value = compressedImage!;
      isf2.value = true;
    } else if (tag == '3') {
      f3.value = compressedImage!;
      isf3.value = true;
    }
  }

  void displayBottomSheet({String? tag}) {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            onImageButtonPressed(ImageSource.camera, tag: tag);
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
                            onImageButtonPressed(ImageSource.gallery, tag: tag);
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
                          'Gallary'.tr,
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
}
