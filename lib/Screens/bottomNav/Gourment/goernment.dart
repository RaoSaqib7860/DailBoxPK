import 'package:dail_box/AppUtils.dart/APiUtilsForAuth.dart';
import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/Screens/bottomNav/Gourment/GovernmentController.dart';
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Government Directory',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        elevation: 0,
        backgroundColor: blueColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.030),
        child: Column(
          children: <Widget>[
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
                  // controller: controller.nameCon,
                  enabled: false,
                  keyboardType: TextInputType.text,
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
                      hintStyle: TextStyle(color: greyColor, fontSize: 14),
                      hintText: "Search here"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Expanded(
                child: controller.listGovernment.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
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
                                              contentPadding: EdgeInsets.only(
                                                  left: 1, right: 1),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              content: SingleChildScrollView(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.all(15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            'Business Name',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                                Icons.clear),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      //SizedBox(height: 10,),
                                                      Text(
                                                        '${controller.listGovernment[index]['name']}',
                                                        style: TextStyle(
                                                            color: greyColor,
                                                            fontSize: 14),
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        'Contact info',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        '${controller.listGovernment[index]['cont_num_a']}',
                                                        style: TextStyle(
                                                            color: greyColor,
                                                            fontSize: 14),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        'Business Overview',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        '${controller.listGovernment[index]['b_overview']}',
                                                        style: TextStyle(
                                                            color: greyColor,
                                                            fontSize: 14),
                                                      ),

                                                      Divider(),
                                                      Text(
                                                        'Business Offered',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        '${controller.listGovernment[index]['s_offered']}',
                                                        style: TextStyle(
                                                            color: greyColor,
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
                                      'Contact',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    decoration: BoxDecoration(
                                        color: blueColor,
                                        borderRadius: BorderRadius.circular(3)),
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
