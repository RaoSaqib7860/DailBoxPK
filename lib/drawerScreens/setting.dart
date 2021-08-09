import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30,bottom: 20),
            decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Text('Settings',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),),
                IconButton(
                  icon: Icon(Icons.notifications,color: blueColor,size: 30,),
                  onPressed: (){},
                ),
              ],),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:10.0,right: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_outline),
                        SizedBox(width: 10,),
                        Expanded(child: Text('User Display',style: TextStyle(fontSize: 16),)),
                        Icon(Icons.arrow_forward_ios,size: 20,)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 20),
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: greyColorlight,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_outline),
                        SizedBox(width: 10,),
                        Expanded(child: Text('Local Contacts',style: TextStyle(fontSize: 16),)),
                        Icon(Icons.arrow_forward_ios,size: 20,)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 20),
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: greyColorlight,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.settings),
                        SizedBox(width: 10,),
                        Expanded(child: Text('Notifications Settings',style: TextStyle(fontSize: 16),)),
                        Icon(Icons.arrow_forward_ios,size: 20,)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 20),
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: greyColorlight,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_outline),
                        SizedBox(width: 10,),
                        Expanded(child: Text('Autoplay',style: TextStyle(fontSize: 16),)),
                        Icon(Icons.arrow_forward_ios,size: 20,)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 20),
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: greyColorlight,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_outline),
                        SizedBox(width: 10,),
                        Expanded(child: Text('Terms & Conditions',style: TextStyle(fontSize: 16),)),
                        Icon(Icons.arrow_forward_ios,size: 20,)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 20),
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: greyColorlight,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_outline),
                        SizedBox(width: 10,),
                        Expanded(child: Text('Version',style: TextStyle(fontSize: 16),)),
                        Icon(Icons.arrow_forward_ios,size: 20,)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 20),
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: greyColorlight,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_outline),
                        SizedBox(width: 10,),
                        Expanded(child: Text('Privacy Policy',style: TextStyle(fontSize: 16),)),
                        Icon(Icons.arrow_forward_ios,size: 20,)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 20),
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: greyColorlight,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_outline),
                        SizedBox(width: 10,),
                        Expanded(child: Text('Logout',style: TextStyle(fontSize: 16,color: Colors.red),)),

                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 20),
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: greyColorlight,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
