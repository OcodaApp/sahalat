import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constance.dart';
import '../controller/splash_controller.dart';
import 'package:animate_do/animate_do.dart';

class SplashView extends StatelessWidget {
  final SplashController spalshController = Get.put(SplashController());
   SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        width: Get.width,
        height: Get.height,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInUp(child:Image.asset('assets/logo.png',width: Get.width /2,height: sizeH150,),),
            FadeInUp(child:Image.asset('assets/shlattext.png',width: Get.width /2,height: sizeH80,),),
          ],
        ),
      ),
    );
  }
}
