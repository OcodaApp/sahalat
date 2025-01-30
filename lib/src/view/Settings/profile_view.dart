// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../constance.dart';
import '../../../utility/General.dart';
import '../../../widgets/custom_material_button.dart';
import '../Orders/my_order_view.dart';
import '../user/login_view.dart';
import 'about_view.dart';
import 'edit_profile.dart';
import 'lang_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: ListView(
          children:  [
            Stack(
              children: [
                FadeInDown(
                  child: Container(
                    color: primaryColor,
                    height: Get.height / 4,
                    padding: EdgeInsets.only(right: sizeW10,left: sizeW10),
                    child: Column(
                      children: [
                        SizedBox(height: sizeH15,),
                        Row(
                          children: [
                            Text('Home'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                            SizedBox(width: sizeW5,),
                            Icon(Icons.arrow_forward_ios,color: whitecolor.withOpacity(.8),size: sizeW20,),
                            SizedBox(width: sizeW5,),
                            Text('Personal account'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                          ],
                        ),
                      ],
                    ),
                  )
                ),
                FadeInDown(
                  child: Container(
                    height : Get.height /1.8,
                    width: Get.width,
                    padding: EdgeInsets.all(sizeW15),
                    margin: EdgeInsets.only(top: Get.height / 9,right: sizeW15,left: sizeW15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(sizeW15),
                      color: whitecolor
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: sizeH15,),
                        General.token.trim() != "" ? GestureDetector(
                          onTap: (){
                            Get.to(()=> MyOrdersView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width /1.3,
                                child: Text('Your requests'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                              Icon(Icons.arrow_forward_ios,color: blackolor,size: sizeW20,),
                            ],
                          ),
                        ):Container(),
                        SizedBox(height: General.token.trim() != "" ? sizeH20:0,),
                        General.token.trim() != "" ?GestureDetector(
                          onTap: (){
                            Get.to(()=> EditProfileView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width /1.3,
                                child: Text('Settings'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                              Icon(Icons.arrow_forward_ios,color: blackolor,size: sizeW20,),
                            ],
                          ),
                        ):Container(),
                        SizedBox(height: General.token.trim() != "" ?sizeH20:0,),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=> LangView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width /1.3,
                                child: Text('Language and theme settings'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                              Icon(Icons.arrow_forward_ios,color: blackolor,size: sizeW20,),
                            ],
                          ),
                        ),
                        SizedBox(height: sizeH20,),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>  AboutView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width /1.3,
                                child: Text('About the app'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                              Icon(Icons.arrow_forward_ios,color: blackolor,size: sizeW20,),
                            ],
                          ),
                        ),
                        SizedBox(height: sizeH20,),
                        General.token.trim() != "" ?Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.defaultDialog(
                                  backgroundColor: whitecolor,
                                  title: 'logout?'.tr,
                                  radius: sizeW5,
                                  titleStyle:  TextStyle(
                                      fontSize: sizeW14, color: primaryColor, height: 3),
                                  confirm: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomMaterialButton(
                                        colorButton: primaryColor,
                                        colorText: whitecolor,
                                        height: sizeH40,
                                        minWidth: Get.width / 4,
                                        borderRadius: sizeW5,
                                        text: 'ok'.tr,
                                        fontSize: sizeW12,
                                        fontWeight: FontWeight.bold,
                                        onPressed: () {
                                          General().logOut().then((value) {
                                            Get.offAllNamed('/Splash');
                                          });
                                        },
                                      ),
                                      SizedBox(width: sizeW5,),
                                      CustomMaterialButton(
                                        colorButton: greyOpacityColor.withOpacity(.5),
                                        colorText: blackolor,
                                        height: sizeH40,
                                        minWidth: Get.width / 4,
                                        borderRadius: sizeW5,
                                        text: 'cancel'.tr,
                                        fontSize: sizeW12,
                                        fontWeight: FontWeight.bold,
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                  content: Container(),
                                );
                              },
                              child: SizedBox(
                                width: Get.width /1.3,
                                child: Text('Logout'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                            ),
                          ],
                        ):Container(),
                        SizedBox(height: General.token.trim() != "" ?sizeH20:0,),

                        General.token.trim() == "" ?Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(()=> LoginView());
                              },
                              child: SizedBox(
                                width: Get.width /1.3,
                                child: Text('Login'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                            ),
                          ],
                        ):Container(),
                        SizedBox(height: General.token.trim() == "" ?sizeH20:0,),

                        General.token.trim() != "" ?Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.defaultDialog(
                                  backgroundColor: whitecolor,
                                  title: 'delete acc?'.tr,
                                  radius: sizeW5,
                                  titleStyle:  TextStyle(
                                      fontSize: sizeW14, color: primaryColor, height: 3),
                                  confirm: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomMaterialButton(
                                        colorButton: primaryColor,
                                        colorText: whitecolor,
                                        height: sizeH40,
                                        minWidth: Get.width / 4,
                                        borderRadius: sizeW5,
                                        text: 'ok'.tr,
                                        fontSize: sizeW12,
                                        fontWeight: FontWeight.bold,
                                        onPressed: () {
                                          General().logOut().then((value) {
                                            Get.offAllNamed('/Splash');
                                          });
                                        },
                                      ),
                                      SizedBox(width: sizeW5,),
                                      CustomMaterialButton(
                                        colorButton: greyOpacityColor.withOpacity(.5),
                                        colorText: blackolor,
                                        height: sizeH40,
                                        minWidth: Get.width / 4,
                                        borderRadius: sizeW5,
                                        text: 'cancel'.tr,
                                        fontSize: sizeW12,
                                        fontWeight: FontWeight.bold,
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                  content: Container(),
                                );
                              },
                              child: SizedBox(
                                width: Get.width /1.3,
                                child: Text('delete acc'.tr,style: TextStyle(color: Colors.red,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                            ),
                          ],
                        ):Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
