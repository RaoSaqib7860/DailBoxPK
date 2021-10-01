import 'package:dail_box/AppUtils.dart/SizedConfig.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class IntroOne extends StatefulWidget {
  const IntroOne({Key? key}) : super(key: key);

  @override
  _IntroOneState createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
  List list = [
    'new p1.jpg',
    'new p2.jpg',
    'new p3.jpg',
    'new p4.jpg',
    'new p5.jpg',
    'new p6.jpg',
    'new p7.jpg',
    'new p8.jpg',
    'p9.jpeg',
    'p10.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.030),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 45,
                ),
              ),
              SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      child: Image.asset(
                        'assets/images/${list[index]}',
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(color: Colors.white),
                    );
                  }, childCount: list.length))
            ],
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
        ),
        Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.030),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2,
                width: width * 0.2,
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'Search for anything, anywhere in Pakistan'.tr,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              
              SizedBox(
                height: 15,
              ),
              Container(
                height: 2,
                width: width * 0.2,
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}
