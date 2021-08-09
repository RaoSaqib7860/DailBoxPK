import 'package:dail_box/AppUtils.dart/ApiUtilsForAll.dart';
import 'package:dail_box/AppUtils.dart/AppBarGlobal.dart';
import 'package:dail_box/Screens/SearchPage/SearchController.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    return LayoutBuilder(builder: (context, size) {
      var height = size.maxHeight;
      var width = size.maxWidth;
      return SafeArea(
          child: Scaffold(
        appBar: appBarGlobal('Search'),
        body: Column(
          children: [
            Padding(
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
                    controller: controller.searchCon,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      if (value.length > 3) {
                        ApiUtilsForAll.getsearchhome(controller);
                      }
                    },
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
                        hintStyle: TextStyle(color: greyColor, fontSize: 12),
                        hintText: "Search service or industry"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.030,
            ),
            Obx(
              () => Expanded(
                  child: ListView.builder(
                itemBuilder: (c, i) {
                  Map map = controller.listofSearch[i];
                  return Padding(
                    padding: EdgeInsets.only(top: height * 0.010),
                    child: ListTile(
                      leading: Container(
                          height: height * 0.090,
                          width: width * 0.180,
                          child: Image.asset('assets/images/nature.jpg',fit: BoxFit.cover,)),
                      title: Text(
                        map.containsKey('s_name')
                            ? '${controller.listofSearch[i]['s_name']}'
                            : '${controller.listofSearch[i]['pname']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        map.containsKey('s_name')
                            ? '${controller.listofSearch[i]['s_details']}'
                            : '${controller.listofSearch[i]['p_details']}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                },
                itemCount: controller.listofSearch.length,
              )),
            )
          ],
        ),
      ));
    });
  }
}
