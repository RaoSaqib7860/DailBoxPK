import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/LocationData.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistration.dart';
import 'package:dail_box/Screens/ImagePreview/ImagePreview.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingsController.dart';
import 'package:dail_box/Screens/SearchDetail/SearchDetails.dart';
import 'package:dail_box/Screens/ViewAllRating/ViewAllRatings.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share/share.dart';

class RecentListingsDetails extends StatefulWidget {
  final String? id;
  final String? businessId;
  final String? name;

  const RecentListingsDetails({Key? key, this.id, this.businessId, this.name})
      : super(key: key);

  @override
  _RecentListingsDetailsState createState() => _RecentListingsDetailsState();
}

class _RecentListingsDetailsState extends State<RecentListingsDetails> {
  final controller = Get.put(RecentListnigsController());
  GetStorage storage = GetStorage();

  @override
  void initState() {
    getApiData();
    super.initState();
  }

  getApiData() async {
    await ApiUtilsForAll.getgetlisting(controller, widget.id!).then((value) {
      controller.getLocationData();
    });
    await ApiUtilsForAll.getgetlistingproduct(controller, widget.businessId!);
    await ApiUtilsForAll.getgetlistingservices(controller, widget.businessId!);
    await ApiUtilsForAll.getgetlistingrating(
        id: widget.businessId, controller: controller);
    await ApiUtils.getgetFAQ(controller: controller, id: widget.businessId);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: blueColor,
            elevation: 0,
            title: Text(
              '${widget.name}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            actions: [
              Obx(() => controller.listofrecentListings.isEmpty
                  ? SizedBox()
                  : controller.listofrecentListings[0]['user_id'] !=
                          storage.read('userId')
                      ? SizedBox()
                      : InkWell(
                          onTap: () {
                            isEditBusiness = true;
                            Get.to(BuisnessRegistration(
                              currentPackage: 0,
                              mapData: controller.listofrecentListings[0],
                            ));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.030),
                            child: Center(
                              child: Text(
                                'Update'.tr,
                                style: TextStyle(),
                              ),
                            ),
                          ),
                        ))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.030),
            child: CustomScrollView(
              slivers: [
                Obx(
                  () => SliverToBoxAdapter(
                    child: controller.listofrecentListings.isEmpty
                        ? ShimerEffect(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:findLanguageController.isEnglishLocale.value? CrossAxisAlignment.start:CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Center(
                                  child: Text(
                                    '----- -------- -----',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.010,
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      width: width,
                                      height: height * 0.2,
                                      child: Image.asset(
                                        'assets/images/nature.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                SizedBox(
                                  height: height * 0.010,
                                ),
                                Text('---- ---------'),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '-----',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black26),
                                    ),
                                    SizedBox(
                                      width: width * 0.010,
                                    ),
                                    Row(
                                      children: [1, 2, 3, 4, 5].map((e) {
                                        return Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.yellow[700],
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      width: width * 0.010,
                                    ),
                                    Text(
                                      '------',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black26),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Container(
                                  height: 0.5,
                                  width: width,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.025),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: buildIcon(icon: Icons.call),
                                        onTap: () {
                                          // launchURL(
                                          //     "tel://${controller.listofrecentListings[0]['cell_number']}");
                                        },
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // launchURL(
                                          //     "whatsapp://send?phone=${controller.listofrecentListings[0]['whatsapp_number']}");
                                        },
                                        child: Container(
                                          height: height * 0.060,
                                          width: width * 0.120,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              'assets/svg/whatsapp.svg',
                                              color: Colors.green,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: blueColor),
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                      buildIcon(
                                          icon: Icons.location_on_outlined),
                                      Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(math.pi),
                                        child: buildIcon(icon: Icons.reply),
                                      ),
                                      buildIcon(icon: Icons.ad_units_outlined)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Container(
                                  height: 0.5,
                                  width: width,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: height * 0.030,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.030),
                                  height: height * 0.055,
                                  width: width,
                                  child: Center(
                                    child: Text(
                                      'Message'.tr,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(color: blueColor),
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Container(
                                  height: 2,
                                  width: width,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Center(
                                  child: Text(
                                    'Rate this Business'.tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Row(
                                  children: [1, 2, 3, 4, 5].map((e) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: width * 0.020),
                                      child: Icon(Icons.star_border,
                                          color: Colors.black38),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black26)),
                                    );
                                  }).toList(),
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Container(
                                  height: 2,
                                  width: width,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 30,
                                    ),
                                    Text(
                                      'Address'.tr,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.010,
                                ),
                                Container(
                                  child: Container(
                                    height: height * 0.2,
                                    width: width,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey[100],
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Container(
                                  height: 0.5,
                                  width: width,
                                  color: Colors.black38,
                                ),
                                rowView(
                                    icon: Icons.warning_amber_sharp,
                                    title: '-----------------'),
                                rowView(
                                  icon: Icons.access_time,
                                  title: '------------------',
                                ),
                                rowView(
                                  icon: Icons.call,
                                  title: '----------',
                                ),
                                rowView(
                                  icon: Icons.mail_outline,
                                  title: '---------',
                                ),
                                rowView(
                                  icon: Icons.design_services,
                                  title: '---------',
                                ),
                                rowView(
                                  icon: Icons.person_add,
                                  title: '--------------',
                                ),
                                SizedBox(
                                  height: height * 0.030,
                                ),
                                Row(
                                  mainAxisAlignment: findLanguageController.isEnglishLocale.value?MainAxisAlignment.start:MainAxisAlignment.end,
                                  children: [
                                    Text('Social media'.tr,
                                    textAlign:findLanguageController.isEnglishLocale.value?TextAlign.left: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(
                                      width: width * 0.030,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Card(
                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image(
                                              height: height / 30,
                                              image: AssetImage(
                                                  'assets/icons/google.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.010,
                                        ),
                                        Card(
                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image(
                                              height: height / 30,
                                              image: AssetImage(
                                                  'assets/icons/facebook.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.010,
                                        ),
                                        Card(
                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image(
                                              height: height / 30,
                                              image: AssetImage(
                                                  'assets/icons/twitter.png'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.030,
                                ),
                                Container(
                                  height: 0.5,
                                  width: width,
                                  color: Colors.black38,
                                ),
                                rowView(
                                  icon: Icons.language_rounded,
                                  title: '---------------',
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Text(
                                  'Business Description'.tr,
                                  textAlign: findLanguageController.isEnglishLocale.value? TextAlign.left:TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '------------------------',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black38),
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Container(
                                  height: 0.5,
                                  width: width,
                                  color: Colors.black38,
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Text(
                                  'Popular products'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: height * 0.010,
                                ),
                                Container(
                                  height: height * 0.180,
                                  width: width,
                                  child: ListView.builder(
                                    itemBuilder: (c, i) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: width * 0.030),
                                        width: width * 0.360,
                                        height: double.infinity,
                                        child: Card(
                                          elevation: 2,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Image.asset(
                                                  'assets/images/nature.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                child: Text('jsnx'),
                                                padding: EdgeInsets.all(10),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Text(
                                  'Popular Services'.tr,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                              ],
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: findLanguageController.isEnglishLocale.value?CrossAxisAlignment.start :CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${controller.listofrecentListings[0]['industry_name']}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(ImagePreview(
                                      listofImage: [
                                        '${controller.listofrecentListings[0]['listing_image']}',
                                      ],
                                    ));
                                  },
                                  child: Container(
                                    width: width,
                                    height: height * 0.2,
                                    child: CachedNetworkImage(
                                      width: width,
                                      height: height * 0.2,
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          '${controller.listofrecentListings[0]['listing_image']}',
                                      placeholder: (context, url) =>
                                          SpinKitSquareCircle(
                                        color: Colors.blue,
                                        size: 20.0,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.network(
                                              'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${controller.listofrecentListings[0]['business_address']} ${controller.listofrecentListings[0]['area']}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: height * 0.010,
                              // ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       'Business Area : ',
                              //       style: TextStyle(
                              //           color: blueColor, fontSize: 12),
                              //     ),
                              //     Expanded(
                              //       child: Text(
                              //         '${controller.listofrecentListings[0]['area']}',
                              //         style: TextStyle(fontSize: 12),
                              //       ),
                              //     )
                              //   ],
                              // ),

                              SizedBox(
                                height: 5,
                              ),
                             findLanguageController.isEnglishLocale.value?Row(
                                children: [
                                  Text(
                                    'Business City(s) : '.tr,
                                    style: TextStyle(
                                        color: blueColor, fontSize: 12),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${controller.listofrecentListings[0]['city']}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ): Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                
                                  Text(
                                    '${controller.listofrecentListings[0]['city']}:',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                    Text(
                                    'Business City(s) : '.tr.replaceAll(':', ''),
                                    style: TextStyle(
                                        color: blueColor, fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              controller.listgetlistingrating.isEmpty
                                  ? ShimerEffect(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '----',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black26),
                                          ),
                                          SizedBox(
                                            width: width * 0.010,
                                          ),
                                          Row(
                                            children: [1, 2, 3, 4, 5].map((e) {
                                              return InkWell(
                                                child: Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: Colors.yellow[700],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            width: width * 0.010,
                                          ),
                                          Text(
                                            '.....',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black26),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '${controller.listgetlistingrating[0]['rating'] ?? '0.0'}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black26),
                                            ),
                                            SizedBox(
                                              width: width * 0.010,
                                            ),
                                            Row(
                                              children:
                                                  [1, 2, 3, 4, 5].map((e) {
                                                int value = double.parse(
                                                        '${controller.listgetlistingrating[0]['rating'] ?? '0.0'}')
                                                    .toInt();
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
                                            SizedBox(
                                              width: width * 0.010,
                                            ),
                                            Text(
                                              '${controller.listgetlistingrating[0]['reviews']} reviews',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black26),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(ViewAllRatings(
                                              business_id: widget.businessId,
                                            ));
                                          },
                                          child: Text(
                                            'View All'.tr,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: blueColor),
                                          ),
                                        ),
                                      ],
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 0.5,
                                width: width,
                                color: Colors.black12,
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.025),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: buildIcon(icon: Icons.call),
                                      onTap: () {
                                        launchURL(
                                            "tel://${controller.listofrecentListings[0]['cell_number']}");
                                      },
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        launchURL(
                                            "whatsapp://send?phone=${controller.listofrecentListings[0]['cell_number']}");
                                      },
                                      child: Container(
                                        height: height * 0.060,
                                        width: width * 0.120,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/whatsapp.svg',
                                            color: Colors.green,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: blueColor),
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        String url =
                                            'https://www.google.com/maps/dir/?api=1&origin=$lat,$long&destination=${controller.lat},${controller.lng}&travelmode=driving&dir_action=navigate';
                                        launchURL(url);
                                      },
                                      child: buildIcon(
                                          icon: Icons.location_on_outlined),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Share.share(
                                            'https://dialboxx.pk/front/listinginfo/${widget.id}');
                                      },
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(math.pi),
                                        child: buildIcon(icon: Icons.reply),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        launchURL(
                                            "sms:${controller.listofrecentListings[0]['cell_number']}");
                                      },
                                      child: buildIcon(
                                          icon: Icons.ad_units_outlined),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Container(
                                height: 0.5,
                                width: width,
                                color: Colors.black12,
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              '${controller.listofrecentListings[0]['user_id']}' ==
                                      storage.read('userId')
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        print(
                                            '${controller.listofrecentListings[0]['user_id']}');
                                        sendMessage(
                                            to_msg:
                                                '${controller.listofrecentListings[0]['user_id']}',
                                            bussinies_id:
                                                '${controller.listofrecentListings[0]['business_id']}');
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: width * 0.030),
                                        height: height * 0.055,
                                        width: width,
                                        child: Center(
                                          child: Text(
                                            'Message'.tr,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        decoration:
                                            BoxDecoration(color: blueColor),
                                      ),
                                    ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              '${controller.listofrecentListings[0]['user_id']}' ==
                                      storage.read('userId')
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        ratingDailog(
                                            listing_id:
                                                '${controller.listofrecentListings[0]['business_id']}',
                                            businessName:
                                                '${controller.listofrecentListings[0]['business_name']}');
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: width * 0.030),
                                        height: height * 0.055,
                                        width: width,
                                        child: Center(
                                          child: Text(
                                            'Rate this Business'.tr,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        decoration:
                                            BoxDecoration(color: blueColor),
                                      ),
                                    ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Container(
                                height: 2,
                                width: width,
                                color: Colors.black12,
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 30,
                                  ),
                                  Text(
                                    'Address'.tr,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      controller.listofrecentListings[0]
                                                  ['user_id'] ==
                                              storage.read('userId')
                                          ? SizedBox(
                                              height: height * 0.040,
                                              width: width * 0.2,
                                            )
                                          : InkWell(
                                              onTap: () {
                                                report(
                                                    bussinies_id: controller
                                                            .listofrecentListings[
                                                        0]['business_id']);
                                              },
                                              child: Container(
                                                height: height * 0.040,
                                                width: width * 0.2,
                                                decoration: BoxDecoration(
                                                    color: blueColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'Report'.tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ),
                                            )
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.end,
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Container(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: height * 0.250,
                                  width: width,
                                  child: !controller.loadMap.value
                                      ? SizedBox()
                                      : GoogleMap(
                                          zoomControlsEnabled: true,
                                          zoomGesturesEnabled: true,
                                          mapType: MapType.normal,
                                          myLocationButtonEnabled: false, 
                                          myLocationEnabled: false,
                                          markers: controller.marker,
                                          initialCameraPosition:
                                              controller.kGooglePlex.value,
                                          onMapCreated:
                                              (GoogleMapController c) {
                                            controller.mapcontroller.complete();
                                          },
                                        ),
                                ),
                              )),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Container(
                                height: 0.5,
                                width: width,
                                color: Colors.black38,
                              ),
                              rowView(
                                  icon: Icons.warning_amber_sharp,
                                  title: 'Hours & Services may differ'.tr),
                              rowView(
                                icon: Icons.access_time,
                                title: 'Monday - Sunday'.tr,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Column(
                                    children:
                                        '${controller.listofrecentListings[0]['timings']}'
                                            .split('\n')
                                            .map((e) {
                                      String v = e.toString().trim();
                                      if (v.length == 4) {
                                        return SizedBox();
                                      } else {
                                        return Text(
                                          '$e',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black26),
                                        );
                                      }
                                    }).toList(),
                                  )),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 0.5,
                                width: width,
                                color: Colors.black38,
                              ),
                              controller.listofrecentListings[0]
                                              ['cell_number'] ==
                                          '' ||
                                      controller.listofrecentListings[0]
                                              ['cell_number'] ==
                                          null
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        launchURL(
                                            "tel://${controller.listofrecentListings[0]['cell_number']}");
                                      },
                                      child: rowView(
                                        icon: Icons.call,
                                        title:
                                            '${controller.listofrecentListings[0]['cell_number']}',
                                      ),
                                    ),
                              rowView(
                                icon: Icons.perm_identity,
                                title:
                                    'Business ID : ${controller.listofrecentListings[0]['business_id']}',
                              ),
                              controller.listofrecentListings[0]
                                              ['business_email'] ==
                                          '' ||
                                      controller.listofrecentListings[0]
                                              ['business_email'] ==
                                          null
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        launchURL(
                                            'mailto:${controller.listofrecentListings[0]['business_email']}');
                                      },
                                      child: rowView(
                                        icon: Icons.mail_outline,
                                        title:
                                            '${controller.listofrecentListings[0]['business_email']}',
                                      ),
                                    ),
                              controller.listofrecentListings[0]
                                              ['service_areas'] ==
                                          '' ||
                                      controller.listofrecentListings[0]
                                              ['service_areas'] ==
                                          null
                                  ? SizedBox()
                                  : rowView(
                                      icon: Icons.design_services,
                                      title:
                                          'Service Area(s) : ${controller.listofrecentListings[0]['service_areas']}',
                                    ),
                              // rowView(
                              //   icon: Icons.person_add,
                              //   title:
                              //       'Number of Employees : ${controller.listofrecentListings[0]['num_employees']}',
                              // ),
                              controller.listofrecentListings[0]['p_v_store'] ==
                                          '' ||
                                      controller.listofrecentListings[0]
                                              ['p_v_store'] ==
                                          null
                                  ? SizedBox()
                                  : rowView(
                                      icon: Icons.shopping_basket_outlined,
                                      title:
                                          'Physical Location or Virtual : ${controller.listofrecentListings[0]['p_v_store']}',
                                    ),
                              controller.listofrecentListings[0]['booking'] ==
                                          '' ||
                                      controller.listofrecentListings[0]
                                              ['booking'] ==
                                          null
                                  ? SizedBox()
                                  : rowView(
                                      icon: Icons.book,
                                      title:
                                          'Booking Facility : ${controller.listofrecentListings[0]['booking']}',
                                    ),
                              controller.listofrecentListings[0]
                                              ['by_appointment'] ==
                                          '' ||
                                      controller.listofrecentListings[0]
                                              ['by_appointment'] ==
                                          null
                                  ? SizedBox()
                                  : rowView(
                                      icon: Icons.apps_outlined,
                                      title:
                                          'By Appointment : ${controller.listofrecentListings[0]['by_appointment']}',
                                    ),
                              controller.listofrecentListings[0]['pick_up'] ==
                                          '' ||
                                      controller.listofrecentListings[0]
                                              ['pick_up'] ==
                                          null
                                  ? SizedBox()
                                  : rowView(
                                      icon: Icons.directions_walk,
                                      title:
                                          'Takeaway : ${controller.listofrecentListings[0]['pick_up']}',
                                    ),
                              controller.listofrecentListings[0]
                                              ['delivery_available'] ==
                                          '' ||
                                      controller.listofrecentListings[0]
                                              ['delivery_available'] ==
                                          null
                                  ? SizedBox()
                                  : rowView(
                                      icon: Icons.delivery_dining,
                                      title:
                                          'Delivery : ${controller.listofrecentListings[0]['delivery_available']}',
                                    ),
                              controller.listofrecentListings[0]
                                              ['payment_mod'] ==
                                          '' ||
                                      controller.listofrecentListings[0]
                                              ['payment_mod'] ==
                                          null
                                  ? SizedBox()
                                  : rowView(
                                      icon: Icons.payment_outlined,
                                      title:
                                          'Mode of Payment :  ${controller.listofrecentListings[0]['payment_mod']}',
                                    ),
                              SizedBox(
                                height: height * 0.030,
                              ),
                             findLanguageController.isEnglishLocale.value? Row(  
                                children: [
                                  Text('Social Media'.tr,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    width: width * 0.030,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      controller.listofrecentListings[0]
                                                  ['insta']
                                              .toString()
                                              .trim()
                                              .isEmpty
                                          ? SizedBox()
                                          : InkWell(
                                              child: Card(
                                                elevation: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image(
                                                    height: height / 30,
                                                    image: AssetImage(
                                                        'assets/icons/insta.png'),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                launchURL(
                                                    '${controller.listofrecentListings[0]['insta']}');
                                              },
                                            ),
                                      SizedBox(
                                        width: width * 0.010,
                                      ),
                                      controller.listofrecentListings[0]
                                                  ['facebook']
                                              .toString()
                                              .trim()
                                              .isEmpty
                                          ? SizedBox()
                                          : InkWell(
                                              onTap: () {
                                                launchURL(
                                                    '${controller.listofrecentListings[0]['facebook']}');
                                              },
                                              child: Card(
                                                elevation: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image(
                                                    height: height / 30,
                                                    image: AssetImage(
                                                        'assets/icons/facebook.png'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                      SizedBox(
                                        width: width * 0.010,
                                      ),
                                      controller.listofrecentListings[0]
                                                  ['youtube']
                                              .toString()
                                              .trim()
                                              .isEmpty
                                          ? SizedBox()
                                          : InkWell(
                                              onTap: () {
                                                launchURL(
                                                    '${controller.listofrecentListings[0]['youtube']}');
                                              },
                                              child: Card(
                                                elevation: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image(
                                                    height: height / 30,
                                                    image: AssetImage(
                                                        'assets/images/youtube.png'),
                                                  ),
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                ],
                              ): Row(  
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                 
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      controller.listofrecentListings[0]
                                                  ['insta']
                                              .toString()
                                              .trim()
                                              .isEmpty
                                          ? SizedBox()
                                          : InkWell(
                                              child: Card(
                                                elevation: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image(
                                                    height: height / 30,
                                                    image: AssetImage(
                                                        'assets/icons/insta.png'),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                launchURL(
                                                    '${controller.listofrecentListings[0]['insta']}');
                                              },
                                            ),
                                      SizedBox(
                                        width: width * 0.010,
                                      ),
                                      controller.listofrecentListings[0]
                                                  ['facebook']
                                              .toString()
                                              .trim()
                                              .isEmpty
                                          ? SizedBox()
                                          : InkWell(
                                              onTap: () {
                                                launchURL(
                                                    '${controller.listofrecentListings[0]['facebook']}');
                                              },
                                              child: Card(
                                                elevation: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image(
                                                    height: height / 30,
                                                    image: AssetImage(
                                                        'assets/icons/facebook.png'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                      SizedBox(
                                        width: width * 0.010,
                                      ),
                                      controller.listofrecentListings[0]
                                                  ['youtube']
                                              .toString()
                                              .trim()
                                              .isEmpty
                                          ? SizedBox()
                                          : InkWell(
                                              onTap: () {
                                                launchURL(
                                                    '${controller.listofrecentListings[0]['youtube']}');
                                              },
                                              child: Card(
                                                elevation: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image(
                                                    height: height / 30,
                                                    image: AssetImage(
                                                        'assets/images/youtube.png'),
                                                  ),
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                   SizedBox(
                                    width: width * 0.030,
                                  ),
                                  Text('Social Media'.tr,
                                  textAlign:TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.030,
                              ),
                              Container(
                                height: 0.5,
                                width: width,
                                color: Colors.black38,
                              ),
                              InkWell(
                                onTap: () {
                                  launchURL(
                                      "${controller.listofrecentListings[0]['web_url']}");
                                },
                                child: rowView(
                                  icon: Icons.language_rounded,
                                  title:
                                      '${controller.listofrecentListings[0]['web_url']}',
                                ),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Text(
                                'Business Description'.tr,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.003,
                              ),
                              Text(
                                '${controller.listofrecentListings[0]['business_description']}',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black38),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Container(
                                height: 0.5,
                                width: width,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Row(
                                mainAxisAlignment: findLanguageController.isEnglishLocale.value?MainAxisAlignment.start:MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'FAQs'.tr,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  findLanguageController.isEnglishLocale.value?SizedBox():SizedBox(width: 10,),

                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Column(
                                children: controller.listofFaq.map((element) {
                                  int index =
                                      controller.listofFaq.indexOf(element);
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                '${element['faq_q']}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: blueColor),
                                              ),
                                              width: width,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 5,
                                          // ),
                                          // InkWell(
                                          //   child: Icon(
                                          //     Icons.edit,
                                          //     color: Colors.black45,
                                          //   ),
                                          //   onTap: () {
                                          //     editFAQ(
                                          //         mapdate: element,
                                          //         index: index);
                                          //   },
                                          // ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          controller.listofrecentListings[0]
                                                      ['user_id'] !=
                                                  storage.read('userId')
                                              ? SizedBox()
                                              : InkWell(
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                  onTap: () {
                                                    ApiUtils.getremoveFAQ(
                                                            controller:
                                                                controller,
                                                            index: index,
                                                            b_id: widget
                                                                .businessId,
                                                            faq_id:
                                                                '${element['id']}')
                                                        .then((value) {
                                                      setState(() {});
                                                    });
                                                  },
                                                )
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                      Container(
                                        child: Text(
                                          '${element['faq_a']} ',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        width: width,
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Row(
                                mainAxisAlignment: findLanguageController.isEnglishLocale.value?MainAxisAlignment.start:MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Products'.tr,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  findLanguageController.isEnglishLocale.value?SizedBox():SizedBox(width: 10,),
                                ],
                              ),
                              controller.listoflistingsProduct.isEmpty
                                  ? SizedBox()
                                  : Container(
                                      height: height * 0.2,
                                      width: width,
                                      child: ListView.builder(
                                        itemBuilder: (c, i) {
                                          return InkWell(
                                            onTap: () {
                                              print(
                                                  '${controller.lat} ${controller.lng}');
                                              Get.to(SearchDetails(
                                                buisinessId: controller
                                                        .listoflistingsProduct[
                                                    i]['product_id'],
                                                fromApi: 'product',
                                                b_ID: controller
                                                        .listoflistingsProduct[
                                                    i]['b_id'],
                                                name:
                                                    '${controller.listoflistingsProduct[i]['pname']}',
                                              ));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: width * 0.030),
                                              width: width * 0.450,
                                              height: double.infinity,
                                              child: Card(
                                                elevation: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: CachedNetworkImage(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            "${controller.listoflistingsProduct[i]['image_1'] ?? controller.listoflistingsProduct[i]['image_2'] ?? controller.listoflistingsProduct[i]['image_3']}",
                                                        placeholder: (context,
                                                                url) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.network(
                                                                'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: width,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  width * 0.010,
                                                              vertical: 5),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${controller.listoflistingsProduct[i]['pname']}',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Rs :',
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Colors
                                                                        .black26),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                '${controller.listoflistingsProduct[i]['pprice']}/-',
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    color: Colors
                                                                        .blue),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '${controller.listoflistingsProduct[i]['rating'] ?? '0.0'}  ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .black26),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  1,
                                                                  2,
                                                                  3,
                                                                  4,
                                                                  5
                                                                ].map((e) {
                                                                  int value = double
                                                                          .parse(
                                                                              '${controller.listoflistingsProduct[i]['rating'] ?? '0.0'}')
                                                                      .toInt();
                                                                  return value >=
                                                                          e
                                                                      ? InkWell(
                                                                          child:
                                                                              Icon(
                                                                            Icons.star,
                                                                            size:
                                                                                12,
                                                                            color:
                                                                                Colors.yellow[700],
                                                                          ),
                                                                        )
                                                                      : InkWell(
                                                                          child:
                                                                              Icon(
                                                                            Icons.star_border,
                                                                            size:
                                                                                12,
                                                                            color:
                                                                                Colors.yellow[700],
                                                                          ),
                                                                        );
                                                                }).toList(),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.020,
                                                              ),
                                                              Text(
                                                                '${double.parse('${controller.listoflistingsProduct[i]['total_review']}').toInt().toString()} reviews',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: controller
                                            .listoflistingsProduct.length,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Row(
                                mainAxisAlignment: findLanguageController.isEnglishLocale.value?MainAxisAlignment.start:MainAxisAlignment.end,

                                children: [
                                  Text(
                                    'Services'.tr,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  findLanguageController.isEnglishLocale.value?SizedBox():SizedBox(width: 10,),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                            ],
                          ),
                  ),
                ),
                Obx(
                  () => controller.listofProductServices.isEmpty
                      ? SliverToBoxAdapter()
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(SearchDetails(
                                    buisinessId:
                                        controller.listofProductServices[index]
                                            ['service_id'],
                                    fromApi: 'service',
                                    b_ID: controller
                                        .listofProductServices[index]['b_id'],
                                    name:
                                        '${controller.listofProductServices[index]['s_name']}',
                                  ));
                                },
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.listofProductServices[index]['s_name']}',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: height * 0.0050,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Rs :',
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.black26),
                                            ),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Text(
                                              '${controller.listofProductServices[index]['s_cost']}/-',
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.0050,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${controller.listofProductServices[index]['rating'] ?? '0.0'}  ',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black26),
                                            ),
                                            Row(
                                              children:
                                                  [1, 2, 3, 4, 5].map((e) {
                                                int value = double.parse(
                                                        '${controller.listofProductServices[index]['rating'] ?? '0.0'}')
                                                    .toInt();
                                                return value >= e
                                                    ? InkWell(
                                                        child: Icon(
                                                          Icons.star,
                                                          size: 12,
                                                          color: Colors
                                                              .yellow[700],
                                                        ),
                                                      )
                                                    : InkWell(
                                                        child: Icon(
                                                          Icons.star_border,
                                                          size: 12,
                                                          color: Colors
                                                              .yellow[700],
                                                        ),
                                                      );
                                              }).toList(),
                                            ),
                                            SizedBox(
                                              width: width * 0.020,
                                            ),
                                            Text(
                                              double.parse(
                                                          '${controller.listofProductServices[index]['total_review'] ?? '0.0'}')
                                                      .toInt()
                                                      .toString() +
                                                  ' reviews',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: controller.listofProductServices.length,
                          ),
                        ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.020,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                                mainAxisAlignment: findLanguageController.isEnglishLocale.value?MainAxisAlignment.start:MainAxisAlignment.end,
                        children: [
                          Text(
                            'Categories'.tr,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => controller.listofrecentListings.isEmpty
                      ? SliverToBoxAdapter()
                      : gridData(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.030,
                  ),
                )
              ],
              physics: BouncingScrollPhysics(),
            ),
          ),
        ),
      );
    });
  }

  Widget gridData() {
    List list = controller.listofrecentListings[0]['industry_sub_name'] ?? [];
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1.250, mainAxisSpacing: 8),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Column(
            crossAxisAlignment: findLanguageController.isEnglishLocale.value? CrossAxisAlignment.start:CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.blueGrey[100]),
                child: Text(
                  "${list[index]['main_cat_name']}",
                  style: TextStyle(fontSize: 9),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                width: width * 0.150,
              )
            ],
          );
        }, childCount: list.length));
  }

  Widget rowView({String? title, IconData? icon}) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.015,
        ),
        findLanguageController.isEnglishLocale.value
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon!,
                    color: Colors.black38,
                    size: 20,
                  ),
                  SizedBox(
                    width: width * 0.030,
                  ),
                  Expanded(
                    child: Text(
                      title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(fontSize: 13, color: Colors.black38),
                    ),
                  )
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 
                  Expanded(
                    child: Text(
                      title!,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(fontSize: 13, color: Colors.black38),
                    ),
                  ),
                   SizedBox(
                    width: width * 0.030,
                  ),
                  Icon(
                    icon!,
                    color: Colors.black38,
                    size: 20,
                  ),
                ],
              ),
        SizedBox(
          height: height * 0.020,
        ),
        title == 'Monday - Sunday'.tr
            ? SizedBox()
            : Container(
                height: 0.5,
                width: width,
                color: Colors.black38,
              ),
      ],
    );
  }

  buildIcon({IconData? icon}) {
    return Container(
      height: height * 0.060,
      width: width * 0.120,
      child: Icon(
        icon,
        color: blueColor,
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: blueColor),
          shape: BoxShape.circle),
    );
  }

  editFAQ({String? mapdate, int? index}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController textCon = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width / 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: height / 2.50,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    'Edit'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400]!,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        controller: textCon,
                        textInputAction: TextInputAction.done,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle:
                                TextStyle(color: greyColor, fontSize: 12),
                            hintText: "Enter message here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400]!,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        controller: textCon,
                        textInputAction: TextInputAction.done,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle:
                                TextStyle(color: greyColor, fontSize: 12),
                            hintText: "Enter message here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // if (textCon.text.isNotEmpty) {
                        //   ApiUtilsForAll.getmessage(
                        //       bussinies_id: '$bussinies_id',
                        //       from_msg: storage.read('userId'),
                        //       to_msg: '$to_msg',
                        //       massages: textCon.text);
                        //   Navigator.of(context).pop();
                        // } else {
                        //   Navigator.of(context).pop();
                        //   snackBarFailer('Please type message to receiver');
                        // }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            'Update'.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        });
  }

  sendMessage({String? bussinies_id, String? to_msg}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController textCon = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width / 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: height / 2.50,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    'Send Message'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400]!,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        maxLines: 6,
                        keyboardType: TextInputType.text,
                        controller: textCon,
                        textInputAction: TextInputAction.done,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle:
                                TextStyle(color: greyColor, fontSize: 12),
                            hintText: "Enter message here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        print('$bussinies_id');
                        if (textCon.text.isNotEmpty) {
                          ApiUtilsForAll.getmessage(
                              bussinies_id: '$bussinies_id',
                              from_msg: storage.read('userId'),
                              to_msg: '$to_msg',
                              massages: textCon.text);
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                          snackBarFailer('Please type message'.tr);
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            'SEND'.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        });
  }

  report({String? bussinies_id}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController textCon = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width / 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: height / 2.50,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.030),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    'Send Report'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400]!,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        maxLines: 6,
                        keyboardType: TextInputType.text,
                        controller: textCon,
                        textInputAction: TextInputAction.done,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle:
                                TextStyle(color: greyColor, fontSize: 12),
                            hintText: "Enter message here".tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (textCon.text.isNotEmpty) {
                          ApiUtils.getreportListing(
                              b_id: bussinies_id, message: textCon.text);
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                          snackBarFailer('Please enter report!'.tr);
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            'Report'.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        });
  }

  ratingDailog({String? listing_id, String? businessName}) {
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
                                  Navigator.of(context).pop();
                                  ApiUtilsForAll.getgivelistingrate(
                                      listing_id: '$listing_id',
                                      business_name: '$businessName',
                                      rating_points: '$rating',
                                      rating_review: tecCon.text);
                                } else {
                                  Navigator.of(context).pop();
                                  snackBarFailer('Please enter review!'.tr);
                                }
                              } else {
                                Navigator.of(context).pop();
                                snackBarFailer('Please select rating!'.tr);
                              }
                            },
                            child: Container(
                              height: height * 0.045,
                              width: width * 0.3,
                              child: Center(
                                child: Text(
                                  'Rate'.tr,
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
