import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/Screens/HomeScreen/home_screen.dart';
import 'package:dail_box/Screens/IndustryDetails/IndustryDetails.dart';
import 'package:dail_box/Screens/RecentListingDetails/RecentListingdDetails.dart';
import 'package:dail_box/Screens/SearchPage/SearchPage.dart';
import 'package:dail_box/Screens/bottomNav/Home/HomeController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

callHome(){
  Get.to(HomeScreen());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    ApiUtilsForAll.getgethomecats(controller);
    ApiUtilsForAll.gethomeproducts(controller);
    ApiUtilsForAll.getwhatstrading(controller);
    ApiUtilsForAll.gethomebanner(controller);
    ApiUtilsForAll.getmostrecentlisting(controller);
    super.initState();
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
              title: Container(
                child: Image.asset(
                  'assets/icons/logo.png',
                  height: height * 0.055,
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
            body: Obx(
              () => Column(
                children: [
                  InkWell(
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: SearchPage(),
                        withNavBar: false,
                        // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
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
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintStyle:
                                    TextStyle(color: greyColor, fontSize: 12),
                                hintText: "Search service or industry"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Most Popular',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'View All>',
                                  style:
                                      TextStyle(color: blueColor, fontSize: 12),
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
                                  crossAxisCount: 4, childAspectRatio: 1.250),
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return controller.listgethomecats.contains(1)
                                ? ShimerEffect(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: CachedNetworkImage(
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                "http://via.placeholder.com/350x150",
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),backgroundColor: Colors.white,
                                          radius: height * 0.030,
                                        ),
                                        SizedBox(
                                          height: height * 0.0050,
                                        ),
                                        Text(
                                          '....',
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: [
                                      ZoomIn(
                                        child: CircleAvatar(
                                          child: CachedNetworkImage(
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                "https://dailboxx.websitescare.com/upload/industry/${controller.listgethomecats[index]['image']}",
                                            placeholder: (context, url) =>
                                                SpinKitWave(
                                              color: Colors.blue,
                                              size: 12.0,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),backgroundColor: Colors.white,
                                          radius: height * 0.030,
                                        ),
                                        duration: Duration(milliseconds: 700),
                                      ),
                                      SizedBox(
                                        height: height * 0.0050,
                                      ),
                                      Container(
                                        child: Text(
                                          '${controller.listgethomecats[index]['industry_name']}',
                                          style: TextStyle(fontSize: 9),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                        width: width * 0.150,
                                      )
                                    ],
                                  );
                          }, childCount: controller.listgethomecats.length)),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Whats\'s Trending?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.030),
                          child: ListView.builder(
                            itemBuilder: (c, i) {
                              return controller.listofwhatstrading.contains(1)
                                  ? ShimmerData()
                                  : InkWell(
                                      onTap: () {
                                        Get.to(IndustryDetails(
                                          id: controller.listofwhatstrading[i]
                                              ['id'],
                                        ));
                                      },
                                      child: FadeInRight(
                                        child: CardView(
                                          url:
                                              'https://dailboxx.websitescare.com/upload/industry/${controller.listofwhatstrading[i]['image']}',
                                          text:
                                              '${controller.listofwhatstrading[i]['industry_name']}',
                                        ),
                                      ),
                                    );
                            },
                            itemCount: controller.listofwhatstrading.length,
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
                            autoPlayAnimationDuration: Duration(seconds: 3),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: controller.listofhomebanner.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return !controller.listofhomebanner.contains(1)
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.050),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration:
                                            BoxDecoration(color: Colors.black),
                                        child: Center(
                                          child: Text(
                                            '${i['text']}',
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                    : ShimerEffect(
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            decoration: BoxDecoration(
                                                color: Colors.amber),
                                            child: Center(
                                              child: Text(
                                                '......',
                                                style:
                                                    TextStyle(fontSize: 16.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Most recent listings',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.030),
                          child: ListView.builder(
                            itemBuilder: (c, i) {
                              return controller.listofmostrecentlisting
                                      .contains(1)
                                  ? ShimmerData()
                                  : InkWell(
                                      onTap: () {
                                        Get.to(RecentListingsDetails(
                                          id: controller
                                              .listofmostrecentlisting[i]['id'],
                                        ));
                                      },
                                      child: FadeInRight(
                                        child: CardView(
                                          url:
                                              'https://dailboxx.websitescare.com/upload/listing/${controller.listofmostrecentlisting[i]['listing_image']}',
                                          text:
                                              '${controller.listofmostrecentlisting[i]['business_name']}',
                                        ),
                                      ),
                                    );
                            },
                            itemCount:
                                controller.listofmostrecentlisting.length,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Popular',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.030),
                          child: ListView.builder(
                            itemBuilder: (c, i) {
                              return controller.listofMostPopular.contains(1)
                                  ? ShimmerData()
                                  : FadeInRight(
                                      child: CardView(
                                        url:
                                            'https://dailboxx.websitescare.com/upload/products/${controller.listofMostPopular[i]['pimage1']}',
                                        text:
                                            '${controller.listofMostPopular[i]['pname']}',
                                      ),
                                    );
                            },
                            itemCount: controller.listofMostPopular.length,
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
                  ))
                ],
              ),
            )),
      );
    });
  }
}

class CardView extends StatefulWidget {
  final String? text;
  final String? url;

  const CardView({Key? key, this.text, this.url}) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: width * 0.030, bottom: height * 0.010),
      elevation: 3,
      child: Container(
        width: width * 0.360,
        child: Column(
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
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.010, horizontal: width * 0.010),
              child: Text(
                '${widget.text}',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            )
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
