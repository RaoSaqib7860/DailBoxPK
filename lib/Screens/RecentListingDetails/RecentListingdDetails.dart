import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/AppUtils.dart/SnackBarUtils.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingsController.dart';
import 'package:dail_box/Screens/SearchDetail/SearchDetails.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecentListingsDetails extends StatefulWidget {
  final String? id;
  final String? businessId;

  const RecentListingsDetails({Key? key, this.id, this.businessId})
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
    controller.getLocationData();
    await ApiUtilsForAll.getgetlisting(controller, widget.id!);
    await ApiUtilsForAll.getgetlistingproduct(controller, widget.businessId!);
    await ApiUtilsForAll.getgetlistingservices(controller, widget.businessId!);
    await ApiUtilsForAll.getgetlistingrating(
        id: widget.businessId, controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
        child: Scaffold(
          appBar: appBarGlobal('Recent listings'),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      'Message',
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
                                    'Rate this Business',
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
                                      'Address',
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
                                  children: [
                                    Text('Social media',
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
                                  'Business Description',
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
                                  'Popular products',
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
                                  'Popular Services',
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Center(
                                child: Text(
                                  '${controller.listofrecentListings[0]['business_name']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  width: width,
                                  height: height * 0.2,
                                  child: CachedNetworkImage(
                                    width: width,
                                    height: height * 0.2,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        'https://dailboxx.websitescare.com/upload/listing/${controller.listofrecentListings[0]['listing_image']}',
                                    placeholder: (context, url) =>
                                        SpinKitSquareCircle(
                                      color: Colors.blue,
                                      size: 20.0,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Text(
                                '${controller.listofrecentListings[0]['area']} ${controller.listofrecentListings[0]['business_address']} ${controller.listofrecentListings[0]['city']}',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.010,
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
                                      children: [
                                        Text(
                                          '${controller.listgetlistingrating[0]['rating']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black26),
                                        ),
                                        SizedBox(
                                          width: width * 0.010,
                                        ),
                                        Row(
                                          children: [1, 2, 3, 4, 5].map((e) {
                                            int value = double.parse(
                                                    '${controller.listgetlistingrating[0]['rating'] ?? '0.0'}')
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
                                        launchURL(
                                            "tel://${controller.listofrecentListings[0]['cell_number']}");
                                      },
                                    ),
                                    InkWell(
                                      onTap: () {
                                        launchURL(
                                            "whatsapp://send?phone=${controller.listofrecentListings[0]['whatsapp_number']}");
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
                                    buildIcon(icon: Icons.location_on_outlined),
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
                              '${controller.listofrecentListings[0]['user_id']}' ==
                                      storage.read('userId')
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
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
                                            'Message',
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
                              Container(
                                height: 2,
                                width: width,
                                color: Colors.black12,
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              InkWell(
                                onTap: () {
                                  ratingDailog(
                                      listing_id:
                                          '${controller.listofrecentListings[0]['id']}',
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
                                      'Rate this Business',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(color: blueColor),
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
                                    'Address',
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
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: height * 0.2,
                                  width: width,
                                  child: GoogleMap(
                                    zoomControlsEnabled: false,
                                    zoomGesturesEnabled: false,
                                    mapType: MapType.normal,
                                    myLocationButtonEnabled: false,
                                    myLocationEnabled: false,
                                    markers: controller.marker,
                                    initialCameraPosition:
                                        controller.kGooglePlex.value,
                                    onMapCreated: (GoogleMapController c) {},
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
                                  title: 'Hours & Services may differ'),
                              rowView(
                                icon: Icons.access_time,
                                title: 'Monday - Saturday',
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Text(
                                '${controller.listofrecentListings[0]['timings']}',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.black26),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Container(
                                height: 0.5,
                                width: width,
                                color: Colors.black38,
                              ),
                              rowView(
                                icon: Icons.call,
                                title:
                                    '${controller.listofrecentListings[0]['cell_number']}',
                              ),
                              rowView(
                                icon: Icons.mail_outline,
                                title:
                                    'Business Email : ${controller.listofrecentListings[0]['business_email']}',
                              ),
                              rowView(
                                icon: Icons.design_services,
                                title:
                                    'Service Area : ${controller.listofrecentListings[0]['area']}',
                              ),
                              rowView(
                                icon: Icons.person_add,
                                title:
                                    'Number of Employees : ${controller.listofrecentListings[0]['num_employees']}',
                              ),
                              SizedBox(
                                height: height * 0.030,
                              ),
                              Row(
                                children: [
                                  Text('Social media',
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
                                      InkWell(
                                        child: Card(
                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
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
                                      InkWell(
                                        onTap: () {
                                          launchURL(
                                              '${controller.listofrecentListings[0]['facebook']}');
                                        },
                                        child: Card(
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
                                      ),
                                      SizedBox(
                                        width: width * 0.010,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          launchURL(
                                              '${controller.listofrecentListings[0]['twitter']}');
                                        },
                                        child: Card(
                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image(
                                              height: height / 30,
                                              image: AssetImage(
                                                  'assets/icons/twitter.png'),
                                            ),
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
                                'Business Description',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Products',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              controller.listoflistingsProduct.isEmpty
                                  ? SizedBox()
                                  : Container(
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: CachedNetworkImage(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          "https://dailboxx.websitescare.com/upload/products/${controller.listoflistingsProduct[i]['pimage1']}",
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
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
                                                              width:
                                                                  width * 0.02,
                                                            ),
                                                            Text(
                                                              '${controller.listoflistingsProduct[i]['pprice']}',
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                1,
                                                                2,
                                                                3,
                                                                4,
                                                                5
                                                              ].map((e) {
                                                                return Icon(
                                                                  Icons.star,
                                                                  size: 10,
                                                                  color: Colors
                                                                          .yellow[
                                                                      700],
                                                                );
                                                              }).toList(),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.020,
                                                            ),
                                                            Text(
                                                              '(${double.parse('${controller.listoflistingsProduct[i]['total_review']}').toString()})',
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Services',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                            '${controller.listofProductServices[index]['s_cost']}',
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
                                          Row(
                                            children: [1, 2, 3, 4, 5].map((e) {
                                              return Icon(
                                                Icons.star,
                                                size: 10,
                                                color: Colors.yellow[700],
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                          Text(
                                            // '(${int.parse('${controller.listoflistingsProduct[i]['total_review']}').toDouble().toString()})',
                                            double.parse(
                                                    '${controller.listofProductServices[index]['rating'] ?? '0.0'}')
                                                .toString(),
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      )
                                    ],
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

  Widget rowView({String? title, IconData? icon}) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.015,
        ),
        Row(
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
            Text(
              title!,
              style: TextStyle(fontSize: 14, color: Colors.black38),
            )
          ],
        ),
        SizedBox(
          height: height * 0.020,
        ),
        Container(
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
                    'Send Message',
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
                            hintText: "Enter message here"),
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
                          ApiUtilsForAll.getmessage(
                              bussinies_id: '$bussinies_id',
                              from_msg: storage.read('userId'),
                              to_msg: '$to_msg',
                              massages: textCon.text);
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                          snackBarFailer('Please type message to receiver');
                        }
                      },
                      child: Container(
                        height: height * 0.055,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            'SEND',
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
