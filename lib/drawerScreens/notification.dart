import 'package:dail_box/util/colors.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                Text('Notifications',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),),
                IconButton(
                  icon: Icon(Icons.notifications,color: Colors.white,size: 30,),
                  onPressed: (){},
                ),
              ],),
          ),
                      Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext ctxt, int index){

                  return Container(

                    margin: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black
                          ),
                          padding: EdgeInsets.all(20),
                          child: Text('PP',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                             Row(
                               children: <Widget>[
                                 Expanded(
                                   child: Text('We\'re never more than 5 minutes away with pick-up stations closer from and to your home, office or anywhere in between.',
                                     maxLines: 3,
                                     style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 13,),),
                                 ),
                                 Image(image: AssetImage('assets/icons/more_vertical.png'),color: Colors.black,height: 20,width: 20,)
                               ],
                               crossAxisAlignment: CrossAxisAlignment.start,
                             ),
                              SizedBox(height: 10,),
                              Text('15 June at 02:05 am',style: TextStyle(color: greyColor,fontSize: 11),),
                              SizedBox(height: 5,),
                              Container(
                                color: greyColor,
                                height: 1,
                                width: MediaQuery.of(context).size.width-20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );

                },


              ),
            )
        ],
      ),
    );
  }
}
