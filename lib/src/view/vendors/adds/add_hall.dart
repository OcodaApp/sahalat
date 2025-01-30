// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shlat/constance.dart';
import '../../../controller/images_controller.dart';
import 'controllers/add_provider_controller.dart';
import 'dart:math' as math;

class AddHall extends StatelessWidget {
  double? lat,long;
  String? street;
  int? section;
  var sectionData;
  AddHall({Key? key,this.lat,this.long,this.street,this.section,this.sectionData}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final ImagesController imagescontroller = Get.put(ImagesController());
  final AddProviderController controller = Get.put(AddProviderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        title: Text(sectionData.headertitle,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: whitecolor)),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        padding: EdgeInsets.all(sizeW15),
        child: Obx(() => ListView(
          children: [
            SizedBox(height: sizeH10,),
            Row(
              children: [
                Text('${'upload'.tr} ${'image'.tr}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
              ],
            ),
            SizedBox(height: sizeH15,),
            GestureDetector(
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
                      onPressed: () {
                        imagescontroller
                              .getImage(ImageSource.camera);
                          Navigator.pop(context);
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
                      onPressed: () {
                        imagescontroller
                              .getImage(ImageSource.gallery);
                          Navigator.pop(context);
                      },
                    )
                  ],
                );
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => action,
                );
              },
              child: imagescontroller.imageUrl.value == ''?
              Image.asset('assets/icons/upload.png',width: Get.width /2,height: sizeH100,):
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: sizeW65,
                      minRadius: sizeW65,
                      backgroundImage: NetworkImage(imagescontroller.imageUrl.value),
                    ),
                    CircleAvatar(
                      maxRadius: sizeW65,
                      minRadius: sizeW65,
                      backgroundColor: Colors.black.withOpacity(.4),
                      child: const Center(
                        child: Icon(Icons.edit,color: whitecolor,),
                      ),
                    ),
                  ],
                ),
              )
            ),

            
            SizedBox(height: sizeH15,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(sectionData.dataname,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.title,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${sectionData.dataname}',
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
                          color: greyOpacityColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1.5,
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
                  sectionData.type == 'photographers'? Row(
                    children: [
                      Text('category name'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: sectionData.type == 'photographers'?sizeH10:0,),
                  sectionData.type == 'photographers'?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.categoryName,
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
                          color: greyOpacityColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1.5,
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
                  SizedBox(height: sectionData.type == 'photographers'?sizeH15:0,),
                  sectionData.isaddress? Row(
                    children: [
                      Text('the address'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: sectionData.isaddress?sizeH10:0,),
                  sectionData.isaddress?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.locationName,
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
                          color: greyOpacityColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1.5,
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
                  SizedBox(height: sectionData.isaddress?sizeH15:0,),
                  sectionData.isopenclose? Row(
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
                              keyboardType : TextInputType.text,
                              controller: controller.fromTime,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                TimeOfDay time = TimeOfDay.now();
                                FocusScope.of(context).requestFocus(FocusNode());

                                TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                if (picked != null && picked != time) {
                                  controller.fromTime.text = '${picked.hour}:${picked.minute}';
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
                                    color: greyOpacityColor,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
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
                              keyboardType : TextInputType.text,
                              controller: controller.toTime,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                TimeOfDay time = TimeOfDay.now();
                                FocusScope.of(context).requestFocus(FocusNode());

                                TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                if (picked != null && picked != time) {
                                  controller.toTime.text = '${picked.hour}:${picked.minute}';
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
                                    color: greyOpacityColor,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
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
                  SizedBox(height: sectionData.isopenclose?sizeH15:0,),
                  //categories
                  // sectionData.iscategories ? Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Text(sectionData.categoriesdesc,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                  //       ],
                  //     ),
                  //     SizedBox(height: sizeH10,),
                  //     TextFormField(
                  //       autovalidateMode: AutovalidateMode.onUserInteraction,
                  //       keyboardType : TextInputType.text,
                  //       decoration:  InputDecoration(
                  //         hintText: '${'Enter'.tr} ${'name one'.tr} ${'al'.tr}${sectionData.categoryname}',
                  //         contentPadding: EdgeInsets.only(
                  //           top: 0,
                  //           bottom: 0,
                  //           right: sizeW15,
                  //           left: sizeW15,
                  //         ),
                  //         border:  OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //           borderSide: const BorderSide(
                  //             color: greyOpacityColor,
                  //             width:1.5,
                  //           ),
                  //         ),
                  //         hintStyle:  TextStyle(
                  //           fontSize: sizeW16,
                  //           color: greyOpacityColor,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                          
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                  //           borderSide: const BorderSide(
                  //             color: greyOpacityColor,
                  //             width: 1.5,
                  //           ),
                  //         ),
                  //         focusedBorder:  OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //           borderSide: const BorderSide(
                  //             color: primaryColor,
                  //             width: 1.5,
                  //           ),
                  //         ),
                  //       ),
                  //       style:  TextStyle(
                  //         fontSize: sizeW16,
                  //         color: blackolor,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //       validator: (value) {
                  //         return null;
                  //       },
                  //     ),
                  //     SizedBox(height: sizeH10,),
                  //     TextFormField(
                  //       autovalidateMode: AutovalidateMode.onUserInteraction,
                  //       keyboardType : TextInputType.text,
                  //       decoration:  InputDecoration(
                  //       hintText: '${'Enter'.tr} ${'name one'.tr} ${'al'.tr}${sectionData.categoryname}',
                  //         contentPadding: EdgeInsets.only(
                  //           top: 0,
                  //           bottom: 0,
                  //           right: sizeW15,
                  //           left: sizeW15,
                  //         ),
                  //         border:  OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //           borderSide: const BorderSide(
                  //             color: greyOpacityColor,
                  //             width:1.5,
                  //           ),
                  //         ),
                  //         hintStyle:  TextStyle(
                  //           fontSize: sizeW16,
                  //           color: greyOpacityColor,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                  //           borderSide: const BorderSide(
                  //             color: greyOpacityColor,
                  //             width: 1.5,
                  //           ),
                  //         ),
                  //         focusedBorder:  OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //           borderSide: const BorderSide(
                  //             color: primaryColor,
                  //             width: 1.5,
                  //           ),
                  //         ),
                  //       ),
                  //       style:  TextStyle(
                  //         fontSize: sizeW16,
                  //         color: blackolor,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //       validator: (value) {
                  //         return null;
                  //       },
                  //     ),
                  //     SizedBox(height: sizeH15,),
                  //     MaterialButton(
                  //       elevation: 0,
                  //       color: primaryColor,
                  //       minWidth: Get.width / 1.1,
                  //       height: sizeH50,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(sizeW15),
                  //       ),
                  //       onPressed: (){
                  //       },
                  //       child: Text(
                  //         '${'add'.tr} ${sectionData.categoryname} ${'Other'.tr}',
                  //         style:  TextStyle(
                  //           fontSize: sizeW16,
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(height: sectionData.iscategories?sizeH15:0,),
                  //   ],
                  // ):Container(),
                  
                  sectionData.ispersoncount?Row(
                    children: [
                      Text('Number of people'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: sectionData.ispersoncount?sizeH10:0,),
                  sectionData.ispersoncount?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.number,
                    controller: controller.personCount,
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
                          color: greyOpacityColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1.5,
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
                  SizedBox(height: sectionData.ispersoncount?sizeH15:0,),
                  sectionData.isprice? Row(
                    children: [
                      Text('price'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: sectionData.isprice?sizeH10:0,),
                  sectionData.isprice?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.number,
                    controller: controller.price,
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
                          color: greyOpacityColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1.5,
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
                  SizedBox(height: sectionData.isprice?sizeH15:0,),
                  sectionData.isdesc?Row(
                    children: [
                      Text(sectionData.descname,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: sectionData.isdesc?sizeH10:0,),
                  sectionData.isdesc?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.note,
                    maxLines: 5,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${sectionData.descname}',
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
                          color: greyOpacityColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1.5,
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
                  SizedBox(height: sectionData.isdesc?sizeH15:0,),
                  // sectionData.ispackages?Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Text('${'add'.tr} ${sectionData.packagesname}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: primaryColor)),
                  //       ],
                  //     ),
                  //     SizedBox(height: sizeH15,),
                  //     Row(
                  //       children: [
                  //         Text('${'name one'.tr} ${'al'.tr}${sectionData.packagename}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                  //       ],
                  //     ),
                  //     SizedBox(height: sizeH10,),
                  //     TextFormField(
                  //       autovalidateMode: AutovalidateMode.onUserInteraction,
                  //       keyboardType : TextInputType.text,
                  //       decoration:  InputDecoration(
                  //         hintText:'${'name one'.tr} ${'al'.tr}${sectionData.packagename}',
                  //         contentPadding: EdgeInsets.only(
                  //           top: 0,
                  //           bottom: 0,
                  //           right: sizeW15,
                  //           left: sizeW15,
                  //         ),
                  //         border:  OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //           borderSide: const BorderSide(
                  //             color: greyOpacityColor,
                  //             width:1.5,
                  //           ),
                  //         ),
                  //         hintStyle:  TextStyle(
                  //           fontSize: sizeW16,
                  //           color: greyOpacityColor,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                          
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                  //           borderSide: const BorderSide(
                  //             color: greyOpacityColor,
                  //             width: 1.5,
                  //           ),
                  //         ),
                  //         focusedBorder:  OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //           borderSide: const BorderSide(
                  //             color: primaryColor,
                  //             width: 1.5,
                  //           ),
                  //         ),
                  //       ),
                  //       style:  TextStyle(
                  //         fontSize: sizeW16,
                  //         color: blackolor,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //       validator: (value) {
                  //         return null;
                  //       },
                  //     ),
                  //     SizedBox(height: sizeH15,),
                  //     Row(
                  //         children: [
                  //           Text('${'price one'.tr} ${'al'.tr}${sectionData.packagename}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                  //         ],
                  //       ),
                  //       SizedBox(height: sizeH10,),
                  //       TextFormField(
                  //         autovalidateMode: AutovalidateMode.onUserInteraction,
                  //         keyboardType : TextInputType.text,
                  //         decoration:  InputDecoration(
                  //           hintText: '${'price one'.tr} ${'al'.tr}${sectionData.packagename}',
                  //           contentPadding: EdgeInsets.only(
                  //             top: 0,
                  //             bottom: 0,
                  //             right: sizeW15,
                  //             left: sizeW15,
                  //           ),
                  //           border:  OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //             borderSide: const BorderSide(
                  //               color: greyOpacityColor,
                  //               width:1.5,
                  //             ),
                  //           ),
                  //           hintStyle:  TextStyle(
                  //             fontSize: sizeW16,
                  //             color: greyOpacityColor,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                            
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                  //             borderSide: const BorderSide(
                  //               color: greyOpacityColor,
                  //               width: 1.5,
                  //             ),
                  //           ),
                  //           focusedBorder:  OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //             borderSide: const BorderSide(
                  //               color: primaryColor,
                  //               width: 1.5,
                  //             ),
                  //           ),
                  //         ),
                  //         style:  TextStyle(
                  //           fontSize: sizeW16,
                  //           color: blackolor,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //         validator: (value) {
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(height: sizeH15,),
                  //       Row(
                  //         children: [
                  //           Text('${'details'.tr} ${'al'.tr}${sectionData.packagename}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                  //         ],
                  //       ),
                  //       SizedBox(height: sizeH10,),
                  //       TextFormField(
                  //         autovalidateMode: AutovalidateMode.onUserInteraction,
                  //         keyboardType : TextInputType.text,
                  //         maxLines: 5,
                  //         decoration:  InputDecoration(
                  //           hintText: '${'details'.tr} ${'al'.tr}${sectionData.packagename}',
                  //           contentPadding: EdgeInsets.only(
                  //             top: sizeH10,
                  //             bottom: sizeH10,
                  //             right: sizeW15,
                  //             left: sizeW15,
                  //           ),
                  //           border:  OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //             borderSide: const BorderSide(
                  //               color: greyOpacityColor,
                  //               width:1.5,
                  //             ),
                  //           ),
                  //           hintStyle:  TextStyle(
                  //             fontSize: sizeW16,
                  //             color: greyOpacityColor,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                            
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                  //             borderSide: const BorderSide(
                  //               color: greyOpacityColor,
                  //               width: 1.5,
                  //             ),
                  //           ),
                  //           focusedBorder:  OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                  //             borderSide: const BorderSide(
                  //               color: primaryColor,
                  //               width: 1.5,
                  //             ),
                  //           ),
                  //         ),
                  //         style:  TextStyle(
                  //           fontSize: sizeW16,
                  //           color: blackolor,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //         validator: (value) {
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(height: sizeH15,),
                  //       MaterialButton(
                  //         elevation: 0,
                  //         color: primaryColor,
                  //         minWidth: Get.width / 1.1,
                  //         height: sizeH50,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(sizeW15),
                  //         ),
                  //         onPressed: (){
                  //         },
                  //         child: Text(
                  //           '${'add'.tr} ${sectionData.packagename} ${'Other'.tr}',
                  //           style:  TextStyle(
                  //             fontSize: sizeW16,
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(height: sizeH15,),
                  //     //
                  //   ],
                  // ):Container(),
                  
                  
                  sectionData.isampm?Column(
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
                              keyboardType : TextInputType.text,
                              controller: controller.amFrom,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                TimeOfDay time = TimeOfDay.now();
                                FocusScope.of(context).requestFocus(FocusNode());

                                TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                if (picked != null && picked != time) {
                                  controller.amFrom.text = '${picked.hour}:${picked.minute}';
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
                                    color: greyOpacityColor,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
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
                              keyboardType : TextInputType.text,
                              controller: controller.amTo,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                TimeOfDay time = TimeOfDay.now();
                                FocusScope.of(context).requestFocus(FocusNode());

                                TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                if (picked != null && picked != time) {
                                  controller.amTo.text = '${picked.hour}:${picked.minute}';
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
                                    color: greyOpacityColor,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
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
                  SizedBox(height: sectionData.isampm?sizeH15:0,),
                  sectionData.isampm?Column(
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
                              keyboardType : TextInputType.text,
                              controller: controller.pmFrom,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                TimeOfDay time = TimeOfDay.now();
                                FocusScope.of(context).requestFocus(FocusNode());

                                TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                if (picked != null && picked != time) {
                                  controller.pmFrom.text = '${picked.hour}:${picked.minute}';
                                }
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
                                    color: greyOpacityColor,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
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
                              keyboardType : TextInputType.text,
                              controller: controller.pmTo,
                              inputFormatters: <TextInputFormatter>[
                                TimeTextInputFormatter() // This input formatter will do the job        
                              ],
                              onTap: () async {
                                TimeOfDay time = TimeOfDay.now();
                                FocusScope.of(context).requestFocus(FocusNode());

                                TimeOfDay? picked =await showTimePicker(context: context, initialTime: time);
                                if (picked != null && picked != time) {
                                  controller.pmTo.text = '${picked.hour}:${picked.minute}';
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
                                    color: greyOpacityColor,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
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
                  SizedBox(height: sectionData.isampm?sizeH15:0,),
                  sectionData.type == 'restaurants' || sectionData.type == 'sweets' || sectionData.type == 'flowers'? Row(
                    children: [
                      Text('delivery price'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: sectionData.type == 'restaurants' || sectionData.type == 'sweets' || sectionData.type == 'flowers'?sizeH10:0,),
                  sectionData.type == 'restaurants' || sectionData.type == 'sweets' || sectionData.type == 'flowers'?TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.number,
                    controller: controller.delivery,
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
                          color: greyOpacityColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: const BorderSide(
                          color: primaryColor,
                          width: 1.5,
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
                  SizedBox(height: sectionData.type == 'restaurants' || sectionData.type == 'sweets' || sectionData.type == 'flowers'?sizeH15:0,),
                  sectionData.isimages?Row(
                    children: [
                      Text(sectionData.imagesname,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ):Container(),
                  SizedBox(height: sectionData.isimages?sizeH15:0,),
                  sectionData.isimages && imagescontroller.imagesUrl.isNotEmpty? SizedBox(
                    height: sizeH80,
                    width: Get.width,
                    child: ListView.builder(
                      itemCount: imagescontroller.imagesUrl.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: sizeW100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(sizeW10),
                                    border: Border.all(color: primaryColor,width: 1),
                                    image: DecorationImage(
                                      image: NetworkImage(imagescontroller.imagesUrl[index]),
                                      fit: BoxFit.fill
                                    )
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    imagescontroller.imagesUrl.removeAt(index);
                                    imagescontroller.images.removeAt(index);
                                  },
                                  child: Container(
                                    width: sizeW100,
                                    
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(sizeW10),
                                      color: blackolor.withOpacity(.2),
                                    ),
                                    child: const Center(child: Icon(Icons.delete,color: Colors.red,),),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: sizeW10,)
                          ],
                        );
                      },
                    ),
                  ):Container(),
                  SizedBox(height: sectionData.isimages && imagescontroller.imagesUrl.isNotEmpty?sizeH15:0,),
                  sectionData.isimages?GestureDetector(
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
                            onPressed: () {
                              imagescontroller
                                    .getImageList(ImageSource.camera);
                                Navigator.pop(context);
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
                            onPressed: () {
                              imagescontroller
                                    .getImageList(ImageSource.gallery);
                                Navigator.pop(context);
                            },
                          )
                        ],
                      );
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => action,
                      );
                    },
                    child: Image.asset('assets/icons/upload.png',width: Get.width /2,height: sizeH100,),
                  ):Container(),
                  SizedBox(height: sectionData.isimages?sizeH15:0,),
                  
                ],
              ),
            ),
            SizedBox(height: sizeH15,),
            MaterialButton(
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
                  if(imagescontroller.image.value != ''){
                    if(imagescontroller.imagesUrl.isEmpty && sectionData.isimages){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${'upload'.tr} ${'images'.tr}')),
                      );
                    }else{
                      controller.addProvider(section,imagescontroller.image.value,street,lat,long,imagescontroller.images,context).then((dsds){
                        Get.delete<ImagesController>();
                      });
                    }
                    
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${'upload'.tr} ${'image'.tr}')),
                    );
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
            SizedBox(height: sizeH15,),
          ],
        ),)
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
