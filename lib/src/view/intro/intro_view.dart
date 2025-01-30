// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_route_transition/page_route_transition.dart';
import '../../../constance.dart';
import '../../../utility/General.dart';
import '../user/login_view.dart';

class IntroViews extends StatelessWidget {
  String? image,title,desc;
  IntroViews({Key? key,this.image,this.title,this.desc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Container(
        width: Get.width,
        height: Get.height,
        color: whitecolor,
        child: Stack(
          children: [
            Image.network(image!,width: Get.width,height: Get.height /1.2,fit: BoxFit.fill,),
            FadeInUp(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height /1.5,
                  width: Get.width,
                  padding: EdgeInsets.only(right: sizeW15,left: sizeW15),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/curve.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: sizeH50,),
                        SizedBox(
                          width: Get.width /1.5,
                          child: Text(title!,
                          style: TextStyle(color: primaryColor,fontSize: sizeW25,fontWeight: FontWeight.w700),),
                        ),
                        SizedBox(height: sizeH20,),
                        Text(desc!,
                        style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400,height: 1.6),),
                        SizedBox(height: sizeH30,),
                        MaterialButton(
                          elevation: 0,
                          color: primaryColor,
                          minWidth: Get.width / 1.1,
                          height: sizeH50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(sizeW15),
                          ),
                          onPressed: (){
                            General().setIntro();
                            PageRouteTransition.effect = TransitionEffect.scale;
                            PageRouteTransition.pushReplacement(context,LoginView());
                          },
                          child:  Text(
                            'start'.tr,
                            style:  TextStyle(
                              fontSize: sizeW16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}


