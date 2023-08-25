import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myfitness_guide/pages/home_page.dart';
import 'package:myfitness_guide/pages/video_info.dart';

void main() {
runApp(
    const GetMaterialApp(
      home: video_info(),
    debugShowCheckedModeBanner:  false,));
}
