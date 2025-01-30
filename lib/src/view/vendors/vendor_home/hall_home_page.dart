// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:async';

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:shlat/constance.dart';
import '../../../controller/images_controller.dart';
import '../../../controller/provider_controller.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';

import '../adds/categories/add_category.dart';
import '../adds/categories/categories.dart';
import '../adds/packs/add_pach.dart';
import '../adds/packs/packs.dart';
import '../adds/services/add_service.dart';
import '../adds/services/services_salon.dart';
import '../products/add_product.dart';
import '../products/res_products.dart';
class HallHomePage extends StatelessWidget {
  HallHomePage({Key? key,this.providerData,this.images2}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
   var providerData;
   var images2;
   final ProviderController controller = Get.put(ProviderController());
   final ImagesController imagescontroller = Get.put(ImagesController());
   late Timer timer;
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now().add(const Duration(days : 1));
    Time time = Time(hour: date.hour, minute: date.minute);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        title: Text(providerData['section']['header_title'],style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: whitecolor)),
        actions: [
          GestureDetector(
            onTap: (){
              if(controller.editShow.value){
                controller.editShow.value = false;
              }else{
                controller.editShow.value = true;
              }
            },
            child: Image.asset('assets/icons/edit-2.png',color: whitecolor,),
          ),
        ],
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        padding: EdgeInsets.all(sizeW15),
        child: Obx(() => ListView(
          children: [
            SizedBox(height: sizeH10,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          maxRadius: sizeW65,
                          minRadius: sizeW65,
                          backgroundImage: NetworkImage(controller.oldImageUrl.value),
                        ),
                        Visibility(
                          visible: controller.editShow.value,
                          child: GestureDetector(
                            onTap: () {
                              imagescontroller.checkPermission();
                              final action = CupertinoActionSheet(
                                title: Text(
                                  'change photo'.tr,
                                  style:  TextStyle(
                                    fontSize: sizeW15,
                                    color: blackolor,
                                  ),
                                ),
                                actions: <Widget>[
                                  CupertinoActionSheetAction(
                                    child: Text(
                                      'camera'.tr,
                                      style:  TextStyle(
                                        fontSize: sizeW15,
                                        color: primaryColor,
                                      ),
                                    ),
                                    onPressed: () async{
                                      await imagescontroller.getImage(ImageSource.camera);
                                      Navigator.pop(context);
                                      timer =  Timer(const Duration(seconds: 3), () {
                                        controller.editProvider(imagescontroller.image.value, context, providerData['id']);
                                      });
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text(
                                      'gallary'.tr,
                                      style:  TextStyle(
                                        fontSize: sizeW15,
                                        color: primaryColor,
                                      ),
                                    ),
                                    onPressed: () async{
                                      await imagescontroller.getImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                      timer =  Timer(const Duration(seconds: 3), () {
                                        controller.editProvider(imagescontroller.image.value, context, providerData['id']);
                                      });
                                    },
                                  )
                                ],
                              );
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) => action,
                              );
                            },
                            child: CircleAvatar(
                              maxRadius: sizeW65,
                              minRadius: sizeW65,
                              backgroundColor: Colors.black.withOpacity(.4),
                              child: const Center(
                                child: Icon(Icons.edit,color: whitecolor,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(providerData['section']['data_name'],style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.title,
                    readOnly: !controller.editShow.value ?true:false,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${providerData['section']['data_name']}',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: sizeW15,
                        left: sizeW15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: greyOpacityColor,
                          width:1.5,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: sizeW16,
                        color: greyOpacityColor,
                        fontWeight: FontWeight.w400,
                      ),
                      labelStyle:   TextStyle(
                        fontSize: sizeW16,
                        color: greyOpacityColor,
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: blackolor,
                      fontWeight: FontWeight.w400,
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'required'.tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: sizeH15,),
                  providerData['type'] == 'photographers'? Row(
                    children: [
                      Text('category name'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['type'] == 'photographers'?sizeH10:0,),
                  providerData['type'] == 'photographers'?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.categoryName,
                    readOnly: !controller.editShow.value ?true:false,
                    decoration:  InputDecoration(
                      hintText: 'Enter category name'.tr,
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: sizeW15,
                        left: sizeW15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: greyOpacityColor,
                          width:1.5,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: sizeW16,
                        color: greyOpacityColor,
                        fontWeight: FontWeight.w400,
                      ),
                      
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: blackolor,
                      fontWeight: FontWeight.w400,
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'required'.tr;
                      }
                      return null;
                    },
                  ):Container(),
                  SizedBox(height: providerData['type'] == 'photographers'?sizeH15:0,),
                  providerData['section']['is_address'] == 'yes'? Row(
                    children: [
                      Text('the address'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['section']['is_address'] == 'yes'?sizeH10:0,),
                  providerData['section']['is_address'] == 'yes'?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.locationName,
                    readOnly: !controller.editShow.value ?true:false,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${'the address'.tr}',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: sizeW15,
                        left: sizeW15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: greyOpacityColor,
                          width:1.5,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: sizeW16,
                        color: greyOpacityColor,
                        fontWeight: FontWeight.w400,
                      ),
                      
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: blackolor,
                      fontWeight: FontWeight.w400,
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'required'.tr;
                      }
                      return null;
                    },
                  ):Container(),
                  SizedBox(height: providerData['section']['is_address'] == 'yes'?sizeH15:0,),
                  providerData['section']['is_open_close'] == 'yes'? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width / 2.3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Opening date'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                              ],
                            ),
                            SizedBox(height: sizeH10,),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.number,
                              controller: controller.fromTime,
                              readOnly: false,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                if(controller.editShow.value){
                                  // TimeOfDay time = TimeOfDay.now();
                                  // FocusScope.of(context).requestFocus(FocusNode());

                                  // TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                  // if (picked != null && picked != time) {
                                  //   controller.fromTime.text = '${picked.hour}:${picked.minute}';
                                  // }
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
                                          controller.fromTime.text ='${value.hour}:${value.minute}';
                                        },
                                    ),
                                  );
                                }
                              },
                              decoration:  InputDecoration(
                                hintText: '12 : 00 PM',
                                suffixIcon: Icon(Icons.expand_more,color: const Color(0xFF797C7E),size: sizeW25,),
                                contentPadding: EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  right: sizeW15,
                                  left: sizeW15,
                                ),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: greyOpacityColor,
                                    width:1.5,
                                  ),
                                ),
                                hintStyle:  TextStyle(
                                  fontSize: sizeW16,
                                  color: greyOpacityColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              style:  TextStyle(
                                fontSize: sizeW16,
                                color: blackolor,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'required'.tr;
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 2.3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Closing time'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                              ],
                            ),
                            SizedBox(height: sizeH10,),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.number,
                              controller: controller.toTime,
                              readOnly: false,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                if(controller.editShow.value){
                                  // TimeOfDay time = TimeOfDay.now();
                                  // FocusScope.of(context).requestFocus(FocusNode());

                                  // TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                  // if (picked != null && picked != time) {
                                  //   controller.toTime.text = '${picked.hour}:${picked.minute}';
                                  // }

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
                                          controller.toTime.text ='${value.hour}:${value.minute}';
                                        },
                                    ),
                                  );
                                }
                              },
                              decoration:  InputDecoration(
                                hintText: '12 : 00 AM',
                                suffixIcon: Icon(Icons.expand_more,color: const Color(0xFF797C7E),size: sizeW25,),
                                contentPadding: EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  right: sizeW15,
                                  left: sizeW15,
                                ),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: greyOpacityColor,
                                    width:1.5,
                                  ),
                                ),
                                hintStyle:  TextStyle(
                                  fontSize: sizeW16,
                                  color: greyOpacityColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              style:  TextStyle(
                                fontSize: sizeW16,
                                color: blackolor,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'required'.tr;
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['section']['is_open_close'] == 'yes'?sizeH15:0,),
                  providerData['section']['is_person_count'] == 'yes'?Row(
                    children: [
                      Text('Number of people'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['section']['is_person_count'] == 'yes'?sizeH10:0,),
                  providerData['section']['is_person_count'] == 'yes'?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.number,
                    controller: controller.personCount,
                    readOnly: !controller.editShow.value ?true:false,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr}  ${'Number of people'.tr}',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: sizeW15,
                        left: sizeW15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: greyOpacityColor,
                          width:1.5,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: sizeW16,
                        color: greyOpacityColor,
                        fontWeight: FontWeight.w400,
                      ),
                      
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: blackolor,
                      fontWeight: FontWeight.w400,
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'required'.tr;
                      }
                      return null;
                    },
                  ):Container(),
                  SizedBox(height: providerData['section']['is_person_count'] == 'yes'?sizeH15:0,),
                  
                  providerData['section']['is_price'] == 'yes'? Row(
                    children: [
                      Text('price'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['section']['is_price'] == 'yes'?sizeH10:0,),
                  providerData['section']['is_price'] == 'yes'?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.number,
                    controller: controller.price,
                    readOnly: !controller.editShow.value ?true:false,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${'price'.tr}',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: sizeW15,
                        left: sizeW15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: greyOpacityColor,
                          width:1.5,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: sizeW16,
                        color: greyOpacityColor,
                        fontWeight: FontWeight.w400,
                      ),
                      
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: blackolor,
                      fontWeight: FontWeight.w400,
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'required'.tr;
                      }
                      return null;
                    },
                  ):Container(),
                  SizedBox(height: providerData['section']['is_price'] == 'yes'?sizeH15:0,),
                  providerData['section']['is_desc'] == 'yes'?Row(
                    children: [
                      Text(providerData['section']['desc_name'],style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['section']['is_desc'] == 'yes'?sizeH10:0,),
                  providerData['section']['is_desc'] == 'yes'?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.note,
                    readOnly: !controller.editShow.value ?true:false,
                    maxLines: 5,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${providerData['section']['desc_name']}',
                      contentPadding: EdgeInsets.only(
                        top: sizeH10,
                        bottom: sizeH10,
                        right: sizeW15,
                        left: sizeW15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: greyOpacityColor,
                          width:1.5,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: sizeW16,
                        color: greyOpacityColor,
                        fontWeight: FontWeight.w400,
                      ),
                      
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: blackolor,
                      fontWeight: FontWeight.w400,
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'required'.tr;
                      }
                      return null;
                    },
                  ):Container(),
                  SizedBox(height: providerData['section']['is_desc'] == 'yes'?sizeH15:0,),
                  
                  providerData['section']['is_am_pm'] == 'yes'?Column(
                    children: [
                      Row(
                        children: [
                          Text('Booking times in the morning'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                        ],
                      ),
                      SizedBox(height: sizeH10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width / 2.3,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.number,
                              controller: controller.amFrom,
                              readOnly: false,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                if(controller.editShow.value){
                                  // TimeOfDay time = TimeOfDay.now();
                                  // FocusScope.of(context).requestFocus(FocusNode());

                                  // TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                  // if (picked != null && picked != time) {
                                  //   controller.amFrom.text = '${picked.hour}:${picked.minute}';
                                  // }
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
                                          controller.amFrom.text ='${value.hour}:${value.minute}';
                                        },
                                    ),
                                  );
                                }
                              },
                              decoration:  InputDecoration(
                                hintText: '12 : 00 AM',
                                suffixIcon: Icon(Icons.expand_more,color: const Color(0xFF797C7E),size: sizeW25,),
                                prefixIcon: Padding(
                                  padding:  EdgeInsets.only(right: sizeW5,top: sizeH10),
                                  child: Text('from'.tr,style: TextStyle(fontSize: sizeW14,fontWeight: FontWeight.w400,color: const Color(0xFF797C7E),height: 1.5)),
                                ),
                                contentPadding: EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  right: sizeW15,
                                  left: sizeW15,
                                ),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: greyOpacityColor,
                                    width:1.5,
                                  ),
                                ),
                                hintStyle:  TextStyle(
                                  fontSize: sizeW14,
                                  color: greyOpacityColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              style:  TextStyle(
                                fontSize: sizeW16,
                                color: blackolor,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'required'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2.3,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.number,
                              controller: controller.amTo,
                              readOnly: false,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                if(controller.editShow.value){
                                  // TimeOfDay time = TimeOfDay.now();
                                  // FocusScope.of(context).requestFocus(FocusNode());

                                  // TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                  // if (picked != null && picked != time) {
                                  //   controller.amTo.text = '${picked.hour}:${picked.minute}';
                                  // }

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
                                          controller.amTo.text ='${value.hour}:${value.minute}';
                                        },
                                    ),
                                  );
                                }
                              },
                              decoration:  InputDecoration(
                                hintText: '12 : 00 AM',
                                suffixIcon: Icon(Icons.expand_more,color: const Color(0xFF797C7E),size: sizeW25,),
                                prefixIcon: Padding(
                                  padding:  EdgeInsets.only(right: sizeW5,top: sizeH10),
                                  child: Text('to'.tr,style: TextStyle(fontSize: sizeW14,fontWeight: FontWeight.w400,color: const Color(0xFF797C7E),height: 1.5)),
                                ),
                                contentPadding: EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  right: sizeW15,
                                  left: sizeW15,
                                ),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: greyOpacityColor,
                                    width:1.5,
                                  ),
                                ),
                                hintStyle:  TextStyle(
                                  fontSize: sizeW14,
                                  color: greyOpacityColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              style:  TextStyle(
                                fontSize: sizeW16,
                                color: blackolor,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'required'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['section']['is_am_pm'] == 'yes'?sizeH15:0,),
                  providerData['section']['is_am_pm'] == 'yes'?Column(
                    children: [
                      Row(
                        children: [
                          Text('Booking times are in the evening'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                        ],
                      ),
                      SizedBox(height: sizeH10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width / 2.3,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.number,
                              controller: controller.pmFrom,
                              readOnly: false,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                // TimeOfDay time = TimeOfDay.now();
                                // FocusScope.of(context).requestFocus(FocusNode());

                                // TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                // if (picked != null && picked != time) {
                                //   controller.pmFrom.text = '${picked.hour}:${picked.minute}';
                                // }
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
                                        controller.pmFrom.text ='${value.hour}:${value.minute}';
                                      },
                                  ),
                                );
                              },
                              decoration:  InputDecoration(
                                hintText: '12 : 00 PM',
                                suffixIcon: Icon(Icons.expand_more,color: const Color(0xFF797C7E),size: sizeW25,),
                                prefixIcon: Padding(
                                  padding:  EdgeInsets.only(right: sizeW5,top: sizeH10),
                                  child: Text('from'.tr,style: TextStyle(fontSize: sizeW14,fontWeight: FontWeight.w400,color: const Color(0xFF797C7E),height: 1.5)),
                                ),
                                contentPadding: EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  right: sizeW15,
                                  left: sizeW15,
                                ),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: greyOpacityColor,
                                    width:1.5,
                                  ),
                                ),
                                hintStyle:  TextStyle(
                                  fontSize: sizeW14,
                                  color: greyOpacityColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              style:  TextStyle(
                                fontSize: sizeW16,
                                color: blackolor,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'required'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2.3,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.number,
                              controller: controller.pmTo,
                              readOnly: false,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                // TimeOfDay time = TimeOfDay.now();
                                // FocusScope.of(context).requestFocus(FocusNode());

                                // TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                // if (picked != null && picked != time) {
                                //   controller.pmTo.text = '${picked.hour}:${picked.minute}';
                                // }
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
                                        controller.pmTo.text ='${value.hour}:${value.minute}';
                                      },
                                  ),
                                );
                              },
                              decoration:  InputDecoration(
                                hintText: '12 : 00 AM',
                                suffixIcon: Icon(Icons.expand_more,color: const Color(0xFF797C7E),size: sizeW25,),
                                prefixIcon: Padding(
                                  padding:  EdgeInsets.only(right: sizeW5,top: sizeH10),
                                  child: Text('to'.tr,style: TextStyle(fontSize: sizeW14,fontWeight: FontWeight.w400,color: const Color(0xFF797C7E),height: 1.5)),
                                ),
                                contentPadding: EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  right: sizeW15,
                                  left: sizeW15,
                                ),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: greyOpacityColor,
                                    width:1.5,
                                  ),
                                ),
                                hintStyle:  TextStyle(
                                  fontSize: sizeW14,
                                  color: greyOpacityColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              style:  TextStyle(
                                fontSize: sizeW16,
                                color: blackolor,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'required'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['section']['is_am_pm'] == 'yes'?sizeH15:0,),
                  providerData['type'] == 'restaurants' || providerData['type'] == 'sweets' || providerData['type'] == 'flowers'? Row(
                    children: [
                      Text('delivery price'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['type'] == 'restaurants' || providerData['type'] == 'sweets' || providerData['type'] == 'flowers'?sizeH10:0,),
                  providerData['type'] == 'restaurants' || providerData['type'] == 'sweets' || providerData['type'] == 'flowers'?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.delivery,
                    readOnly: !controller.editShow.value ?true:false,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${'delivery price'.tr}',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: sizeW15,
                        left: sizeW15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: greyOpacityColor,
                          width:1.5,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: sizeW16,
                        color: greyOpacityColor,
                        fontWeight: FontWeight.w400,
                      ),
                      
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: blackolor,
                      fontWeight: FontWeight.w400,
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'required'.tr;
                      }
                      return null;
                    },
                  ):Container(),
                  SizedBox(height: providerData['type'] == 'restaurants' || providerData['type'] == 'sweets' || providerData['type'] == 'flowers'?sizeH15:0,),
                  providerData['section']['is_images'] == 'yes'?Row(
                    children: [
                      Text(providerData['section']['images_name'],style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: providerData['section']['is_images'] == 'yes'?sizeH15:0,),
                 providerData['section']['is_images'] == 'yes'? Row(
                   children: [
                    Visibility(
                      visible: controller.editShow.value,
                      child: GestureDetector(
                        onTap: () {
                          imagescontroller.checkPermission();
                          final action = CupertinoActionSheet(
                            title: Text(
                              'change photo'.tr,
                              style:  TextStyle(
                                fontSize: sizeW15,
                                color: blackolor,
                              ),
                            ),
                            actions: <Widget>[
                              CupertinoActionSheetAction(
                                child: Text(
                                  'camera'.tr,
                                  style:  TextStyle(
                                    fontSize: sizeW15,
                                    color: primaryColor,
                                  ),
                                ),
                                onPressed: () async{
                                  await imagescontroller.getImage2(ImageSource.camera).then((cc){
                                    controller.addImage(imagescontroller.image2, providerData['id']);
                                  });
                                  timer =  Timer(const Duration(seconds: 3), () {
                                    controller.addImage(imagescontroller.image2.value, providerData['id']);
                                  });
                                  
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: Text(
                                  'gallary'.tr,
                                  style:  TextStyle(
                                    fontSize: sizeW15,
                                    color: primaryColor,
                                  ),
                                ),
                                onPressed: () async{
                                  await imagescontroller.getImage2(ImageSource.gallery).then((cc){
                                    Navigator.pop(context);
                                  });
                                  timer =  Timer(const Duration(seconds: 3), () {
                                    controller.addImage(imagescontroller.image2.value, providerData['id']);
                                  });
                                  
                                },
                              )
                            ],
                          );
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => action,
                          );
                        },
                        child: Container(
                          height: Get.height /7,
                          width: Get.width / 3.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(sizeW15),
                            color: greyOpacityColor,
                          ),
                          child: Center(
                            child: Container(
                              height : sizeW35,
                              width: sizeW35,
                              margin: EdgeInsets.all(sizeW5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(sizeW10),
                                border: Border.all(color: whitecolor,width: 1.5),
                              ),
                              child: Center(
                                child: Icon(Icons.add,size: sizeW25,color: whitecolor,),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(visible: controller.editShow.value,child: SizedBox(width: sizeW10,)),
                    providerData['section']['is_images'] == 'yes' && controller.oldImages.isNotEmpty?Expanded(
                      child: SizedBox(
                        height: Get.height /7,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: controller.oldImages.length,
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
                                                  image: NetworkImage(controller.oldImages[index]['image_url'],),
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
                              child: Row(
                                children: [
                                  SizedBox(
                                    height : Get.height / 7,
                                    width: Get.width / 3.2,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(sizeW15),
                                            image: DecorationImage(
                                              image: NetworkImage(controller.oldImages[index]['image_url'],),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: controller.editShow.value,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  controller.deleteImage(controller.oldImages[index]['id'],providerData['id']).then((vvv){
                                                    controller.oldImages.removeAt(index);
                                                  });
                                                },
                                                child: Container(
                                                  height : sizeH20,
                                                  width: sizeW25,
                                                  margin: EdgeInsets.all(sizeW5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(sizeW5),
                                                    border: Border.all(color: blackolor,width: 1.5),
                                                  ),
                                                  child: Center(
                                                    child: Icon(Icons.delete,size: sizeW15,),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: sizeW10,)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                     ):Container(),
                   ],
                 ):Container(),
                  SizedBox(height: providerData['section']['is_images'] == 'yes' && controller.oldImages.isNotEmpty?sizeH15:0,),
                ],
              ),
            ),
            SizedBox(height: sizeH15,),
            providerData['section']['is_categories'] == 'yes' ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  elevation: 0,
                  color: whitecolor,
                  minWidth: Get.width / 2.3,
                  height: sizeH50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: (){
                    PageRouteTransition.effect = TransitionEffect.topToBottom;
                    PageRouteTransition.push(context,  AddCategory(providerData : providerData));
                  },
                  child: Text(
                    '${'add'.tr} ${providerData['section']['category_name']}',
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                MaterialButton(
                  elevation: 0,
                  color: primaryColor,
                  minWidth: Get.width / 2.3,
                  height: sizeH50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                  ),
                  onPressed: (){
                    Get.to(()=> CategoriesView(providerData : providerData),arguments: [providerData['id']]);
                  },
                  child: Text(
                    '${providerData['section']['categories_name']}',
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: whitecolor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ):Container(),
            SizedBox(height: providerData['section']['is_categories'] == 'yes' ?sizeH15:0,),
            providerData['section']['is_packages'] == 'yes' ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  elevation: 0,
                  color: whitecolor,
                  minWidth: Get.width / 2.3,
                  height: sizeH50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: ()async{
                    await Get.to(()=>AddPackEvent(providerData : providerData),arguments: [providerData['id']]);
                  },
                  child: Text(
                    providerData['type'] != 'events'? 
                    '${'add'.tr} ${providerData['section']['package_name']}':
                    '${'add'.tr} ${providerData['section']['category_name']}',
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                MaterialButton(
                  elevation: 0,
                  color: primaryColor,
                  minWidth: Get.width / 2.3,
                  height: sizeH50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                  ),
                  onPressed: (){
                    Get.to(()=> PacksEventView(providerData : providerData),arguments: [providerData['id']]);
                  },
                  child: Text(
                    providerData['type'] != 'events'? 
                    '${providerData['section']['packages_name']}':
                    '${providerData['section']['categories_name']}',
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: whitecolor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ):Container(),
            SizedBox(height: providerData['section']['is_packages'] == 'yes' ?sizeH15:0,),
            providerData['section']['is_products'] == 'yes' ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  elevation: 0,
                  color: whitecolor,
                  minWidth: Get.width / 2.3,
                  height: sizeH50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: (){
                    Get.to(()=>AddResProduct(providerData : providerData),arguments: [providerData]);
                  },
                  child: Text(
                    'add product'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                MaterialButton(
                  elevation: 0,
                  color: primaryColor,
                  minWidth: Get.width / 2.3,
                  height: sizeH50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                  ),
                  onPressed: (){
                    Get.to(()=> ResProductsView(providerData : providerData),arguments: [providerData['id']]);
                  },
                  child: Text(
                    'products'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: whitecolor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ):Container(),
            SizedBox(height: providerData['section']['is_products'] == 'yes' ?sizeH15:0,),
            providerData['section']['is_services'] == 'yes'?Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  elevation: 0,
                  color: whitecolor,
                  minWidth: Get.width / 2.3,
                  height: sizeH50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: ()async{
                    await Get.to(()=>AddService(providerData : providerData),arguments: [providerData['id']]);
                  },
                  child: Text(
                    '${'add'.tr} ${providerData['section']['service_name']}',
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                MaterialButton(
                  elevation: 0,
                  color: primaryColor,
                  minWidth: Get.width / 2.3,
                  height: sizeH50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                  ),
                  onPressed: (){
                    Get.to(()=> ServiceSalon(providerData : providerData),arguments: [providerData['id']]);
                  },
                  child: Text(
                    '${providerData['section']['services_name']}',
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: whitecolor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ):Container(),
            SizedBox(height: providerData['section']['is_services'] == 'yes' ?sizeH15:0,),
            Visibility(
              visible: controller.editShow.value,
              child: MaterialButton(
                elevation: 0,
                color: primaryColor,
                minWidth: Get.width / 1.1,
                height: sizeH50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(sizeW15),
                ),
                onPressed: (){
                  if (!_formKey.currentState!.validate()) {

                  }else{
                    if(providerData['section']['is_images'] == 'yes'&& controller.oldImages.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${'upload'.tr} ${'images'.tr}')),
                      );
                    }else{
                      controller.editProvider(imagescontroller.image.value,context,providerData['id']).then((dsds){
                        Get.delete<ImagesController>();
                      });
                    }
                  }
                },
                child: Text(
                  'save'.tr,
                  style:  TextStyle(
                    fontSize: sizeW16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: sizeH15,),
          ],
        )),
      ),
    );
  }
}

class TimeTextInputFormatter extends TextInputFormatter {
  final RegExp _exp= RegExp(r'^[0-9:]+$');
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_exp.hasMatch(newValue.text)) {
      TextSelection newSelection = newValue.selection;

      String value = newValue.text;
      String newText;

      String leftChunk = '';
      String rightChunk = '';

      if (value.length >= 8) {
        if (value.substring(0, 7) == '00:00:0') {
          leftChunk = '00:00:';
          rightChunk = value.substring(leftChunk.length + 1, value.length);
        } else if (value.substring(0, 6) == '00:00:') {
          leftChunk = '00:0';
          rightChunk = "${value.substring(6, 7)}:${value.substring(7)}";
        } else if (value.substring(0, 4) == '00:0') {
          leftChunk = '00:';
          rightChunk = "${value.substring(4, 5)}${value.substring(6, 7)}:${value.substring(7)}";
        } else if (value.substring(0, 3) == '00:') {
          leftChunk = '0';
          rightChunk = "${value.substring(3, 4)}:${value.substring(4, 5)}${value.substring(6, 7)}:${value.substring(7, 8)}${value.substring(8)}";
        } else {
          leftChunk = '';
          rightChunk = "${value.substring(1, 2)}${value.substring(3, 4)}:${value.substring(4, 5)}${value.substring(6, 7)}:${value.substring(7)}";
        }
      } else if (value.length == 7) {
        if (value.substring(0, 7) == '00:00:0') {
          leftChunk = '';
          rightChunk = '';
        } else if (value.substring(0, 6) == '00:00:') {
          leftChunk = '00:00:0';
          rightChunk = value.substring(6, 7);
        } else if (value.substring(0, 1) == '0') {
          leftChunk = '00:';
          rightChunk = "${value.substring(1, 2)}${value.substring(3, 4)}:${value.substring(4, 5)}${value.substring(6, 7)}";
        } else {
          leftChunk = '';
          rightChunk = "${value.substring(1, 2)}${value.substring(3, 4)}:${value.substring(4, 5)}${value.substring(6, 7)}:${value.substring(7)}";
        }
      } else {
        leftChunk = '00:00:0';
        rightChunk = value;
      }

      if (oldValue.text.isNotEmpty && oldValue.text.substring(0, 1) != '0') {
        if (value.length > 7) {
          return oldValue;
        } else {
          leftChunk = '0';
          rightChunk = "${value.substring(0, 1)}:${value.substring(1, 2)}${value.substring(3, 4)}:${value.substring(4, 5)}${value.substring(6, 7)}";
        }
      }

      newText = leftChunk + rightChunk;

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(newText.length, newText.length),
        extentOffset: math.min(newText.length, newText.length),
      );

      return TextEditingValue(
        text: newText,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return oldValue;
  }
}
