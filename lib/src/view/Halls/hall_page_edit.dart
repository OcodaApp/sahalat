// ignore_for_file: must_be_immutable, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shlat/utility/General.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../constance.dart';
import '../../controller/lang_controller.dart';
import '../../dates/date_picker_widget.dart';
import '../Home/controllers/provider_edit_controller.dart';

class HallPageEdit extends StatelessWidget {
  HallPageEdit({Key? key,this.sectionsData,this.item}) : super(key: key);
  final ProviderEditController controller = Get.put(ProviderEditController());
  final LangController langController = Get.put(LangController());
  var sectionsData;
  var item;
  @override
  Widget build(BuildContext context) {
    controller.dateChoose.value = DateTime.tryParse(item.date).toString();
    controller.amOrpm.value = item.amorpm;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      body: Obx(() => ListView(
        children:  [
         FadeInDown(
            child: SizedBox(
              height: Get.height / 3.7,
              child: Stack(
                children: [
                  Container(
                    height: Get.height / 4.8,
                    color: primaryColor,
                  ),
                  
                   Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FadeInRight(
                          child: Container(
                            height: Get.height / 4,
                            margin:  EdgeInsets.only(right: sizeW15,left: sizeW15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(sizeW25),
                              image:  DecorationImage(
                                image: NetworkImage(controller.provider['image_url'],),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: sizeH15,),
          Container(
            margin:  EdgeInsets.only(right: sizeW15,left: sizeW15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width /2,
                      child: Text(
                        controller.provider['title'],style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                      )
                    ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {
                      },
                      starCount: 5,
                      rating: double.parse(controller.provider['rate_avg'].toString()),
                      size: sizeW15,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star,
                      color: primaryColor,
                      borderColor: primaryColor,
                      spacing:5.0
                    ),
                  ],
                ),
                SizedBox(height: sizeH10,),
                sectionsData['is_address'] == 'yes'? Row(
                  children: [
                    FadeInDown(child:Image.asset('assets/icons/location.png',fit: BoxFit.fill,),),
                    SizedBox(width: sizeW10,),
                    Expanded(child: Text(controller.provider['location_text'],
                    style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,)),
                  ],
                ):Container(),
                SizedBox(height: sectionsData['is_address'] == 'yes'?sizeH10:0,),
                Row(
                  children: [
                    sectionsData['is_person_count'] == 'yes'?FadeInDown(child:Image.asset('assets/icons/profile-2user.png',fit: BoxFit.fill,),):Container(),
                    SizedBox(width: sectionsData['is_person_count'] == 'yes'?sizeW10:0,),
                    sectionsData['is_person_count'] == 'yes'?Text(controller.provider['person_count'],style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),):Container(),
                    SizedBox(width: sectionsData['is_person_count'] == 'yes'?sizeW20:0,),
                    sectionsData['is_price'] == 'yes'?FadeInDown(child:Image.asset('assets/icons/dollar-circle.png',fit: BoxFit.fill,),):Container(),
                    SizedBox(width: sectionsData['is_price'] == 'yes'?sizeW10:0,),
                    sectionsData['is_price'] == 'yes'?Text(controller.provider['price_text'],style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),):Container(),
                  ],
                ),
                
                SizedBox(height: sizeH20,),
                Container(height: 1,width: Get.width,color: greyOpacityColor,),
                SizedBox(height: sizeH20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${sectionsData['desc_name']}',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                    SizedBox(height: sizeH10,),
                    Text(controller.provider['desc'],
                      style: TextStyle(color: grey3,fontSize: sizeW16,fontWeight: FontWeight.w400,height: 1.5),
                    ),
                    SizedBox(height: sizeH15,),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('date and time'.tr,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                    SizedBox(height: sizeH10,),
                    DatePicker(
                      directionality : langController.appLocale == 'ar'? TextDirection.rtl:TextDirection.ltr,
                      height : sizeH75,
                      width: sizeW75,
                      locale : langController.appLocale == 'ar'?"ar":"en",
                      DateTime.now().add(const Duration(days : 1)),
                      initialSelectedDate: DateTime.tryParse(item.date),
                      selectionColor: primaryColor,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        // controller.dateChoose.value = ('${date.year}-${date.month}-${date.day}').toString();
                        controller.dateChoose.value = date.toString();
                      },
                    ),
                  ],
                ),
                SizedBox(height: sizeH20,),
                
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.amOrpm.value = 'am';
                      },
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW15),
                          border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: 1.4)
                        ),
                        padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: sizeW20,
                                  height: sizeW20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(sizeW45),
                                    border: Border.all(color: primaryColor,width: 1),
                                    color: controller.amOrpm.value == 'am'? primaryColor:whitecolor
                                  ),
                                ),
                                SizedBox(width: sizeW10,),
                                Text('am'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)
                              ],
                            ),
                            Text('${controller.provider['am_from']} - ${controller.provider['am_to']}',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH10,),
                    GestureDetector(
                      onTap: (){
                        controller.amOrpm.value = 'pm';
                      },
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW15),
                          border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: 1.4)
                        ),
                        padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: sizeW20,
                                  height: sizeW20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(sizeW45),
                                    border: Border.all(color: primaryColor,width: 1),
                                    color: controller.amOrpm.value == 'pm'? primaryColor:whitecolor
                                  ),
                                ),
                                SizedBox(width: sizeW10,),
                                Text('pm'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)
                              ],
                            ),
                            Text('${controller.provider['pm_from']} - ${controller.provider['pm_to']}',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH20,),
                  ],
                ),
                // packages
                MaterialButton(
                  elevation: 0,
                  color: primaryColor,
                  minWidth: Get.width / 1.1,
                  height: sizeH50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                  ),
                  onPressed: (){
                    if(General.token != ''){
                      if(controller.amOrpm.value != ''){
                        controller.getAddBasket(item.id);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Choose morning or evening'.tr)),
                        );
                      }
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please log in first'.tr)),
                      );
                    }
                    
                  },
                  child: Text(
                    'edit'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: sizeH20,),
              ],
            ),
          ),
        ],
      ),),
    );
  }
}
