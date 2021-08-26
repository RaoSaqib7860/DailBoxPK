import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/ImagePreview/ImagePreview.dart';
import 'package:dail_box/Screens/SearchDetail/SearchDetailsController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SearchDetails extends StatefulWidget {
  final String? buisinessId;
  final String? fromApi;
  final String? name;

  const SearchDetails({Key? key, this.buisinessId, this.fromApi, this.name})
      : super(key: key);

  @override
  _SearchDetailsState createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  final controller = Get.put(SearchDetailsController());
  GetStorage storage = GetStorage();

  @override
  void initState() {
    controller.listofData.clear();
    controller.listofReview.clear();
    if (widget.fromApi == 'product') {
      ApiUtils.getgetproduct(controller: controller, id: widget.buisinessId);
      ApiUtils.getgetproductallreview(
          controller: controller, id: widget.buisinessId);
    } else if (widget.fromApi == 'service') {
      ApiUtils.getgetservice(controller: controller, id: widget.buisinessId);
      ApiUtils.getgetserviceallreview(
          controller: controller, id: widget.buisinessId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (s, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          centerTitle: false,
          backgroundColor: blueColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.030),
          child: Obx(
            () => controller.listofData.isEmpty
                ? SizedBox(
                    height: height,
                    width: width,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: blueColor,
                      ),
                    ),
                  )
                : widget.fromApi == 'service'
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${controller.listofData[0]['s_name']}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                storage.read('userId') ==
                                        '${controller.listofData[0]['user_id']}'
                                    ? SizedBox()
                                    : InkWell(
                                        onTap: () {
                                          ratingDailog(
                                              productId: widget.buisinessId);
                                        },
                                        child: Container(
                                          height: height * 0.040,
                                          width: width * 0.350,
                                          child: Center(
                                            child: Text(
                                              'Rating this item',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${controller.listofData[0]['rating'] ?? 0.0}',
                                  style:
                                      TextStyle(fontSize: 12, color: blueColor),
                                ),
                                SizedBox(
                                  width: width * 0.020,
                                ),
                                Row(
                                  children: [1, 2, 3, 4, 5].map((e) {
                                    int value = double.parse(
                                            '${controller.listofData[0]['rating'] ?? '0.0'}')
                                        .toInt();
                                    return value >= e
                                        ? InkWell(
                                            child: Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.yellow[700],
                                            ),
                                          )
                                        : InkWell(
                                            child: Icon(
                                              Icons.star_border,
                                              size: 16,
                                              color: Colors.yellow[700],
                                            ),
                                          );
                                  }).toList(),
                                ),
                                SizedBox(
                                  width: width * 0.020,
                                ),
                                Text(
                                  'reviews ${controller.listofData[0]['total_review']}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black26),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Text(
                              '${controller.listofData[0]['s_details']}',
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Text(
                              'Price : ${controller.listofData[0]['s_cost']}/-',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: blueColor),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Text(
                              'Rating and Reviews',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: controller.listofReview.map((element) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircularProfileAvatar(
                                        'https://www.dailboxx.websitescare.com/upload/profile/${element['user_profile']}',
                                        elevation: 2,
                                        radius: 20,
                                      ),
                                      SizedBox(
                                        width: width * 0.040,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${element['user_name']}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children:
                                                  [1, 2, 3, 4, 5].map((e) {
                                                int value = int.parse(
                                                    '${element['service_rating'] ?? '0'}');
                                                return value >= e
                                                    ? InkWell(
                                                        child: Icon(
                                                          Icons.star,
                                                          size: 16,
                                                          color: Colors
                                                              .yellow[700],
                                                        ),
                                                      )
                                                    : InkWell(
                                                        child: Icon(
                                                          Icons.star_border,
                                                          size: 16,
                                                          color: Colors
                                                              .yellow[700],
                                                        ),
                                                      );
                                              }).toList(),
                                            ),
                                            Text(
                                              '${element['service_rview']}',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: height * 0.040,
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(ImagePreview(
                                  imagePath:
                                      'https://dailboxx.websitescare.com/upload/products/${controller.listofData[0]['pimage1']}',
                                ));
                              },
                              child: Container(
                                height: height * 0.3,
                                width: width,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: blueColor),
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    height: double.infinity,
                                    width: width * 0.360,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        'https://dailboxx.websitescare.com/upload/products/${controller.listofData[0]['pimage1']}',
                                    placeholder: (context, url) => ShimerEffect(
                                      child: SizedBox(
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(ImagePreview(
                                      imagePath:
                                          'https://dailboxx.websitescare.com/upload/products/${controller.listofData[0]['pimage2']}',
                                    ));
                                  },
                                  child: Container(
                                    height: height * 0.1,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: blueColor),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        height: double.infinity,
                                        width: width * 0.360,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://dailboxx.websitescare.com/upload/products/${controller.listofData[0]['pimage2']}',
                                        placeholder: (context, url) =>
                                            ShimerEffect(
                                          child: SizedBox(
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.030,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(ImagePreview(
                                      imagePath:
                                          'https://dailboxx.websitescare.com/upload/products/${controller.listofData[0]['pimage3']}',
                                    ));
                                  },
                                  child: Container(
                                    height: height * 0.1,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: blueColor),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        height: double.infinity,
                                        width: width * 0.360,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://dailboxx.websitescare.com/upload/products/${controller.listofData[0]['pimage3']}',
                                        placeholder: (context, url) =>
                                            ShimerEffect(
                                          child: SizedBox(
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${controller.listofData[0]['pname']}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                storage.read('userId') ==
                                        '${controller.listofData[0]['user_id']}'
                                    ? SizedBox()
                                    : InkWell(
                                        onTap: () {
                                          ratingDailog(
                                              productId: widget.buisinessId);
                                        },
                                        child: Container(
                                          height: height * 0.040,
                                          width: width * 0.350,
                                          child: Center(
                                            child: Text(
                                              'Rating this item',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${controller.listofData[0]['rating'] ?? 0.0}',
                                  style:
                                      TextStyle(fontSize: 12, color: blueColor),
                                ),
                                SizedBox(
                                  width: width * 0.020,
                                ),
                                Row(
                                  children: [1, 2, 3, 4, 5].map((e) {
                                    int value = double.parse(
                                            '${controller.listofData[0]['rating'] ?? '0.0'}')
                                        .toInt();
                                    return value >= e
                                        ? InkWell(
                                            child: Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.yellow[700],
                                            ),
                                          )
                                        : InkWell(
                                            child: Icon(
                                              Icons.star_border,
                                              size: 16,
                                              color: Colors.yellow[700],
                                            ),
                                          );
                                  }).toList(),
                                ),
                                SizedBox(
                                  width: width * 0.020,
                                ),
                                Text(
                                  'reviews ${controller.listofData[0]['total_review']}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black26),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Text(
                              '${controller.listofData[0]['p_details']}',
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Text(
                              'Price : ${controller.listofData[0]['pprice']}/-',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: blueColor),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Text(
                              'Rating and Reviews',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: controller.listofReview.map((element) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircularProfileAvatar(
                                        'https://www.dailboxx.websitescare.com/upload/profile/${element['user_profile']}',
                                        elevation: 2,
                                        radius: 20,
                                      ),
                                      SizedBox(
                                        width: width * 0.040,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${element['user_name']}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children:
                                                  [1, 2, 3, 4, 5].map((e) {
                                                int value = int.parse(
                                                    '${element['product_rating'] ?? '0'}');
                                                return value >= e
                                                    ? InkWell(
                                                        child: Icon(
                                                          Icons.star,
                                                          size: 16,
                                                          color: Colors
                                                              .yellow[700],
                                                        ),
                                                      )
                                                    : InkWell(
                                                        child: Icon(
                                                          Icons.star_border,
                                                          size: 16,
                                                          color: Colors
                                                              .yellow[700],
                                                        ),
                                                      );
                                              }).toList(),
                                            ),
                                            Text(
                                              '${element['product_rview']}',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: height * 0.040,
                            ),
                          ],
                        ),
                        physics: BouncingScrollPhysics(),
                      ),
          ),
        ),
      ));
    });
  }

  ratingDailog({String? productId}) {
    int rating = 0;
    var height = Get.height;
    var width = Get.width;
    List list = [1, 2, 3, 4, 5];
    List listofCheck = [false, false, false, false, false];
    TextEditingController tecCon = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return FlipInX(
              child: Dialog(
                insetPadding:
                    EdgeInsets.only(left: width / 20, right: width / 20),
                child: Container(
                  height: height / 2.5,
                  width: width,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: height / 30,
                      ),
                      Center(
                          child: Text(
                        'Rate your Experience here'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      )),
                      SizedBox(
                        height: height / 50,
                      ),
                      Row(
                        children: list.map((e) {
                          int index = list.indexOf(e);
                          return listofCheck[index] == false
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 50, right: width / 50),
                                  child: InkWell(
                                    onTap: () {
                                      for (var i = 0;
                                          i < listofCheck.length;
                                          i++) {
                                        setState(() {
                                          listofCheck[i] = false;
                                        });
                                      }
                                      for (var i = 0; i < index + 1; i++) {
                                        setState(() {
                                          listofCheck[i] = true;
                                        });
                                      }
                                      rating = index + 1;
                                    },
                                    child: Container(
                                      child: Image.asset(
                                        'assets/images/star.png',
                                        color: Colors.black26,
                                      ),
                                      height: height / 20,
                                      width: width / 10,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 50, right: width / 50),
                                  child: InkWell(
                                    onTap: () {
                                      for (var i = 0;
                                          i < listofCheck.length;
                                          i++) {
                                        setState(() {
                                          listofCheck[i] = false;
                                        });
                                      }
                                      for (var i = 0; i < index + 1; i++) {
                                        setState(() {
                                          listofCheck[i] = true;
                                        });
                                      }
                                      rating = index + 1;
                                    },
                                    child: Container(
                                      child: Image.asset(
                                        'assets/images/star.png',
                                        color: Colors.yellow[700],
                                      ),
                                      height: height / 20,
                                      width: width / 10,
                                    ),
                                  ),
                                );
                        }).toList(),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: width / 20, right: width / 20),
                          child: GenaricTextField(
                            botomwidth: height / 50,
                            line: 5,
                            topwidth: height / 50,
                            controller: tecCon,
                          )),
                      SizedBox(
                        height: height / 40,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (listofCheck.contains(true)) {
                                if (tecCon.text.isNotEmpty) {
                                  if (widget.fromApi == 'product') {
                                    Navigator.of(context).pop();
                                    ApiUtils.getgiveproductrate(
                                            product_id: productId,
                                            product_rating: '$rating',
                                            product_review: tecCon.text)
                                        .then((value) {
                                      ApiUtils.getgetproduct(
                                          controller: controller,
                                          id: widget.buisinessId);
                                      ApiUtils.getgetproductallreview(
                                          controller: controller,
                                          id: widget.buisinessId);
                                    });
                                  } else {
                                    Navigator.of(context).pop();
                                    ApiUtils.getgiveservicerate(
                                            product_id: productId,
                                            product_rating: '$rating',
                                            product_review: tecCon.text)
                                        .then((value) {
                                      ApiUtils.getgetservice(
                                          controller: controller,
                                          id: widget.buisinessId);
                                      ApiUtils.getgetserviceallreview(
                                          controller: controller,
                                          id: widget.buisinessId);
                                    });
                                  }
                                } else {
                                  Navigator.of(context).pop();
                                  snackBarFailer('Please enter feed back'.tr);
                                }
                              } else {
                                Navigator.of(context).pop();
                                snackBarFailer('Please rate to Driver'.tr);
                              }
                            },
                            child: Container(
                              height: height * 0.045,
                              width: width * 0.3,
                              child: Center(
                                child: Text(
                                  'Ok'.tr,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class GenaricTextField extends StatefulWidget {
  final TextEditingController? controller;
  final int? line;
  final double? topwidth;
  final double? botomwidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  final bool? isnumber;
  final double? borderraduius;

  GenaricTextField(
      {Key? key,
      @required this.controller,
      @required this.line,
      @required this.topwidth,
      @required this.botomwidth,
      this.prefixIcon,
      this.hint,
      this.borderraduius = 30,
      this.isnumber,
      this.suffixIcon})
      : super(key: key);

  @override
  _GenaricTextFieldState createState() => _GenaricTextFieldState();
}

class _GenaricTextFieldState extends State<GenaricTextField> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.line,
      textInputAction: TextInputAction.done,
      keyboardType: widget.isnumber == true ? TextInputType.number : null,
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(fontSize: 10),
          border: InputBorder.none,
          focusColor: Colors.black26,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(widget.borderraduius!)),
          contentPadding: EdgeInsets.only(
              left: width / 20,
              right: width / 20,
              top: widget.topwidth!,
              bottom: widget.botomwidth!),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.circular(widget.borderraduius!)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.circular(widget.borderraduius!))),
      style: TextStyle(color: Colors.black, fontSize: 14),
    );
  }
}
