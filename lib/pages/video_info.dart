import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/colors.dart' as colors;
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {

  List videoinfo=[];
 bool _playarea=false;
 bool _isplaying=false;
  bool _disposed=false;
  int _isplayingIndex=-1;
 VideoPlayerController? _controller;
  _initData()
  async {
    await DefaultAssetBundle.of(context).loadString('json/videoinfo.json').then((value)
    {
      setState(() {
        videoinfo=  json.decode(value);
      });

    });
  }

  @override
  void initState()
  {
    super.initState();
    _initData();
  }
@override
void dispose()
{
  _disposed=true;
  _controller?.pause();
  _controller?.dispose();
  _controller=null;
  super.dispose();
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
       decoration: _playarea==false?BoxDecoration (
          gradient:LinearGradient(
            begin:const FractionalOffset(0.0,0.4) ,
            end:Alignment.topRight ,
            colors: [
            colors.AppColor.gradientFirst.withOpacity(0.9),
          colors.AppColor.gradientSecond.withOpacity(0.9)
                    ],
          ) ,
        ):
      BoxDecoration(color:colors.AppColor.gradientSecond),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _playarea==false?
          Container(height: 300,
          padding: const EdgeInsets.only(top: 70,left: 30,right: 30),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                      child: Icon(Icons.arrow_back_ios,size: 20,color: colors.AppColor.secondPageIconColor),
                    onTap: (){
                        Get.back();
                    },
                  ),
                Expanded(child: Container()),
                  Icon(Icons.info_outline,size: 20,color: colors.AppColor.secondPageIconColor,)

                ],

              ),
              const SizedBox(height: 30,),
              Text('Legs Toning', style: TextStyle(fontSize:25,
                  color: colors.AppColor.secondPageTitleColor)),
              const SizedBox(height: 5),
              Text('and Glutes Workout', style: TextStyle(fontSize:25,
                  color: colors.AppColor.homePageContainerTextSmall)),
              const SizedBox(height: 50),
              Row (

                children: [
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin:Alignment.bottomLeft ,
                          end:Alignment.topRight ,
                          colors: [
                            colors.AppColor.secondPageContainerGradient1stColor,
                            colors.AppColor.secondPageContainerGradient2ndColor])
                      ,)
                    ,child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer,size: 20,color: colors.AppColor.secondPageIconColor,),
                      const SizedBox(width: 5,),
                      Text('68 min',style: TextStyle(
                          fontSize: 16,
                          color: colors.AppColor.secondPageIconColor
                      ) ,)


                    ],

                  ),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    width: 250-28,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin:Alignment.bottomLeft ,
                          end:Alignment.bottomRight ,
                          colors: [
                            colors.AppColor.secondPageContainerGradient1stColor,
                            colors.AppColor.secondPageContainerGradient2ndColor])
                      ,)
                    ,child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.handyman_outlined,size: 20,color: colors.AppColor.secondPageIconColor,),
                      const SizedBox(width: 5,),
                      Text('Resistent band,kettebel',style: TextStyle(
                          fontSize: 16,
                          color: colors.AppColor.secondPageIconColor
                      ) ,)


                    ],

                  ),
                  )
                ],)
            ],
          ),
        ):
          Container(
            child: Column(children: [
              Container(
              height: 100,
              padding: EdgeInsets.only(top: 50,left: 30,right: 30),
              child: Row(children: [
                InkWell (onTap: () {
                  debugPrint('tapped');

                },child: Icon(Icons.arrow_back_ios,size: 20,color: colors.AppColor.secondPageIconColor),
                ),
                Expanded(child: Container()),
                Icon(Icons.info_outline,
                size: 20,
                color: colors.AppColor.secondPageTopIconColor,)
              ]),
            ),
              _playview(context),
              _controllview(context)


            ]),
          ),
          Expanded(child: Container(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Text('Circuit 1: Legs Toning',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colors.AppColor.circuitsColor,
                    ),
                    ),
                     Expanded(child: Container()),
                     Row(children: [
                       Icon(Icons.loop,size: 30,color: colors.AppColor.loopColor,),
                       SizedBox(width: 10,),
                       Text('3 sets',style: TextStyle(fontSize: 15,
                       color: colors.AppColor.setsColor),)
                     ],),
                    SizedBox(width: 20,)
                  ],
                ),
                Expanded(child:_listview(),
                )
              ],
            ),
            decoration:const BoxDecoration(color: Colors.white,
              borderRadius:BorderRadius.only(topRight: Radius.circular(70))

            ),
          ),
          )
        ],
      ),
    ),
    );
  }

