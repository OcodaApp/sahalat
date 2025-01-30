// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shlat/constance.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../controller/images_controller.dart';
import 'controllers/add_product_controller.dart';

class AddResProduct extends StatelessWidget {
  AddResProduct({Key? key,this.providerData}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var providerData;
  final AddProductController controller = Get.put(AddProductController());
  final ImagesController imagescontroller = Get.put(ImagesController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    final pageIndexNotifier = ValueNotifier(0);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        
        title: Text('add product'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: whitecolor)),
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
                      if(providerData['type'] != 'events'){
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
                      }else{
                        WoltModalSheet.show<void>(
                          pageIndexNotifier: pageIndexNotifier,
                          context: context,
                          pageListBuilder: (modalSheetContext) {
                            return [
                              controller.page2(modalSheetContext),
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
                      }
                      
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width / 1.8,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.text,
                              onChanged: (data) => controller.storeValueSize(1, data),
                              decoration:  InputDecoration(
                                hintText: '${'size'.tr} 1',
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
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2.9,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.number,
                              onChanged: (data) => controller.storeValuePrice(1, data),
                              decoration:  InputDecoration(
                                hintText: '${'price'.tr} 1',
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
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: sizeH15,),
                  ListView.builder(
                    itemCount: controller.listSizes.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) => controller.buildFieldSizes(i)
                  ),
                  MaterialButton(
                    elevation: 0,
                    color: primaryColor,
                    minWidth: Get.width / 1.1,
                    height: sizeH50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(sizeW15),
                    ),
                    onPressed: (){
                      controller.fieldCountSizez.value = controller.fieldCountSizez.value +1;
                      controller.listSizes.add(controller.buildFieldSizes(controller.fieldCountSizez.value));
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width / 1.8,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.text,
                              onChanged: (data) => controller.storeValueAdds(1, data),
                              decoration:  InputDecoration(
                                hintText: '${'addtion'.tr} 1',
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
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2.9,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.number,
                              onChanged: (data) => controller.storeValueAddsPrice(1, data),
                              decoration:  InputDecoration(
                                hintText: '${'price'.tr} 1',
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
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: sizeH15,),
                  ListView.builder(
                    itemCount: controller.listAdds.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) => controller.buildFieldAdds(i)
                  ),
                  MaterialButton(
                    elevation: 0,
                    color: primaryColor,
                    minWidth: Get.width / 1.1,
                    height: sizeH50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(sizeW15),
                    ),
                    onPressed: (){
                      controller.fieldCountAdds.value = controller.fieldCountAdds.value +1;
                      controller.listAdds.add(controller.buildFieldAdds(controller.fieldCountAdds.value));
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
                  if(imagescontroller.image.value != ''){
                    controller.addProduct(imagescontroller.image.value).then((dsds){
                      Get.delete<ImagesController>();
                    });
                    
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
        ),),
      ),
    );
  }
}
