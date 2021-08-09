import 'package:dail_box/util/colors.dart';
import 'package:dail_box/widgets/profileitem.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
                  icon: Icon(Icons.clear,color: Colors.white,size: 30,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Text('Profile',style: TextStyle(
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
          Container(
           margin: EdgeInsets.only(top: 80),

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  Container(
                    height: 245,
                    margin: EdgeInsets.only(left: 10,right: 10),

                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 225,
                          margin: EdgeInsets.only(top: 25),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width-20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/nature.jpg')
//                            NetworkImage(
//                                'https://www.kairavashanra.com.au/wp-content/uploads/2015/07/massage-nature-banner-image-01.jpg')
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.white,width: 3),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://post.healthline.com/wp-content/uploads/2019/01/Male_Doctor_732x549-thumbnail.jpg'))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10,),
                        Text('Roger Hoffman',
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: blueColor,
                                      border: Border.all(color: blueColor)
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Image(image: AssetImage('assets/icons/activity.png'),color: Colors.white,height: 25,),
                                ),
                                SizedBox(height: 5,),
                                Text('My Activity',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12
                                  ),)
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: greyColor)
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Image(image: AssetImage('assets/icons/interest.png'),color: greyColor,height: 25,),
                                ),
                                SizedBox(height: 5,),
                                Text('My Interest',style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),)
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: greyColor)
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Image(image: AssetImage('assets/icons/heart.png'),color: greyColor,height: 25,),
                                ),
                                SizedBox(height: 5,),
                                Text('Saved',style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),)
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: greyColor)
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Image(image: AssetImage('assets/icons/more.png'),color: greyColor,height: 25,),
                                ),
                                SizedBox(height: 5,),
                                Text('More',style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Divider(thickness: 10,),
                        Column(
                          children: <Widget>[
                            ProfileItem(),
                            ProfileItem(),
                            ProfileItem(),
                            ProfileItem(),
                            ProfileItem(),
                          ],
                        )
                      ],
                    ),
                  ),

//            Expanded(
//              child: ListView.separated(
//                itemCount: 10,
//                itemBuilder: (BuildContext ctxt, int index){
//
//                  return ChatBoxItem();
//
//                },
//                separatorBuilder:(BuildContext ctxt, int index){
//                  return Divider(thickness: 10,);
//                } ,
//
//              ),
//            )
                ],
              ),
            ),
          )
        ] ,
      ),
    );
  }
}
