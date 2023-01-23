import 'dart:ffi';
import 'dart:ui';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../misc/colors.dart';
import '../../misc/event_details.dart';
import '../../misc/event_details_firebase.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text.dart';
import '../../widget/responsive_button.dart';
import 'my_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class detailPage2 extends StatelessWidget {
  String userName;
  String location;
  String description;
  String title;

//Trying only
var thingNeeded=[
  "Help to clear the floods",
  "Help with washing citizen house",
  "Foods",
  "Water supply"];


  detailPage2(
      {Key? key,
      required this.title,
      required this.userName,
      required this.location, 
      required this.description,
      });

  List<String> docIds = [];


  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      SizedBox(
        width: 400,
        child: Image.asset("images/mountain.jpeg"),
      ),
    
      buttonArrow(context),
      scroll(),
    ])));

    //tryDatabase trymain = new tryDatabase();
  }

  buttonArrow(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              clipBehavior: Clip.hardEdge,
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft:const Radius.circular(20),
                    topRight: const Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                controller: scrollController, 
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(height: 5, width: 35, color: Colors.black12)
                          ],
                        ),
                      ),
                      Text(title,
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: AppColors.bigtextColor)),
                      const SizedBox(height: 10),
                      Text(location,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColors.SecondaryText)),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                           const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("images/icon1.jpg"),
                            ),
                         
                          const SizedBox(
                            width: 5,
                          ),
                          Text(userName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: AppColors.mainText)),
                          Spacer(),
                          InkWell(
                              onTap: (){
                              //Google map ridhwan
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>  MyPage()));
                            },
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.primary2,
                              child: Icon(
                                IconData(0xf1ae,fontFamily: 'MaterialIcons'),
                                //Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          
                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children:[ Text("Google Map",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: AppColors.mainText)),]
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Divider(
                          height:4,),
                      ),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox( height:10),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color:AppColors.SecondaryText),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Divider(
                          height:4,),
                      ),
                      Text(
                        "Needs",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height:10),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: thingNeeded.length,
                        itemBuilder: (context, index)=> Needs(context, index)),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Divider(
                          height:4,),
                      ),
                       Text(
                        "Ingredients",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                                            const SizedBox(height:10),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index)=> steps(context, index)),

                        const SizedBox(height:10,),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: 
                        [//+ on ttap
                          AppButtons(isIcon: true,icon: Icons.format_list_bulleted_rounded,size: 40, color: AppColors.mainColor, backgroundColor: AppColors.buttonBackground, borderColor: AppColors.mainColor),
                          const SizedBox(width:3),
                          ResponsiveButton(isResponsive :true),
                          
                        ])
              
                    ]),
              ));
        });
  }

  // thing that we need for the event
  Needs(BuildContext context,index) {
    return Padding(padding: const EdgeInsets.symmetric( vertical: 10), child: Row(children: [
      const CircleAvatar( radius:10, backgroundColor:  Color(0xffe3fff8),
    child: Icon(Icons.done,size:15,color:AppColors.primary2 )),
    const SizedBox (width: 10),
    Text(thingNeeded[index], style: Theme.of(context).textTheme.bodyText2),
    ]
    )
    );
  }
  
  steps(BuildContext context, int index) {
    return Padding(padding: 
    const EdgeInsets.symmetric(vertical:20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround ,
      children: [
      CircleAvatar( backgroundColor: AppColors.mainText,
      radius:12,
      child: Text("${index+1}"),

      ),
      Column(
        children: [
        SizedBox(
          width: 270,
          child: Text(
            "Your recipe has been uploaded, you can see it on your profile", // <-- can change depen on the index
            maxLines:3,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(color:AppColors.mainText),
          ),
        ),
        const SizedBox( height: 10),
        //Image.asset("images/icon1.jpg", height: 155, width : 270) <-- if want to put pictures
      ],)
    ],));
   
  }



}


