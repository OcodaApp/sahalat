// ignore_for_file: must_be_immutable, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shlat/utility/General.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../constance.dart';
import '../../controller/lang_controller.dart';
import '../../dates/date_picker_widget.dart';
import '../Home/controllers/photo_edit_controller.dart';
import '../Restaurants/product_view.dart';
import '../events/section_page.dart';

class PhotoEdit extends StatelessWidget {
  PhotoEdit({Key? key,this.sectionsData,this.item}) : super(key: key);
  final PhotoEditController controller = Get.put(PhotoEditController());
  final LangController langController = Get.put(LangController());
  var sectionsData;
  var item;
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now().add(const Duration(days : 1));
    controller.dateChoose.value = DateTime.tryParse(item.date).toString();
    Time time = Time(hour: date.hour, minute: date.minute);
    controller.timeChoose.value = item.time;
    return RefreshIndicator(
      onRefresh: ()async{
        controller.sectionId.value = 0;
        controller.sectionsShow.value = false;
        controller.isProducts.value = false;
        controller.getProductssList();
      },
      child: Scaffold(
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
                  sectionsData['type'] != 'halls' && sectionsData['type'] != 'photographers' ?Row(
                    children: [
                      FadeInDown(child:Image.asset('assets/icons/time.png',fit: BoxFit.fill,),),
                      SizedBox(width: sizeW10,),
                      Text('${controller.provider['from_time']} - ${controller.provider['to_time']} ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                    ],
                  ):Container(),
                  SizedBox(height: sectionsData['type'] != 'halls' && sectionsData['type'] != 'photographers'?  sizeH10:0,),
                  sectionsData['type'] == 'photographers' || sectionsData['type'] == 'events' ? Column(
                    children: [
                      sectionsData['type'] == 'photographers' ? Row(
                        children: [
                          FadeInDown(child:Image.asset('assets/icons/camera.png',fit: BoxFit.fill,),),
                          SizedBox(width: sizeW10,),
                          Expanded(child: Text(controller.provider['category_name'],style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),)),
                        ],
                      ):Container(),
                      SizedBox(height: sectionsData['type'] == 'photographers' ? sizeH10:0,),
                      Row(
                        children: [
                          FadeInDown(child:Image.asset('assets/icons/dollar-circle.png',fit: BoxFit.fill,),),
                          SizedBox(width: sizeW10,),
                          Text('${'price in'.tr} ${controller.provider['price']} ${'SAR'.tr} ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                        ],
                      ),
                      SizedBox(height: sizeH10,),
                    ],
                  ):Container(),
                  sectionsData['is_address']=='yes' && sectionsData['type'] != 'events'? Row(
                    children: [
                      FadeInDown(child:Image.asset('assets/icons/location.png',fit: BoxFit.fill,),),
                      SizedBox(width: sizeW10,),
                      Expanded(child: Text(controller.provider['location_text'],
                      style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,)),
                    ],
                  ):Container(),
                  SizedBox(height: sectionsData['is_address']=='yes' && sectionsData['type'] != 'events'?sizeH10:0,),
                  Row(
                    children: [
                      sectionsData['is_person_count'] == 'yes'?FadeInDown(child:Image.asset('assets/icons/profile-2user.png',fit: BoxFit.fill,),):Container(),
                      SizedBox(width: sectionsData['is_person_count'] == 'yes'?sizeW10:0,),
                      sectionsData['is_person_count'] == 'yes'?Text(controller.provider.personCount,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),):Container(),
                      SizedBox(width: sectionsData['is_person_count'] == 'yes'?sizeW20:0,),
                      sectionsData['is_price'] == 'yes'?FadeInDown(child:Image.asset('assets/icons/dollar-circle.png',fit: BoxFit.fill,),):Container(),
                      SizedBox(width: sectionsData['is_price'] == 'yes'?sizeW10:0,),
                      sectionsData['is_price'] == 'yes'?Text(controller.provider.price,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),):Container(),
                    ],
                  ),
                  sectionsData['is_categories'] == 'yes'? Column(
                    children: sectionsData['type'] == 'restaurants' || sectionsData['type'] == 'sweets' || sectionsData['type'] == 'flowers' ?[
                      SizedBox(height: sizeH20,),
                      SizedBox(
                        height: controller.provider.categories.length>0? sizeH30:0,
                        child: ListView.builder(
                          itemCount: controller.provider.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap : (){
                                controller.sectionId.value = controller.provider.categories[index]['id'];
                                controller.getProductssList();
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: sizeW10),
                                height : sizeH30,
                                padding: EdgeInsets.all(sizeW5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(sizeW10),
                                  border: Border.all(color: primaryColor,width: 1),
                                  color: controller.sectionId.value == controller.provider.categories[index]['id'] ? primaryColor:whitecolor,
                                ),
                                child: Center(
                                  child: Text(controller.provider.categories[index]['title'],
                                  style: TextStyle(color: controller.sectionId.value == controller.provider.categories[index]['id'] ?whitecolor:primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: sizeH20,),
                    ]:[],
                  ):Container(),
                 sectionsData['is_products'] =='yes' && controller.isProducts.value && controller.productsData.isNotEmpty && sectionsData['type'] != 'events'?  SizedBox(
                    height: sizeH100 *(controller.productsData.length+.9),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: sizeW15,
                        mainAxisSpacing: sizeH15,
                      ),
                      itemCount: controller.productsData.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: (){
                            Get.to(()=>ProductView(
                              product : controller.productsData[index],
                              date: controller.dateChoose.value,
                              time: controller.timeChoose.value,
                              products: const [],
                              sectionsData : sectionsData,
                            ),
                            arguments: [
                              controller.productsData[index].sizes,
                              controller.productsData[index].additions,
                              controller.productsData[index].id,
                              controller.providerId.value,
                              controller.provider.type,
                              controller.provider.delivery
                            ]);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: whitecolor,
                                      borderRadius: BorderRadius.circular(sizeW15),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: greyOpacityColor.withOpacity(.3),
                                          offset: const Offset(0, 0),
                                          blurRadius: 10.0,
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: Image.network(controller.productsData[index].image,width: Get.width / 2.8,height: Get.height / 4.8,),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width / 2.8,height: Get.height / 4.8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(sizeW10),
                                          decoration: BoxDecoration(
                                            color: whitecolor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(sizeW8),
                                              topRight: Radius.circular(sizeW8),
                                              bottomRight: Radius.circular(sizeW8),
                                            ),
                                            border: Border.all(color: primaryColor,width: 1.5),
                                          ),
                                          child: Icon(Icons.add,color: primaryColor,size: sizeW20,)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: sizeH10,),
                              Text(controller.productsData[index].name,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,),
                              SizedBox(height: sizeH5,),
                              Text(controller.productsData[index].price.toString(),style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        );
                      }),
                  ):Container(),
                  SizedBox(height: sectionsData['is_products'] =='yes' && controller.isProducts.value&& controller.productsData.isNotEmpty&& sectionsData['type'] != 'events'?sizeH20:0,),
                  
                  SizedBox(height: sizeH20,),
                  Container(height: 1,width: Get.width,color: greyOpacityColor,),
                  SizedBox(height: sizeH20,),
                  sectionsData['is_desc'] == 'yes' ?  Column(
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
                  ):Container(),
                 
                  sectionsData['is_images'] == 'yes' && controller.provider['images'].length > 0?Column(
                    children: [
                      SizedBox(
                        height: Get.height / 7,
                        child: ListView.builder(
                          itemCount: controller.provider['images'].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){
                                Get.dialog(
                                  Scaffold(
                                    backgroundColor: greycolor.withOpacity(0.1),
                                    body: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: Get.height / 4,
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: Get.height / 3,
                                            child: Container(
                                              margin: EdgeInsets.only(left: sizeW10,right: sizeW10),
                                              height : Get.height / 1.5,
                                              width: Get.width / 1,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(sizeW15),
                                                image: DecorationImage(
                                                  image: NetworkImage(controller.provider.images[index]['image_url'],),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:  EdgeInsets.all(sizeW15),
                                                child:  InkWell(
                                                  onTap: (){
                                                    Get.back();
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: sizeW30,
                                                        height: sizeW30,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(sizeW5),
                                                          border: Border.all(color: blackolor,width: 1)
                                                        ),
                                                        child: const Center(child: Icon(Icons.close)))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: Get.height / 4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  barrierDismissible: false,
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: sizeW10),
                                height : Get.height / 7,
                                width: Get.width / 3.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(sizeW15),
                                  image: DecorationImage(
                                    image: NetworkImage(controller.provider['images'][index]['image_url'],),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: sizeH20,),
                      Container(height: 1,width: Get.width,color: greyOpacityColor,),
                      SizedBox(height: sizeH20,),
                    ],
                  ):Container(),
                  sectionsData['type'] == 'salons'? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        elevation: 0,
                        color: controller.inOrOut.value == 'in' ?primaryColor:whitecolor,
                        minWidth: Get.width / 2.3,
                        height: sizeH40,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(sizeW15),
                          side:  BorderSide(color: controller.inOrOut.value == 'in' ?whitecolor:primaryColor)
                        ),
                        onPressed: (){
                          controller.inOrOut.value = 'in';
                        },
                        child: Text(
                          'Inside the salon'.tr,
                          style:  TextStyle(
                            fontSize: sizeW16,
                            color: controller.inOrOut.value == 'in' ?whitecolor:primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      MaterialButton(
                        elevation: 0,
                        color: controller.inOrOut.value == 'out' ?primaryColor:whitecolor,
                        minWidth: Get.width / 2.3,
                        height: sizeH40,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(sizeW15),
                          side:  BorderSide(color: controller.inOrOut.value == 'out' ?whitecolor:primaryColor)
                        ),
                        
                        onPressed: (){
                          controller.inOrOut.value = 'out';
                        },
                        child: Text(
                          'Outside the salon'.tr,
                          style:  TextStyle(
                            fontSize: sizeW16,
                            color: controller.inOrOut.value == 'out' ?whitecolor:primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ):Container(),
                  SizedBox(height: sectionsData['type'] == 'salons'?sizeH20:0,),
                  
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
                          controller.dateChoose.value = date.toString();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: sizeH20,),
                  sectionsData['type'] != 'halls' ? GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          showPicker(
                              context: context,
                              value: time,
                              cancelText : 'cancel'.tr,
                              okText : 'ok'.tr,
                              amLabel : 'am'.tr,
                              pmLabel : 'pm'.tr,
                              sunrise: const TimeOfDay(hour: 6, minute: 0), // optional
                              sunset: const TimeOfDay(hour: 18, minute: 0), // optional
                              duskSpanInMinutes: 120, // optional
                              onChange: (value){
                                controller.timeChoose.value ='${value.hour}:${value.minute}';
                              },
                          ),
                      );
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
                          Text('clock'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                          Row(
                            children: [
                              const Icon(Icons.arrow_back_ios,color: primaryColor,),
                              SizedBox(width: sizeW5,),
                              Text('${controller.timeChoose}',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                              SizedBox(width: sizeW5,),
                              const Icon(Icons.arrow_forward_ios,color: primaryColor,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ):Container(),
                  
                  SizedBox(height: sectionsData['type'] != 'halls' ?sizeH20:0,),
                  sectionsData['is_am_pm'] =='yes'? Column(
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
                              Text('${controller.provider.amFrom} - ${controller.provider.amTo}',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)
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
                              Text('${controller.provider.pmFrom} - ${controller.provider.pmTo}',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: sizeH20,),
                    ],
                  ):Container(),
                  // packages
                  sectionsData['type'] == 'photographers' && controller.provider['packages'].length>0? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sectionsData['packages_name'],style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                      SizedBox(height: sizeH20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.createPackages(),
                      ),
                    ],
                  ):Container(),

                  sectionsData['type'] == 'events'?Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Categories'.tr,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                      SizedBox(height: sizeH15,),
                      SizedBox(
                        height: sizeH100 *controller.provider['packages'].length,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 3.7,
                            crossAxisSpacing: sizeW15,
                            mainAxisSpacing: sizeH15,
                          ),
                          itemCount: controller.provider['packages'].length,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: (){
                                Get.to(()=>SectionPage(
                                  section : controller.provider['packages'][index],
                                  date: controller.dateChoose.value,
                                  time: controller.timeChoose.value,
                                  sectionsData : sectionsData,
                                ),
                                arguments: [
                                  controller.provider['packages'][index]['id'],
                                  controller.providerId.value,
                                  controller.provider.type,
                                ]);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: Get.width / 2,height: Get.height / 4.8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: whitecolor,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: greyOpacityColor.withOpacity(.3),
                                          offset: const Offset(0, 0),
                                          blurRadius: 10.0,
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: NetworkImage(controller.provider['packages'][index]['image_url'],),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: sizeH10,),
                                  Text(controller.provider['packages'][index]['title'],style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                                ],
                              ),
                            );
                          }),
                      ),
                    ],
                  ):Container(),

                  sectionsData['type'] == 'salons'?Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Services'.tr,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                      SizedBox(height: sizeH20,),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.createCategories(),
                      ),
                      
                      
                    ],
                  ):Container(),
                  
                  sectionsData['type'] != 'restaurants' && sectionsData['type'] != 'sweets' && sectionsData['type'] != 'flowers'&&sectionsData['type'] != 'events'? MaterialButton(
                    elevation: 0,
                    color: primaryColor,
                    minWidth: Get.width / 1.1,
                    height: sizeH50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(sizeW15),
                    ),
                    onPressed: (){
                      if(General.token != ''){
                        if(sectionsData['type'] == 'halls'){
                          if(controller.amOrpm.value != ''){
                            controller.getAddBasket();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Choose morning or evening'.tr)),
                            );
                          }
                        }

                        if(sectionsData['type'] == 'photographers'){
                          if(controller.packageChoose.value >0){
                            controller.getAddBasketPackages(item.id);
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Choose package'.tr)),
                            );
                          }
                        }

                        if(sectionsData['type'] == 'salons'){
                          var total = 0.0;
                          if(controller.serviceChooses.isNotEmpty){
                            for (var map in controller.serviceChooses) {
                              if (map.containsKey("id")) {
                                total = total+ double.parse(map["total"].toString());
                              }
                            }
                            print(controller.serviceChooses);
                            controller.getEditBasketServices(total);
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Choose services'.tr)),
                            );
                          }
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
                  ):Container(),
                  SizedBox(height: sectionsData['type'] != 'restaurants' && sectionsData['type'] != 'sweets' && sectionsData['type'] != 'flowers'&&sectionsData['type'] != 'events'?sizeH20:0,),
                  SizedBox(height: sizeH20,),
                 
                ],
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
