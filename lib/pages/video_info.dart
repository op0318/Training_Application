import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myfitness_guide/pages/homepage.dart';
import 'package:myfitness_guide/utilities/colors.dart';
import 'package:video_player/video_player.dart';

class video_info extends StatefulWidget {
  const video_info({Key? key}) : super(key: key);

  @override
  State<video_info> createState() => _video_infoState();
}

class _video_infoState extends State<video_info> {
  List videoinfo = [];
   bool _playArea = false;
    bool _isPlaying = false;
    bool _dispose = false;
    int _isplayingIndex = -1;


     VideoPlayerController? _controller;
   _initData(){
     DefaultAssetBundle.of(context).loadString("json/videoinfo.json").
     then((value) =>
     setState((){
         videoinfo = json.decode(value);
     })
     );
   }

   @override
   void dispose(){
     _dispose= true;
     _controller?.pause();
     _controller?.dispose();
     _controller = null;
       super.dispose();
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
        decoration:_playArea== false?  BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.gradientFirst.withOpacity(0.9),
                AppColor.gradientSecond,
          ],
              begin: const FractionalOffset(0.0, 0.4),
              end:Alignment.topRight ,
          )
        ):BoxDecoration(
          color: AppColor.gradientSecond
        ),
        child: Column(
          children: [
            _playArea== false?Container(
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const HomePage()));
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
                         width: 220,
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
            ):Container(
              child: Column(
                children: [
                  Container(
                    height : 100,
                    padding: const EdgeInsets.only(top: 50,left: 30),
                    child: Row(
                      children: [
                        InkWell(onTap: (){
                          debugPrint("tapped");
                        },
                        child: Icon(Icons.arrow_back_ios,
                          size: 20, color: AppColor.secondPageTopIconColor,),),
                        Expanded(child: Container()),
                        InkWell(onTap: (){},

                          child: Icon(Icons.info_outline,
                            size: 20, color: AppColor.secondPageTopIconColor,),),

                      ],
                    ),
                  ),
                  _PlayView(context),
                  _ControlView(context)
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
   Widget _PlayView(BuildContext context){
       final controller = _controller;
       if(controller !=null && controller.value.isInitialized){
         return AspectRatio(
           aspectRatio: 16/9,
             child: VideoPlayer(controller)) ;
       }
       else{
          return const AspectRatio(
              aspectRatio: 16/9,
              child: Center(
                  child: Text('preparing.....',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white60
                    ),)));
       }

  }

  _OnTapVideo(int index){
    initializeVideo(index);
  }
  var _OnupdatecontrollerTime;
     Duration? _duration;
     Duration? _position;
     var _progress =0.0;
  void _OnControllerUpdate()async{
     if(_dispose){
       return ;
     }
     _OnupdatecontrollerTime = 0;
     final controller = _controller;
     final now = DateTime.now().millisecondsSinceEpoch;
     if(_OnupdatecontrollerTime>now){
       return ;
     }
     _OnupdatecontrollerTime = now+500;
     if(controller == null){
       debugPrint('controller is null');
       return ;
     }

     if(!controller.value.isInitialized){
       debugPrint("controller cannot be initialized");
     }
      if (_duration == null){
       _duration = _controller?.value.duration;
      }
      var duration =_duration;
      if(duration == null){
        return ;
      }
       var position = await controller.position;
      _position = position ;
     final playing = controller.value.isPlaying;
     if(playing){
       if (_dispose){
         setState(() {
           _progress =position!.inMilliseconds.ceilToDouble()/
           duration.inMilliseconds.ceilToDouble();
         });
       }
       _isPlaying = playing;
     }


  }

  initializeVideo(int index){
    var url = Uri.parse(videoinfo[index]["videoUrl"]);
    final  controller = VideoPlayerController.networkUrl(url);

    final old = _controller;
    if(old!=null){
      old.removeListener(_OnControllerUpdate);
      old.pause();
    }
    _controller = controller;
    setState(() {
      controller..initialize().then((_) {
        old?.dispose();
        _isplayingIndex = index;
        controller.addListener(_OnControllerUpdate);
        controller.play();
      } );
      setState(() {

      });
    });

  }
  String  convertTwo(int value){
    return value <10 ?"0$value" : "$value";
  }
 Widget _ControlView(BuildContext context){
    final onMute = (_controller?.value?.volume??0) >0;
    final duration = _duration?.inSeconds??0;
    final head = _position?.inSeconds?? 0;
    final remained = max(0,duration - head);
    final mins= convertTwo(remained ~/60.0);
   final secs = convertTwo(remained % 60);
     return Column(
       mainAxisSize:  MainAxisSize.min,
       children: [
         SliderTheme(
             data: SliderTheme.of(context).copyWith(
                 activeTrackColor: Colors.red[700],
                 inactiveTrackColor: Colors.red[100],
                 trackHeight:5.0,
                 trackShape: const RectangularSliderTrackShape(),
                 thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                 thumbColor: Colors.redAccent,
                 overlayShape:const RoundSliderOverlayShape(overlayRadius: 28) ,
                 overlayColor: Colors.red.withAlpha(32),
                 activeTickMarkColor: Colors.red[700],
                 inactiveTickMarkColor: Colors.red[100],
                 valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                 valueIndicatorColor: Colors.redAccent,
                 valueIndicatorTextStyle: TextStyle(color: Colors.white)
             ), child: Slider(value: max(0, min(_progress*100, 100)),
           min: 0, max: 100,divisions: 100,
           label: _position?.toString().split(".")[0],
           onChanged: (value) {
             setState(() {
               _progress = value * 0.01;
             });
           },
           onChangeStart: (value){
             _controller?.pause();
           },
           onChangeEnd: (value){
             final duration = _controller?.value?.duration;
             if(duration!=null){
               var newValue =max (0, min(value, 99))* 0.01;
               var millis = (duration.inMilliseconds* newValue).toInt();
               _controller?.seekTo(Duration(milliseconds: millis));
               _controller?.play();
             }
           },

         )),
         Container(
           height: 40,
           width: MediaQuery.of(context).size.width,
           margin: const EdgeInsets.only(bottom: 5),
           color: AppColor.gradientSecond,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [

               InkWell(onTap: (){
                 if(onMute){
                   _controller?.setVolume(0);
                 }
                 else{
                   _controller?.setVolume(1.0);
                 }
                 setState(() {

                 });
               },
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0,0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0)
                        ),
                      ],
                    ),
                    child:  Icon(
                      onMute ?Icons.volume_up: Icons.volume_off, color: Colors.white,
                    ),
                  ),

               ),),
               ElevatedButton(onPressed: ()async{
                 //strore the previous video index
               final index = _isplayingIndex-1;
               if (index>=0&& videoinfo.length>=0){
                 initializeVideo(index);
               }
                else{
                  Get.snackbar("video", "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: Icon(Icons.face, size: 30,
                      color: Colors.white,
                    ),
                    backgroundColor: AppColor.gradientSecond,
                    colorText: Colors.white,
                    messageText:const Text("No videos ahead!",
                      style: TextStyle(fontSize: 20, color: Colors.white),),);
               }
               },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: AppColor.gradientSecond
                 ),
                   child: const Icon(Icons.fast_rewind, size: 36, color: Colors.white,),
               ),
               ElevatedButton(onPressed: ()async{
                 if(_isPlaying){
                   setState(() {
                     _isPlaying =false;
                   });
                   _controller?.pause();

                 }else{
                   setState(() {
                     _isPlaying = true;
                   });
                   _controller?.play();
                 }

               },
                 style: ElevatedButton.styleFrom(
                     backgroundColor: AppColor.gradientSecond
                 ),
                 child:  Icon(_isPlaying? Icons.pause:Icons.play_arrow, size: 36, color: Colors.white,),
               ),
               ElevatedButton(onPressed: ()async{
                 final index = _isplayingIndex+1;
                 if (index<= videoinfo.length-1){
                   initializeVideo(index);
                 }
                 else{
                   Get.snackbar("video","",
                 snackPosition: SnackPosition.BOTTOM,
                 icon: Icon(Icons.face, size: 30,
                 color: Colors.white,
                 ),
                 backgroundColor: AppColor.gradientSecond,
                 colorText: Colors.white,
                 messageText:const Text("you have finished all videos congrats !",
                 style: TextStyle(fontSize: 20, color: Colors.white),),
                 );

                 }

               },
                 style: ElevatedButton.styleFrom(
                     backgroundColor: AppColor.gradientSecond
                 ),
                 child: const Icon(Icons.fast_forward, size: 36, color: Colors.white,),
               ),
               Text("$mins:$secs", style: const TextStyle(
                   color:Colors.white, shadows: [
                     Shadow(
                       offset:  Offset(0.0, 1.0),
                       blurRadius:4.0,
                       color: Color.fromARGB(150, 0, 0, 0)
                     )
               ] ),)

             ],
           ),
         ),
       ],
     );
  }
  _listview(){
     return ListView.builder(
         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
         itemCount: videoinfo.length,
         itemBuilder: (_, int index){
           return GestureDetector(
             onTap: (){
               _OnTapVideo(index);
               debugPrint(index.toString());
               setState(() {
                 if(_playArea==false){
                   _playArea = true;
                 }
               });
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
