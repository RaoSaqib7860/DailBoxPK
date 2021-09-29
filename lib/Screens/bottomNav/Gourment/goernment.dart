import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/Screens/bottomNav/Gourment/GovernmentController.dart';
import 'package:dail_box/main.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Government extends StatefulWidget {
  @override
  _GovernmentState createState() => _GovernmentState();
}

class _GovernmentState extends State<Government> {
  final controller = Get.put(GovernmentController());

  @override
  void initState() {
    ApiUtils.getgetgovdept(controller: controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Government Directory'.tr,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: blueColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.030),
        child: Column(
          children: <Widget>[
            Obx(
              () => Expanded(
                child: !controller.loading.value
                    ? Center(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : controller.listGovernment.isEmpty
                        ? Center(
                            child: Text('Empty'.tr),
                          )
                        : ListView.separated(
                            itemCount: controller.listGovernment.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${controller.listGovernment[index]['name']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${controller.listGovernment[index]['address']}',
                                            style: TextStyle(
                                                color: greyColor, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(
                                                  builder: (context, setState) {
                                                return AlertDialog(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 1, right: 1),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                          findLanguageController.isEnglishLocale.value?  CrossAxisAlignment
                                                                .start: CrossAxisAlignment.end,
                                                        children: <Widget>[
                                                         findLanguageController.isEnglishLocale.value? Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                'Department Name'
                                                                    .tr,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              IconButton(
                                                                icon: Icon(Icons
                                                                    .clear),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              )
                                                            ],
                                                          ):  Row(
                                                           mainAxisAlignment:
                                                           MainAxisAlignment
                                                               .spaceBetween,
                                                           children: <Widget>[

                                                             IconButton(
                                                               icon: Icon(Icons
                                                                   .clear),
                                                               onPressed: () {
                                                                 Navigator.pop(
                                                                     context);
                                                               },
                                                             ),
                                                             Text(
                                                               'Department Name'
                                                                   .tr,
                                                               style: TextStyle(
                                                                   fontWeight:
                                                                   FontWeight
                                                                       .bold,
                                                                   fontSize:
                                                                   16),
                                                             ),
                                                           ],
                                                         ),
                                                          //SizedBox(height: 10,),
                                                          Text(
                                                            '${controller.listGovernment[index]['name']}',
                                                            style: TextStyle(
                                                                color:
                                                                    greyColor,
                                                                fontSize: 14),
                                                          ),
                                                          Divider(),
                                                          Text(
                                                            'Contact info'.tr,
                                                            textAlign: findLanguageController.isEnglishLocale.value? TextAlign.left:TextAlign.right,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            '${controller.listGovernment[index]['cont_num_a']}',
                                                            style: TextStyle(
                                                                color:
                                                                    greyColor,
                                                                fontSize: 14),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Divider(),
                                                          Text(
                                                            'Department Overview'
                                                                .tr,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            '${controller.listGovernment[index]['b_overview']}',
                                                            style: TextStyle(
                                                                color:
                                                                    greyColor,
                                                                fontSize: 14),
                                                          ),
                                                          Divider(),
                                                          Text(
                                                            'Services'.tr,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            '${controller.listGovernment[index]['s_offered']}',
                                                            style: TextStyle(
                                                                color:
                                                                    greyColor,
                                                                fontSize: 14),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Divider(),
                                                          Text(
                                                            'Timings'.tr,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            '${controller.listGovernment[index]['timing']}',
                                                            style: TextStyle(
                                                                color:
                                                                    greyColor,
                                                                fontSize: 14),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                            });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 10,
                                            bottom: 10),
                                        child: Text(
                                          'View Details'.tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        decoration: BoxDecoration(
                                            color: blueColor,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(10),
                              );
                            },
                            separatorBuilder: (BuildContext ctxt, int index) {
                              return Divider();
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