Widget _playview(BuildContext context)
 {
   final controller=_controller;
   if(controller!=null&&controller.value.isInitialized)
     {
       return AspectRatio(aspectRatio: 16/9,
           child: VideoPlayer(controller));
     }
   else{
return AspectRatio(
  aspectRatio: 16/9,
    child: Center(child: Text('Preparing')));
   }

 }
 Widget _controllview(BuildContext context)
 {
   return Container(
     height: 120,
     width: MediaQuery.of(context).size.width,
     color: colors.AppColor.gradientSecond,

     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         IconButton(onPressed: ()async{
           final index=_isplayingIndex-1;
           if(index>0&&videoinfo.length>=0)
             {
               _onTapped(index);

             }





         }, icon: Icon(Icons.fast_rewind,size: 36,color: Colors.white,)),
         IconButton(onPressed: ()async{
           if(_isplaying)
             {
               setState(() {
                 _isplaying=false;
               });
               _controller?.pause();
             }
           else
             {
               setState(() {
                 _isplaying=true;
               });
               _controller?.play();
             }




         }, icon: Icon(_isplaying?Icons.pause:
             Icons.play_arrow
           ,size: 36,color: Colors.white,)),
         IconButton(onPressed: ()async{}, icon: Icon(Icons.fast_forward,size: 36,color: Colors.white,) )

       ],
     ),
   );
 }

 var _onUpdateControllerTime;
 void _oncontrollerupdate()async
  {
    if(_disposed)
      {
        return;
      }
    _onUpdateControllerTime=0;

    final now=DateTime.now().millisecondsSinceEpoch;
    if(_onUpdateControllerTime>now)
      {
        return;
      }
    _onUpdateControllerTime=now+500;

  final controller=_controller;
  if(controller==null)
    {
      debugPrint('Controller is null');
      return ;
    }
  if(!controller.value.isInitialized)
    {
      debugPrint('Controller can not be initialized ');
      return;
    }
  final playing=controller.value.isPlaying;
  _isplaying=playing;


}
_onTapped(int index)
 {
final controller=VideoPlayerController.networkUrl(Uri.parse(videoinfo[index]['videoUrl']));
final old=_controller;
_controller=controller;
if(old!=null)
  {
    old.removeListener((_oncontrollerupdate));
    old.pause();
  }
setState(() {});
 controller..initialize().then((_)
{
  old?.dispose();
  _isplayingIndex=index;
  controller.addListener((_oncontrollerupdate) );
  controller.play();
  setState(() {});


});

 }
 _listview()
  {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _onTapped(index);
              _playarea=true;
            });
          },
          child: _buildcard(index),
        );
      },
      itemCount: videoinfo.length,
    );
  }
  _buildcard(int index)
  {
  return Container(
    height: 135,
    child: Column(
      children: [
        Row(children: [
          Container(
            width:80 ,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(
                      videoinfo[index]['thumbnail']
                  ),
                  fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox( width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(videoinfo[index]['title'],
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(height: 10,),
              Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(videoinfo[index]['time']))

            ],)

        ],),
        const SizedBox(height: 18),
        Row(children: [
          Container(height: 20,
            width: 80,
            decoration:  BoxDecoration(
                color:const Color(0xFFeaeefc),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text('15s rest',
                  style: TextStyle(color: Color(0xFF839fed))),
            ),
          ),
          Row(
            children: [
              for(int i=0;i<70;i++)
                i.isEven? Container(
                  width: 3,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xFF839fed),
                      borderRadius: BorderRadius.circular(2)),
                ):
                Container(
                  width:3 ,
                  height:1 ,
                  decoration: BoxDecoration(
                    color: Colors.white,


                  ),


                )

            ],
          )
        ],)
      ],
    ),
  );
}

}
