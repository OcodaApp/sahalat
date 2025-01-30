// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shlat/constance.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'controllers/add_service_controller.dart';

class AddService extends StatelessWidget {
  AddService({Key? key,this.providerData}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var providerData;
  final AddServiceController controller = Get.put(AddServiceController());
  @override
  Widget build(BuildContext context) {
    final pageIndexNotifier = ValueNotifier(0);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text('${'add'.tr} ${providerData['section']['service_name']}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: whitecolor)),
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
                      Text('category name'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
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
                      Text('${'name one'.tr} ${'al'.tr}${providerData['section']['service_name']}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: controller.title,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${'name one'.tr} ${'al'.tr}${providerData['section']['service_name']}',
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
                      Text('${'price one'.tr} ${'al'.tr}${providerData['section']['service_name']}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.number,
                    controller: controller.price,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${'price one'.tr} ${'al'.tr}${providerData['section']['service_name']}',
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
                      Text('${'place'.tr} ${'al'.tr}${providerData['section']['service_name']}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
                    ],
                  ),
                  SizedBox(height: sizeH10,),
                  GestureDetector(
                    onTap: (){
                      controller.inOrOut.value = 'in';
                    },
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(sizeW15),
                        border: Border.all(color: greyOpacityColor,width: 1.5)
                      ),
                      padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
                      child: Row(
                        children: [
                          Container(
                            width: sizeW20,
                            height: sizeW20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(sizeW45),
                              color: controller.inOrOut.value == 'in'? primaryColor: whitecolor,
                              border: Border.all(color: primaryColor,width: 1)
                            ),
                          ),
                          SizedBox(width: sizeW10,),
                          Text('Inside the salon'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: sizeH10,),
                  GestureDetector(
                    onTap: (){
                      controller.inOrOut.value = 'out';
                    },
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(sizeW15),
                        border: Border.all(color: greyOpacityColor,width: 1.5)
                      ),
                      padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
                      child: Row(
                        children: [
                          Container(
                            width: sizeW20,
                            height: sizeW20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(sizeW45),
                              color: controller.inOrOut.value == 'out'? primaryColor: whitecolor,
                              border: Border.all(color: primaryColor,width: 1)
                            ),
                          ),
                          SizedBox(width: sizeW10,),
                          Text('Outside the salon'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sizeH25,),
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
                  controller.addService();
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
