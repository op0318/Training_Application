import 'package:flutter/material.dart';
import '../utilities/colors.dart' as color;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,

      body:Container(
         padding: const EdgeInsets.only(top: 70,left: 30,right: 30),
        child:  Column(
          children: [
            Row(
            children: [Text(
                'Training',
            style: TextStyle(
              fontSize: 30,
              color: color.AppColor.homePageTitle,
              fontWeight: FontWeight.w700

            ),
            ),
              Expanded(
                  child: Container()),
              Icon(size: 20,
                  Icons.arrow_back_ios,
              color: color.AppColor.homePageIcons,),
             const SizedBox(width: 10),
              Icon(Icons.calendar_today_outlined,
              size: 20,
              color: color.AppColor.homePageIcons,),
              const SizedBox(width: 15,),
              Icon(size: 20,
                Icons.arrow_forward_ios,
                color: color.AppColor.homePageIcons,)
            ],
          ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Your program',
                  style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700

                  ),
                ),
                Expanded(child: Container()),
                Text(
                  'Details',
                  style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageDetail,


                  ),
                ),
                SizedBox(width: 5,),
                Icon(size: 20,
                  Icons.arrow_forward,
                  color: color.AppColor.homePageIcons,)
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                    offset: const Offset(5,5),
                blurRadius: 10,
                color: color.AppColor.gradientSecond.withOpacity(0.9))],
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                    end: Alignment.centerRight ,
                    colors: [
                  color.AppColor.gradientFirst.withOpacity(0.8),
                color.AppColor.gradientSecond.withOpacity(0.9)]),
                  color: Colors.red,
                  borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(80)
              )),
                 width: MediaQuery.of(context).size.width,
                  height:220,
              child:  Container(
                padding: const EdgeInsets.only(top: 25,left: 20 ,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Next workout',
                  style: TextStyle(fontSize:16,
                  color: color.AppColor.homePageContainerTextSmall),),
                    SizedBox(height: 5,),
                    Text('Legs Toning',
                      style: TextStyle(fontSize:25,
                          color: color.AppColor.homePageContainerTextSmall),),
                    SizedBox(height: 5,),
                    Text('and Glutes Workout',
                      style: TextStyle(fontSize:26,
                          color: color.AppColor.homePageContainerTextSmall),),
                     SizedBox(height: 25,),
                     Row(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Row(
                        children: [
                          SizedBox(height: 25,),
                          Icon(Icons.timer,size: 20,
                        color: color.AppColor.homePageContainerTextSmall,),
                          SizedBox(width: 10,),
                          Text('60 min',
                            style: TextStyle(fontSize:15,
                                color: color.AppColor.homePageContainerTextSmall),),],
                      ),
                      Expanded(child: Container()),
                      Container(
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [BoxShadow(
                            color: color.AppColor.gradientFirst,
                            blurRadius: 10,
                            offset:  Offset(4,8)
                          )]
                        ),
                        child: Icon(Icons.play_circle_fill,
                        color: Colors.white,
                        size: 60,),
                      )],
                    )
                  ],
                ),
              ),
             ),
            const SizedBox(height: 5,),
            Container(

              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    margin:const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                      fit: BoxFit.fill,
                        image: AssetImage('assets/card.jpg')
                      ),
                        boxShadow:[BoxShadow(
                          offset: Offset(8,10),
                          blurRadius: 40,
                          color: color.AppColor.gradientSecond.withOpacity(0.3)
                        ),
                          BoxShadow(
                              offset: Offset(-1,-5),
                              blurRadius: 40,
                              color: color.AppColor.gradientSecond.withOpacity(0.3)
                          )],
                    ),
                    height: 120,
                     width: MediaQuery.of(context).size.width,


                  ),
                   Container(
                     margin: EdgeInsets.only(right: 200,bottom: 30),

                     decoration: BoxDecoration(
                        // color: Colors.red.withOpacity(0.2),
                       borderRadius: BorderRadius.circular(20),
                       image: const DecorationImage(
                           //fit: BoxFit.fill,
                           image: AssetImage('assets/figure.png')
                       ),
                     ),
                     height: 200,width: 350,
                  ),
                  Container(
                    margin:const EdgeInsets.only(left: 150,top: 50),
                    height: 100,
                    width: double.maxFinite,
                    //color: Colors.red.withOpacity(0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('You are doing great',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color.AppColor.homePageDetail
                        )),
                        const SizedBox(height: 10,),
                        RichText(
                            text:TextSpan(children: [TextSpan(
                              text: 'Stick to your plan'
                            )],
                                text: 'Keep it up\n',
                        style: TextStyle(color:color.AppColor.homePagePlanColor,
                        fontSize: 16)))
                      ],
                    ),
                  )
                ],
              ),
            ),


            
          ],
        ),
      ) ,
    );
  }
}

