import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/LocationData.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/Screens/IndustryDetails/IndustryDetails.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingdDetails.dart';
import 'package:dail_box/Screens/SearchDetail/SearchDetails.dart';
import 'package:dail_box/Screens/SearchPage/SearchPage.dart';
import 'package:dail_box/Screens/bottomNav/Home/HomeController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

callHome() async {
  final controller = Get.find<HomeController>();
  controller.loaddata.value = true;
  await controller.getApiData(controller).then((value) {
    controller.loaddata.value = false;
  });
}

Timer? timer;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    getLocation();
    controller.getApiData(controller);
    timer = Timer.periodic(Duration(minutes: 5), (timer) {
      ApiUtilsForAll.getcheckuser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: blueColor,
            elevation: 0,
            title: Container(
              child: Image.asset(
                'assets/icons/logo.png',
                height: height * 0.140,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  ZoomDrawer.of(context)!.toggle();
                },
                icon: Icon(
                  Icons.dehaze,
                  color: Colors.white,
                )),
          ),
          body: Stack(
            children: [
              Obx(
                () => controller.loaddata.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(SearchPage());
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.030),
                                height: height * 0.058,
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
                                  keyboardType: TextInputType.text,
                                  enabled: false,
                                  decoration: new InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: greyColor,
                                      ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 10,
                                          bottom: 11,
                                          top: 10,
                                          right: 10),
                                      hintStyle: TextStyle(
                                          color: greyColor, fontSize: 10),
                                      hintText:
                                          "Search for service, product or business"),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: RefreshIndicator(
                            onRefresh: () async {
                              await controller
                                  .getApiData(controller)
                                  .then((value) {
                                controller.loaddata.value = true;
                                controller.loaddata.value = false;
                              });
                            },
                            child: CustomScrollView(
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Industries',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Text(
                                                'View All ',
                                                style: TextStyle(
                                                    color: blueColor,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                width: width * 0.010,
                                              ),
                                              !controller.isOpenIndustry.value
                                                  ? InkWell(
                                                      onTap: () {
                                                        controller
                                                            .isOpenIndustry
                                                            .value = true;
                                                      },
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .chevron_down_circle_fill,
                                                        color: blueColor,
                                                      ),
                                                    )
                                                  : InkWell(
                                                      onTap: () {
                                                        controller
                                                            .isOpenIndustry
                                                            .value = false;
                                                      },
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .arrow_up_circle_fill,
                                                        color: blueColor,
                                                      ),
                                                    )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: height * 0.010,
                                  ),
                                ),
                                SliverGrid(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            childAspectRatio: 1.250,
                                            mainAxisSpacing: 8),
                                    delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      return controller.listgethomecats
                                              .contains(1)
                                          ? ShimerEffect(
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    child: CachedNetworkImage(
                                                      height: double.infinity,
                                                      fit: BoxFit.fill,
                                                      imageUrl:
                                                          "http://via.placeholder.com/350x150",
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.network(
                                                              'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: height * 0.030,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.0050,
                                                  ),
                                                  Text(
                                                    '....',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  )
                                                ],
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                Get.to(IndustryDetails(
                                                  id: controller
                                                          .listgethomecats[
                                                      index]['id'],
                                                  name:
                                                      '${controller.listgethomecats[index]['industry_name']}',
                                                ));
                                              },
                                              child: Column(
                                                children: [
                                                  ZoomIn(
                                                    child: CircleAvatar(
                                                      child: CachedNetworkImage(
                                                        height: double.infinity,
                                                        fit: BoxFit.fill,
                                                        imageUrl:
                                                            "${controller.listgethomecats[index]['image']}",
                                                        placeholder:
                                                            (context, url) =>
                                                                SpinKitWave(
                                                          color: Colors.blue,
                                                          size: 12.0,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.network(
                                                                'http://dailboxx.websitescare.com/upload/appnoimage.png'),
                                                      ),
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: height * 0.030,
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 700),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.0050,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      '${controller.listgethomecats[index]['industry_name']}',
                                                      style: TextStyle(
                                                          fontSize: 9),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    width: width * 0.150,
                                                  )
                                                ],
                                              ),
                                            );
                                    },
                                        childCount: controller
                                                .isOpenIndustry.value
                                            ? controller.listgethomecats.length
                                            : 8)),
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Trending',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: height * 0.030,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    height: height * 0.180,
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.030),
                                    child: ListView.builder(
                                      itemBuilder: (c, i) {
                                        return controller.listofwhatstrading
                                                .contains(1)
                                            ? ShimmerData()
                                            : InkWell(
                                                onTap: () {
                                                  Get.to(IndustryDetails(
                                                    id: controller
                                                            .listofwhatstrading[
                                                        i]['id'],
                                                    name: controller
                                                            .listofwhatstrading[
                                                        i]['industry_name'],
                                                  ));
                                                },
                                                child: FadeInRight(
                                                  child: CardView(
                                                    url:
                                                        '${controller.listofwhatstrading[i]['image']}',
                                                    text:
                                                        '${controller.listofwhatstrading[i]['industry_name']}',
                                                    iscenter: true,
                                                  ),
                                                ),
                                              );
                                      },
                                      itemCount:
                                          controller.listofwhatstrading.length,
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: height * 0.030,
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      height: height * 0.110,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 1.0,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 7),
                                      autoPlayAnimationDuration:
                                          Duration(seconds: 3),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                    items: controller.listofhomebanner.map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return !controller.listofhomebanner
                                                  .contains(1)
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          width * 0.050),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                                  decoration: BoxDecoration(
                                                      color: Colors.black),
                                                  child: Center(
                                                    child: Text(
                                                      '${i['text']}',
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: Colors.white),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ))
                                              : ShimerEffect(
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.0),
                                                      decoration: BoxDecoration(
                                                          color: Colors.amber),
                                                      child: Center(
                                                        child: Text(
                                                          '......',
                                                          style: TextStyle(
                                                              fontSize: 16.0),
                                                        ),
                                                      )),
                                                );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: height * 0.030,
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Recent Listings',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: height * 0.030,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    height: height * 0.180,
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.030),
                                    child: ListView.builder(
                                      itemBuilder: (c, i) {
                                        return controller
                                                .listofmostrecentlisting
                                                .contains(1)
                                            ? ShimmerData()
                                            : InkWell(
                                                onTap: () {
                                                  Get.to(RecentListingsDetails(
                                                    id: controller
                                                            .listofmostrecentlisting[
                                                        i]['id'],
                                                    businessId: controller
                                                            .listofmostrecentlisting[
                                                        i]['business_id'],
                                                    name: controller
                                                            .listofmostrecentlisting[
                                                        i]['business_name'],
                                                  ));
                                                },
                                                child: FadeInRight(
                                                  child: CardView(
                                                    url:
                                                        '${controller.listofmostrecentlisting[i]['listing_image']}',
                                                    text:
                                                        '${controller.listofmostrecentlisting[i]['business_name']}',
                                                    number: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(Icons.call,
                                                                size: 15,
                                                                color: Colors
                                                                    .black26),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              '${controller.listofmostrecentlisting[i]['cell_number']}',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black26),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                      },
                                      itemCount: controller
                                          .listofmostrecentlisting.length,
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Popular Products',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: height * 0.030,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    height: height * 0.180,
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.030),
                                    child: ListView.builder(
                                      itemBuilder: (c, i) {
                                        return controller.listofMostPopular
                                                .contains(1)
                                            ? ShimmerData()
                                            : FadeInRight(
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(SearchDetails(
                                                      buisinessId: controller
                                                              .listofMostPopular[
                                                          i]['id'],
                                                      b_ID: controller
                                                              .listofMostPopular[
                                                          i]['b_id'],
                                                      fromApi: 'product',
                                                      name:
                                                          '${controller.listofMostPopular[i]['pname']}',
                                                    ));
                                                  },
                                                  child: CardView(
                                                    url:
                                                        '${controller.listofMostPopular[i]['pimage1']}',
                                                    text:
                                                        '${controller.listofMostPopular[i]['pname']}',
                                                    number: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          'price : ${controller.listofMostPopular[i]['pprice']}/-',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: blueColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                      },
                                      itemCount:
                                          controller.listofMostPopular.length,
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Popular Services',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: height * 0.030,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    height: height * 0.090,
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.030),
                                    child: ListView.builder(
                                      itemBuilder: (c, i) {
                                        return controller
                                                .listofMostPopularServices
                                                .contains(1)
                                            ? ShimmerData()
                                            : InkWell(
                                                onTap: () {
                                                  Get.to(SearchDetails(
                                                    buisinessId: controller
                                                            .listofMostPopularServices[
                                                        i]['id'],
                                                    fromApi: 'service',
                                                    b_ID: controller
                                                            .listofMostPopularServices[
                                                        i]['b_id'],
                                                    name:
                                                        '${controller.listofMostPopularServices[i]['s_name']}',
                                                  ));
                                                },
                                                child: Card(
                                                  child: Container(
                                                    width: width * 0.330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      3),
                                                          child: Text(
                                                            '${controller.listofMostPopularServices[i]['s_name']}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      3),
                                                          child: Text(
                                                            'Starting price : ${controller.listofMostPopularServices[i]['s_cost']}/-',
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    blueColor),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                      },
                                      itemCount: controller
                                          .listofMostPopularServices.length,
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: height * 0.030,
                                  ),
                                ),
                              ],
                              physics: BouncingScrollPhysics(),
                            ),
                          ))
                        ],
                      ),
              ),
            ],
          )),
    );
  }
}

