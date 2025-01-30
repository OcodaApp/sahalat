import 'package:shlat/constance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'location_view.dart';
import 'login_view.dart';
import 'sign_up_view.dart';

class LoginOrSignUpView extends StatelessWidget {
   const LoginOrSignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height /2,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(sizeW30),
                  bottomRight: Radius.circular(sizeW30),
                ),
                color: primaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: sizeW20,left: sizeW20,top: sizeH50),
              child: GestureDetector(
                onTap: (){
                  PageRouteTransition.effect = TransitionEffect.fade;
                  PageRouteTransition.push(context,  const MapSearchView());
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Skip'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            FadeInUp(child:Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: sizeH20,),
                Image.asset('assets/logo.png',width: Get.width / 3),
                SizedBox(height: sizeH10,),
                Image.asset('assets/shlattext.png',width: Get.width / 3.6,color: blackolor,),
              ],
            )),),
            FadeInUp(
              child: Container(
                padding: EdgeInsets.only(right: sizeW15,left: sizeW15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MaterialButton(
                      elevation: 0,
                      color: primaryColor,
                      minWidth: Get.width / 1.1,
                      height: sizeH50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(sizeW15),
                      ),
                      onPressed: (){
                        PageRouteTransition.effect = TransitionEffect.topToBottom;
                        PageRouteTransition.push(context,  LoginView());
                      },
                      child: Text(
                        'Login'.tr,
                        style:  TextStyle(
                          fontSize: sizeW16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH20,),
                    MaterialButton(
                      elevation: 0,
                      color: primaryColor,
                      minWidth: Get.width / 1.1,
                      height: sizeH50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(sizeW15),
                      ),
                      onPressed: (){
                        PageRouteTransition.effect = TransitionEffect.topToBottom;
                        PageRouteTransition.push(context,  SignUpView());
                      },
                      child:  Text(
                        'Register'.tr,
                        style:  TextStyle(
                          fontSize: sizeW16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH50,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
