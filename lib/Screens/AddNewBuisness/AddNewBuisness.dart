import 'package:dail_box/Screens/BuisnessRegistration.dart/BuisnessRegistration.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewBuiseness extends StatefulWidget {
  @override
  _AddNewBuisenessState createState() => _AddNewBuisenessState();
}

class _AddNewBuisenessState extends State<AddNewBuiseness> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Add Business'.tr,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          elevation: 0,
          backgroundColor: blueColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: blueColor, borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Register your bussiness with dialbox to gain visibility in the marketplace. Showcase your bussiness information, products + Services helping you increase your revenue by bringing you closer to your potential clients.'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Choose your plan today and \n1st MONTH FREE'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Get.to(BuisnessRegistration());
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Basic Package'.tr,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            '1,000'.tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'PKR'.tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Per Month'.tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 10,
                                    child: Container(
                                      width: 90,
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 8, bottom: 8),
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Text(
                                            '2,500 PKR'.tr,
                                            style: TextStyle(
                                                color: blueColor, fontSize: 11),
                                          ),
                                          Container(
                                            height: 1,
                                            width: 80,
                                            color: blueColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Material(
                            shape: CircleBorder(),
                            elevation: 5,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: blueColor,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 15,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Get.to(BuisnessRegistration());
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Annual Package'.tr,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            '24,000'.tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'PKR'.tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Per Month'.tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 10,
                                    child: Container(
                                      width: 90,
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 8, bottom: 8),
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Text(
                                            '30,000 PKR'.tr,
                                            style: TextStyle(
                                                color: redColor, fontSize: 11),
                                          ),
                                          Container(
                                            height: 1,
                                            width: 80,
                                            color: redColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Material(
                            shape: CircleBorder(),
                            elevation: 5,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: redColor,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 15,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Get.to(BuisnessRegistration());
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Gold Package'.tr,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            '25,000'.tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'PKR'.tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Per Month'.tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 10,
                                    child: Container(
                                      width: 90,
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 8, bottom: 8),
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Text(
                                            '33,000 PKR'.tr,
                                            style: TextStyle(
                                                color: yellowColor,
                                                fontSize: 11),
                                          ),
                                          Container(
                                            height: 1,
                                            width: 80,
                                            color: yellowColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Material(
                            shape: CircleBorder(),
                            elevation: 5,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: yellowColor,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 15,
                              )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'PLANS Benefits'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Basic Pakage'.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'We\'re never more than 5 minutes away with pick-up stations closer from and to your home, office or anywhere in between. Grabbing coffee along your way? Grabbing coffee along your way? Grabbing coffee along your way?'.tr,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Annual Pakage'.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'We\'re never more than 5 minutes away with pick-up stations closer from and to your home, office or anywhere in between. Grabbing coffee along your way? Grabbing coffee along your way? Grabbing coffee along your way?'.tr,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Gold Pakage'.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'We\'re never more than 5 minutes away with pick-up stations closer from and to your home, office or anywhere in between. Grabbing coffee along your way? Grabbing coffee along your way? Grabbing coffee along your way?'.tr,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  } 
}
