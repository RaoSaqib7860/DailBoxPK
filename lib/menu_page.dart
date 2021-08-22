import 'dart:io';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dail_box/Screens/SignIn/sign_in.dart';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuItem> mainMenu;
  final Function(int)? callback;
  final Function()? closeDrawer;
  final int? current;

  MenuScreen(
    this.mainMenu, {
    Key? key,
    this.callback,
    this.current,
    this.closeDrawer,
  });

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final widthBox = SizedBox(
    width: 10.0,
  );
  GetStorage? storage;

  @override
  void initState() {
    storage = GetStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle androidStyle = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white);
    final TextStyle iosStyle = const TextStyle(color: Colors.white);
    final style = kIsWeb
        ? androidStyle
        : Platform.isAndroid
            ? androidStyle
            : iosStyle;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: blueColor),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0, left: 20.0),
                    child: CircularProfileAvatar(
                      'https://www.dailboxx.websitescare.com/upload/profile/${storage!.read('profile_image')}',
                      elevation: 10,
                      radius: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 20.0, right: 4.0),
                    child: Text(
                      '${storage!.read('name')}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.mainMenu.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return MenuItemWidget(
                            key: Key(widget.mainMenu[index].index.toString()),
                            item: widget.mainMenu[index],
                            callback: widget.callback!,
                            widthBox: widthBox,
                            style: style,
                            selected: false,
                          );
                        }),
                  ),
                ],
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  onPressed: () {
                    ZoomDrawer.of(context)!.toggle();
                  },
                  icon: Icon(
                    CupertinoIcons.clear,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem? item;
  final Widget? widthBox;
  final TextStyle? style;
  final Function? callback;
  final bool? selected;

  final white = Colors.white;

  const MenuItemWidget(
      {Key? key,
      this.item,
      this.widthBox,
      this.style,
      this.callback,
      this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: FlatButton(
        onPressed: () => callback!(item!.index),
        color: selected! ? Colors.white : null,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              item!.icon,
              color: item!.iscolor! ? Colors.red : white,
              size: 20,
            ),
            widthBox!,
            Expanded(
              child: Text(
                item!.title!,
                style: TextStyle(
                    color: selected! ? blueColor : white, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String? title;
  final IconData? icon;
  final int? index;
  final bool? iscolor;

  MenuItem({this.title, this.icon, this.index, this.iscolor = false});
}
