import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BuisnessRegistrationController extends GetxController {
  var currentIndex = 1.obs;

  var listofPackage = [].obs;
  var currentPackageIndex = 0.obs;
  var packageHint = 'Select Package'.obs;

  var listofIndustry = [].obs;
  var currentlistofIndustryIndex = 0.obs;
  var listofIndustryHint = 'Select Industry'.obs;

  var listofSV = ['Yes', 'No'].obs;
  var currentSVIndex = 0.obs;
  var SVHint = 'Physical store* / Virtual store*'.obs;

  var listOfDeliveryAvailable = ['Yes', 'No'].obs;
  var currentListOfDeliveryAvailableIndex = 0.obs;
  var listOfDeliveryAvailableHint = 'Delivery Available'.obs;

  var listOfBooking = ['Yes', 'No'].obs;
  var currentlistOfBookingIndex = 0.obs;
  var listOfBookingHint = 'Booking'.obs;

  var listpick_up = ['Yes', 'No'].obs;
  var currentpick_upIndex = 0.obs;
  var pick_upHint = 'PickUp'.obs;

  var listby_appointment = ['Yes', 'No'].obs;
  var currentby_appointmentIndex = 0.obs;
  var by_appointmentHint = 'By Appointment'.obs;

  var listofCat = [].obs;
  var currentlistofCatIndex = 0.obs;
  var listofCatHint = 'Category'.obs;

  var listofSubCat = [].obs;
  var currentlistofSubCatIndex = 0.obs;
  var listofSubCatHint = 'Sub Category'.obs;

  TextEditingController businessName = TextEditingController();
  TextEditingController businessEmail = TextEditingController();
  TextEditingController businessPhone = TextEditingController();
  TextEditingController businessLandline = TextEditingController();
  TextEditingController businessWhatsApp = TextEditingController();
  TextEditingController businessCity = TextEditingController();
  TextEditingController businessArea = TextEditingController();
  TextEditingController businessAddress = TextEditingController();
  TextEditingController businessDiscription = TextEditingController();
  TextEditingController businessWebsiteUrl = TextEditingController();
  TextEditingController businessNoOfEmployess = TextEditingController();
  TextEditingController businessFb = TextEditingController();
  TextEditingController businessInsta = TextEditingController();
  TextEditingController businessTwitter = TextEditingController();
  TextEditingController businessNoOfYoutube = TextEditingController();
  TextEditingController businessServiceArea = TextEditingController();
  TextEditingController keyWordController = TextEditingController();
  TextEditingController hearAboutController = TextEditingController();
  var listOfKeyWord = [].obs;
  var mon = 'Select time'.obs;
  var tue = 'Select time'.obs;
  var wed = 'Select time'.obs;
  var thus = 'Select time'.obs;
  var fri = 'Select time'.obs;
  var sat = 'Select time'.obs;
  var sun = 'Select time'.obs;
  var Date = 'Select Date'.obs;

  var f1 = File('path').obs;
  var isf1 = false.obs;

  final ImagePicker _picker = ImagePicker();

  onImageButtonPressed(ImageSource source) async {
    try {
      final pickedFile = await _picker.getImage(
        source: source,
      );
      setImageFile(f: pickedFile);
    } catch (e) {}
  }

  setImageFile({PickedFile? f}) async {
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
