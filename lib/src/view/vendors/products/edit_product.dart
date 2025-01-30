// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shlat/constance.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../controller/images_controller.dart';
import 'controllers/edit_product_controller.dart';

class EditProduct extends StatelessWidget {
  EditProduct({Key? key,this.providerData}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var providerData;
  final EditProductController controller = Get.put(EditProductController());
  final ImagesController imagescontroller = Get.put(ImagesController(), permanent: true);
  late Timer timer;
  @override
  Widget build(BuildContext context) {
    final pageIndexNotifier = ValueNotifier(0);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        
        title: Text('edit product'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: whitecolor)),
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
                  Row(
                    children: [
                      Text('${'name one'.tr} ${'al'.tr}${providerData['section']['category_name']}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    readOnly: true,
                    controller: controller.sectionId,
                    onTap: (){
                      WoltModalSheet.show<void>(
                        pageIndexNotifier: pageIndexNotifier,
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [
                            controller.page1(modalSheetContext),
                          ];
                        },
                        modalTypeBuilder: (context) {
                          return WoltModalType.bottomSheet();
                        },
                        onModalDismissedWithBarrierTap: () {
                          debugPrint('Closed modal sheet with barrier tap');
                          Navigator.of(context).pop();
                          pageIndexNotifier.value = 0;
                        },
                        // maxDialogWidth: 560,
                        // minDialogWidth: 400,
                        // minPageHeight: 0.0,
                        // maxPageHeight: Get.height /2,
                      );
                    },
                    decoration:  InputDecoration(
                      hintText: controller.sectionName.value == ''? '${'al'.tr}${providerData['section']['category_name']}':controller.sectionName.value,
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
                      labelStyle:   TextStyle(
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
                  Row(
                    children: [
                      Text('product name'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.title,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr}  ${'product name'.tr}',
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
                  Row(
                    children: [
                      Text('product price'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.number,
                    controller: controller.price,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr}  ${'product price'.tr}',
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
                  Row(
                    children: [
                      Text('product note'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.note,
                    maxLines: 5,
                    decoration:  InputDecoration(
                      hintText: 'product note'.tr,
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
                  ),
                  SizedBox(height: sizeH15,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('size price'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                        ],
                      ),
                      SizedBox(height: sizeH10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.createSizes(context,pageIndexNotifier),
                      )
                    ],
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
                      WoltModalSheet.show<void>(
                        pageIndexNotifier: pageIndexNotifier,
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [
                            controller.addSizes(modalSheetContext),
                          ];
                        },
                        modalTypeBuilder: (context) {
                          return WoltModalType.bottomSheet();
                        },
                        onModalDismissedWithBarrierTap: () {
                          debugPrint('Closed modal sheet with barrier tap');
                          Navigator.of(context).pop();
                          pageIndexNotifier.value = 0;
                        },
                        // maxDialogWidth: 560,
                        // minDialogWidth: 400,
                        // minPageHeight: 0.0,
                        // maxPageHeight: Get.height /2,
                      );
                    },
                    child: Text(
                      'add'.tr,
                      style:  TextStyle(
                        fontSize: sizeW16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  //
                  SizedBox(height: sizeH15,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('addtions price'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                        ],
                      ),
                      SizedBox(height: sizeH10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.createAdds(context,pageIndexNotifier),
                      ),
                    ],
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
                      WoltModalSheet.show<void>(
                        pageIndexNotifier: pageIndexNotifier,
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [
                            controller.addAdds(modalSheetContext),
                          ];
                        },
                        modalTypeBuilder: (context) {
                          return WoltModalType.bottomSheet();
                        },
                        onModalDismissedWithBarrierTap: () {
                          debugPrint('Closed modal sheet with barrier tap');
                          Navigator.of(context).pop();
                          pageIndexNotifier.value = 0;
                        },
                        // maxDialogWidth: 560,
                        // minDialogWidth: 400,
                        // minPageHeight: 0.0,
                        // maxPageHeight: Get.height /2,
                      );
                     
                    },
                    child: Text(
                      'add'.tr,
                      style:  TextStyle(
                        fontSize: sizeW16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: sizeH15,),
                  Row(
                    children: [
                      Text('${'upload'.tr} ${'image'.tr} ${'product'.tr}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH15,),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          maxRadius: sizeW65,
                          minRadius: sizeW65,
                          backgroundImage: NetworkImage(controller.oldImageUrl.value),
                        ),
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
                                  onPressed: () async{
                                    await imagescontroller.getImage(ImageSource.camera);
                                    Navigator.pop(context);
                                    timer =  Timer(const Duration(seconds: 3), () {
                                      controller.editProduct(imagescontroller.image.value);
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
                                      controller.editProduct(imagescontroller.image.value);
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
                      ],
                    ),
                  ),
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
                  controller.editProduct(imagescontroller.image.value).then((dsds){
                    Get.delete<ImagesController>();
                  });
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
        ),),
      ),
    );
  }
}
