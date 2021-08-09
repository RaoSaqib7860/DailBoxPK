import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:dail_box/Screens/IndustryDetails/IndustryDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class IndustryDetails extends StatefulWidget {
  final String? id;

  const IndustryDetails({Key? key, this.id}) : super(key: key);

  @override
  _IndustryDetailsState createState() => _IndustryDetailsState();
}

class _IndustryDetailsState extends State<IndustryDetails> {
  final controller = Get.put(IndustryDetailsController());

  @override
  void initState() {
    ApiUtilsForAll.getgetindustry(controller, widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
        child: Scaffold(
          appBar: appBarGlobal('Industry details'),
          body: Container(
            height: height,
            width: width,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.030,
                  ),
                ),
                Obx(
                  () => controller.listofindustryDetails.isEmpty
                      ? SliverToBoxAdapter(
                          child: Container(
                            height: height - 150,
                            width: width,
                            child: Center(
                              child: Text('Empty'),
                            ),
                          ),
                        )
                      : SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 1.250,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 10),
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return controller.listofindustryDetails.contains(1)
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
                                          ),
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
                                      Expanded(
                                        child: ZoomIn(
                                          child: Container(
                                            child: CachedNetworkImage(
                                              height: double.infinity,
                                              fit: BoxFit.contain,
                                              imageUrl:
                                                  "https://dailboxx.websitescare.com/upload/industry/${controller.listofindustryDetails[index]['icons']}",
                                              placeholder: (context, url) =>
                                                  SpinKitWave(
                                                color: Colors.blue,
                                                size: 15.0,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 700),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.0050,
                                      ),
                                      Container(
                                        child: Text(
                                          '${controller.listofindustryDetails[index]['main_cat_name']}',
                                          style: TextStyle(fontSize: 9),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                        width: width * 0.150,
                                      )
                                    ],
                                  );
                          },
                              childCount:
                                  controller.listofindustryDetails.length)),
                ),
              ],
              physics: BouncingScrollPhysics(),
            ),
          ),
        ),
      );
    });
  }
}
