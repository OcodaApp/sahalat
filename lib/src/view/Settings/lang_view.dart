// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constance.dart';
import '../../controller/lang_controller.dart';


class LangView extends StatelessWidget {
  LangView({Key? key}) : super(key: key);
  final LangController langController = Get.put(LangController());
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
          children: [
            Stack(
              children: [
                FadeInDown(
                  child: Container(
                    color: primaryColor,
                    height: Get.height / 3.5,
                    padding: EdgeInsets.only(right: sizeW10,left: sizeW10),
                  )
                ),
                Container(
                  height: Get.height / 1,
                  padding: EdgeInsets.only(right: sizeW10,left: sizeW10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: sizeH15,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back_ios,color: whitecolor.withOpacity(.8),size: sizeW20,)),
                          SizedBox(width: sizeW5,),
                          Text('Language and theme settings'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                        ],
                      ),
                    
                      SizedBox(height: sizeH35,),
                      Container(
                        width: Get.width,
                        height: sizeH50,
                        padding: EdgeInsets.only(right: sizeW15,left: sizeW15),
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(sizeW15),
                          border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: .4),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: greyOpacityColor.withOpacity(.3),
                              offset: const Offset(0, 0),
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Lang'.tr,
                              style:  TextStyle(
                                fontSize: sizeW16,
                                color: blackolor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // Icon(Icons.arrow_forward_ios,color: blackolor,size: sizeW20,),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        margin: EdgeInsets.only(top: sizeH10,bottom: sizeH10),
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(sizeW15),
                          border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: .4),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: greyOpacityColor.withOpacity(.3),
                              offset: const Offset(0, 0),
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
                        child: Column(
                          children: [
                            SizedBox(height: sizeH10,),
                            GestureDetector(
                              onTap: (){
                                if(langController.appLocale == 'ar'){
                                  Get.back();
                                }else{
                                  langController.changeLanguage('ar');
                                }
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: sizeW20,
                                    height: sizeW20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(sizeW45),
                                      border: Border.all(color: primaryColor,width: 1),
                                      color: langController.appLocale =='ar' ? primaryColor:whitecolor
                                    ),
                                  ),
                                  SizedBox(width: sizeW10,),
                                  Text('Ar'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),

                            SizedBox(height: sizeH15,),
                            GestureDetector(
                              onTap: (){
                                if(langController.appLocale == 'en'){
                                  Get.back();
                                }else{
                                  langController.changeLanguage('en');
                                }
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: sizeW20,
                                    height: sizeW20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(sizeW45),
                                      border: Border.all(color: primaryColor,width: 1),
                                      color: langController.appLocale =='en' ? primaryColor:whitecolor
                                    ),
                                  ),
                                  SizedBox(width: sizeW10,),
                                  Text('En'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                            SizedBox(height: sizeH15,),
                          ],
                        ),
                      ),
                      SizedBox(height: sizeH10,),
                      // Container(
                      //   width: Get.width,
                      //   height: sizeH50,
                      //   padding: EdgeInsets.only(right: sizeW15,left: sizeW15),
                      //   decoration: BoxDecoration(
                      //     color: whitecolor,
                      //     borderRadius: BorderRadius.circular(sizeW15),
                      //     border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: .4),
                      //     boxShadow: <BoxShadow>[
                      //       BoxShadow(
                      //         color: greyOpacityColor.withOpacity(.3),
                      //         offset: const Offset(0, 0),
                      //         blurRadius: 10.0,
                      //       )
                      //     ],
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         'السمة',
                      //         style:  TextStyle(
                      //           fontSize: sizeW16,
                      //           color: blackolor,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //       Icon(Icons.arrow_forward_ios,color: blackolor,size: sizeW20,),
                      //     ],
                      //   ),
                      // ),

                      //  Container(
                      //   width: Get.width,
                      //   margin: EdgeInsets.only(top: sizeH10,bottom: sizeH10),
                      //   decoration: BoxDecoration(
                      //     color: whitecolor,
                      //     borderRadius: BorderRadius.circular(sizeW15),
                      //     border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: .4),
                      //     boxShadow: <BoxShadow>[
                      //       BoxShadow(
                      //         color: greyOpacityColor.withOpacity(.3),
                      //         offset: const Offset(0, 0),
                      //         blurRadius: 10.0,
                      //       )
                      //     ],
                      //   ),
                      //   padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
                      //   child: Column(
                      //     children: [
                      //       SizedBox(height: sizeH10,),
                      //       Row(
                      //         children: [
                      //           Container(
                      //             width: sizeW20,
                      //             height: sizeW20,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(sizeW45),
                      //               color: primaryColor
                      //             ),
                      //           ),
                      //           SizedBox(width: sizeW10,),
                      //           Text('الوضع الافتراضى للنظام',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                      //         ],
                      //       ),

                      //       SizedBox(height: sizeH15,),
                      //       Row(
                      //         children: [
                      //           Container(
                      //             width: sizeW20,
                      //             height: sizeW20,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(sizeW45),
                      //               border: Border.all(color: primaryColor,width: 1),
                      //             ),
                      //           ),
                      //           SizedBox(width: sizeW10,),
                      //           Text('الوضع الفاتح',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                      //         ],
                      //       ),
                      //       SizedBox(height: sizeH15,),
                      //       Row(
                      //         children: [
                      //           Container(
                      //             width: sizeW20,
                      //             height: sizeW20,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(sizeW45),
                      //               border: Border.all(color: primaryColor,width: 1),
                      //             ),
                      //           ),
                      //           SizedBox(width: sizeW10,),
                      //           Text('الوضع الداكن',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                      //         ],
                      //       ),
                      //       SizedBox(height: sizeH10,),
                      //     ],
                      //   ),
                      // ),
                    ],
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