class CardView extends StatefulWidget {
  final String? text;
  final String? url;
  final Widget? number;
  final bool? iscenter;

  const CardView(
      {Key? key,
      this.text,
      this.url,
      this.number = const SizedBox(
        height: 5,
      ),
      this.iscenter = false})
      : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: width * 0.030, bottom: height * 0.010),
      child: Container(
        width: width * 0.360,
        child: Column(
          crossAxisAlignment: widget.iscenter!
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                height: double.infinity,
                width: width * 0.360,
                fit: BoxFit.contain,
                imageUrl: '${widget.url}',
                placeholder: (context, url) => SpinKitSquareCircle(
                  color: Colors.blue,
                  size: 20.0,
                ),
                errorWidget: (context, url, error) => Image.network(
                    'http://dailboxx.websitescare.com/upload/appnoimage.png'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '${widget.text}',
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: widget.number!,
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerData extends StatefulWidget {
  const ShimmerData({Key? key}) : super(key: key);

  @override
  _ShimmerDataState createState() => _ShimmerDataState();
}

class _ShimmerDataState extends State<ShimmerData> {
  @override
  Widget build(BuildContext context) {
    return ShimerEffect(
      child: Card(
        margin: EdgeInsets.only(right: width * 0.030, bottom: height * 0.010),
        elevation: 3,
        child: Container(
          width: width * 0.360,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                'assets/images/nature.jpg',
                fit: BoxFit.cover,
              )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.010),
                child: Text('data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
