import 'dart:io';
import 'package:dail_box/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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

  @override
  Widget build(BuildContext context) {
    final TextStyle androidStyle = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white);
    final TextStyle iosStyle = const TextStyle(color: Colors.white);
    final style = kIsWeb? androidStyle: Platform.isAndroid ? androidStyle : iosStyle;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: blueColor
//          gradient: LinearGradient(
//            colors: [
//              Theme.of(context).primaryColor,
//              Colors.indigo,
//            ],
//            begin: Alignment.topLeft,
//            end: Alignment.bottomRight,
//          ),
        ),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
               // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
               // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                //  Spacer(),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 24.0, left: 24.0, right: 24.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white,width: 3),
                          // shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://post.healthline.com/wp-content/uploads/2019/01/Male_Doctor_732x549-thumbnail.jpg'
                                 // 'https://www.gravatar.com/avatar/test@test.com.jpg?s=200&d=mm'
                              ))
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 24.0, right: 4.0),
                    child: Text(
                      // tr("name"),
                      'Roger Hoffman',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15.0, left: 24.0, right: 24.0),
                    child: Text(
                      // tr("name"),
                      'San Francisco,CA',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        //fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
//                  Selector<MenuProvider, int>(
//                    selector: (_, provider) => provider.currentPage,
//                    builder: (_, index, __) => Column(
//                      mainAxisSize: MainAxisSize.min,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        ...widget.mainMenu
//                            .map((item) => MenuItemWidget(
//                          key: Key(item.index.toString()),
//                          item: item,
//                          callback: widget.callback,
//                          widthBox: widthBox,
//                          style: style,
//                          selected: index == item.index,
//                        ))
//                            .toList()
//                      ],
//                    ),
//                  ),
                Expanded(child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.mainMenu.length,
                    itemBuilder: (BuildContext ctxt, int index){
                      return  MenuItemWidget(
                        key: Key(widget.mainMenu[index].index.toString()),
                        item: widget.mainMenu[index],
                        callback: widget.callback!,
                        widthBox: widthBox,
                        style: style,
                        selected: false,
                      );
                    }),),
//               Expanded(
//                 child:  ListView(
//                   shrinkWrap: true,
//                   children: <Widget>[
//                     MenuItemWidget(
//                       key: Key(widget.mainMenu[0].index.toString()),
//                       item: widget.mainMenu[0],
//                       callback: widget.callback,
//                       widthBox: widthBox,
//                       style: style,
//                       selected: false,
//                     ),
//                     MenuItemWidget(
//                       key: Key(widget.mainMenu[1].index.toString()),
//                       item: widget.mainMenu[1],
//                       callback: widget.callback,
//                       widthBox: widthBox,
//                       style: style,
//                       selected: false,
//                     ),
//                     MenuItemWidget(
//                       key: Key(widget.mainMenu[2].index.toString()),
//                       item: widget.mainMenu[2],
//                       callback: widget.callback,
//                       widthBox: widthBox,
//                       style: style,
//                       selected: false,
//                     ),
//                     MenuItemWidget(
//                       key: Key(widget.mainMenu[3].index.toString()),
//                       item: widget.mainMenu[3],
//                       callback: widget.callback,
//                       widthBox: widthBox,
//                       style: style,
//                       selected: false,
//                     )
//                   ],
//                 ),
//               ),
                 // Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 24.0),
                    child: OutlineButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.filter_none,size: 16,),
                          SizedBox(width: 5,),
                          Text(
                            "logout",
                            style: TextStyle(fontSize: 14),
                          )
                        ],),
                      borderSide: BorderSide(color: blueColor, width: 2.0),
                      onPressed: () => print("Pressed !"),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                    ),
                  ),
                //  Spacer(),
                ],
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  onPressed: (){
                    ZoomDrawer.of(context)!.toggle();
                  },
                  icon: Icon(Icons.clear,color: Colors.white,size: 30,),
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
      width: MediaQuery.of(context).size.width/2,
      child: FlatButton(
        onPressed: () => callback!(item!.index),
        color: selected! ? Colors.white : null,
        //color: selected ? Color(0x44000000) : null,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              item!.icon,
              color: selected! ? blueColor : white,
              size: 22,
            ),
            widthBox!,
            Expanded(
              child: Text(
                item!.title,
                style: TextStyle( color: selected! ? blueColor : white,fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final int index;

  const MenuItem(this.title, this.icon, this.index);
}