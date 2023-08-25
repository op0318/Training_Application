import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myfitness_guide/utilities/colors.dart';

class video_info extends StatefulWidget {
  const video_info({Key? key}) : super(key: key);

  @override
  State<video_info> createState() => _video_infoState();
}

class _video_infoState extends State<video_info> {
  List videoinfo = [];
   _initData(){
     DefaultAssetBundle.of(context).loadString("json/videoinfo.json").
     then((value) =>
     setState((){
         videoinfo = json.decode(value);
     })
     );
   }
   @override
   void initState(){
     super.initState();
     _initData();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.gradientFirst.withOpacity(0.9),
                AppColor.gradientSecond,
          ],
              begin: const FractionalOffset(0.0, 0.4),
              end:Alignment.topRight ,
          )
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap:(){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios, size: 20,
                        color:  AppColor.secondPageIconColor,),
                      ),
                      Expanded(child: Container()),
                      Icon(Icons.info_outline, size: 20,
                        color:  AppColor.secondPageIconColor,)
                    ],
                  ),
                     const SizedBox(height: 30,),
                     Text('Legs Toning', style: TextStyle(
                        fontSize: 25,
                        color: AppColor.secondPageTitleColor
                  )),
                     const SizedBox(height: 5,),
                     Text('and Gultes Workout',
                       style: TextStyle(fontSize: 25,
                           color: AppColor.secondPageTitleColor),),
                     const SizedBox(height: 40,),
                     Row(
                     children: [
                       Container(
                         height: 30,
                         width: 90,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              AppColor.secondPageContainerGradient1stColor,
                              AppColor.secondPageContainerGradient2ndColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight
                          )
                         ),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.timer_outlined, size: 20,
                               color:AppColor.secondPageIconColor ,),
                             const SizedBox(width: 5,),
                             Text('68 min' ,
                               style: TextStyle(fontSize: 16, color: AppColor.secondPageIconColor),)
                           ],
                         ),
                       ),
                       const SizedBox(width: 20,),
                       Container(
                         height: 30,
                         width: 240,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             gradient: LinearGradient(
                                 colors: [
                                   AppColor.secondPageContainerGradient1stColor,
                                   AppColor.secondPageContainerGradient2ndColor
                                 ],
                                 begin: Alignment.bottomLeft,
                                 end: Alignment.topRight
                             )
                         ),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.handyman_outlined, size: 20,
                               color:AppColor.secondPageIconColor ,),
                             const SizedBox(width: 5,),
                             Text('Resistant band,Kettebell' ,
                               style: TextStyle(fontSize: 16, color: AppColor.secondPageIconColor),)
                           ],
                         ),
                       ),
                     ],
                   ),




                ],
              ),
            ),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70))
              ),
              child: Column(

                children: [
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const SizedBox(width: 30,),
                      Text('Circuit 1: Legs Toning',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                            color: AppColor.circuitsColor),),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(Icons.loop, size: 30,
                            color: AppColor.setsColor,),
                          Text('3 sets',style: TextStyle(
                            fontSize: 15,
                            color: AppColor.setsColor
                          ), )
                        ],
                      ),
                      const SizedBox(width:20)

                    ],
                  ),
                  const SizedBox(height: 20,),
                  Expanded(child:_listview() ,)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
  _listview(){
     return ListView.builder(
         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
         itemCount: videoinfo.length,
         itemBuilder: (_, int index){
           return GestureDetector(
             onTap: (){
               debugPrint(index.toString());
             },
             child: _buildCard(index),
           );
         }
     );
  }
  _buildCard(int index){
     return Container(
       height: 130,
       width: 200,
       child: Column(
         children: [
           Row(
             children: [
               Container(
                 width: 80,
                 height: 80,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     image: DecorationImage(
                         image: AssetImage(
                             videoinfo[index]["thumbnail"]
                         ),
                         fit: BoxFit.cover
                     )
                 ),
               ),
               const SizedBox(width: 10,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(videoinfo[index]["title"],
                     style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                     ) ,),
                   const SizedBox(height: 10,),
                   Padding(
                     padding:  const EdgeInsets.only(top: 3),
                     child: Text(videoinfo[index]["time"],
                       style:TextStyle(
                           fontSize: 18,
                           color: Colors.grey[500]
                       ) ,),
                   ),
                 ],
               )
             ],
           ),
           const SizedBox(height: 15,),
           Row(
             children: [
               Container(
                 height: 20,
                 width: 80,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: const Color(0xffeaeefc)
                 ),
                 child: const Center(
                   child: Text('15s Rest',
                     style:TextStyle(color: Color(0xff839fed)) ,),
                 ),
               ),
               Row(
                 children: [
                   for(int i=0; i<70; i++)
                     i.isEven?Container(
                       width:3,
                       height: 1,
                       decoration: BoxDecoration(
                           color: const Color(0xFF839fed),
                           borderRadius: BorderRadius.circular(2)
                       ),
                     ):Container(
                       width:3,
                       height: 1,
                       color: Colors.white,
                     )
                 ],
               )
             ],
           )
         ],
       ),
     );
  }
}
