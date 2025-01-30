// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shlat/utility/General.dart';

import '../../../constance.dart';
import '../../controller/lang_controller.dart';
import 'controllers/edit_profile_controller.dart';
class EditProfileView extends StatelessWidget {
  EditProfileView({Key? key}) : super(key: key);
  final _formKey2 = GlobalKey<FormState>();
  final EditProfileController controller = Get.put(EditProfileController());
  final LangController langController = Get.put(LangController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      backgroundColor: primaryColor,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            FadeInDown(
              child: Container(
                color: Colors.transparent,
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
                          child: Icon(Icons.arrow_back_ios,color: whitecolor.withOpacity(.8),size: sizeW20,),
                        ),
                        SizedBox(width: sizeW5,),
                        Text('Settings'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                      ],
                    ),
                  ],
                ),
              )
            ),
            Stack(
              children: [
                Container(
                  height: Get.height /1,
                  margin: EdgeInsets.only(top: sizeH100),
                  decoration: BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.circular(sizeW25),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: sizeH30),
                    child: FadeInDown(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Obx(() => !controller.isImage.value? CircleAvatar(
                                maxRadius: sizeW80,
                                minRadius: sizeW80,
                                backgroundColor: whitecolor,
                                backgroundImage: const AssetImage('assets/user.png',),
                              ):CircleAvatar(
                                maxRadius: sizeW80,
                                minRadius: sizeW80,
                                backgroundColor: whitecolor,
                                backgroundImage: NetworkImage(controller.imageUrl.value),
                              ),),
                              Positioned(
                                right: 15,
                                bottom: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.checkPermission();
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
                                            controller
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
                                            controller
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
                                  child: Icon(Icons.edit_square,color: primaryColor,weight: sizeW25,size: sizeW25,),
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: sizeH10,),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(right: sizeW15,left: sizeW15),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: Get.width /2,
                                          child: Text(General.username,
                                            style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(height: sizeH5,),
                                        SizedBox(
                                          width: Get.width /2,
                                          child: Text(
                                            General.email,
                                            style: TextStyle(color: grey3,fontSize: sizeW16,fontWeight: FontWeight.w300),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: ()async{
                                        if(controller.isEditShow.value){
                                          controller.isEditShow.value = false;
                                        }else{
                                          controller.isEditShow.value = true;
                                        }
                                      },
                                      child: Image.asset('assets/icons/edit-2.png',color: primaryColor,)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: sizeH15,),
                          Obx(() => Container(
                            margin: EdgeInsets.all(sizeW15),
                            child: Form(
                              key: _formKey2,
                              child: Column(
                                children: [
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType : TextInputType.name,
                                    controller: controller.name,
                                    readOnly: !controller.isEditShow.value ?true:false,
                                    decoration:  InputDecoration(
                                      hintText: 'Your Name'.tr,
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
                                      if (value!.length < 3) {
                                        return 'required'.tr;
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: sizeH10,),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType : TextInputType.phone,
                                    textDirection: TextDirection.ltr,
                                    controller: controller.phone,
                                    maxLength: 9,
                                    readOnly: !controller.isEditShow.value ?true:false,
                                    decoration:   InputDecoration(
                                      hintText: 'Phone'.tr,
                                      counterText: "",
                                      contentPadding: EdgeInsets.only(
                                        top: 0,
                                        bottom: 0,
                                        right: sizeW15,
                                        left: sizeW15,
                                      ),
                                      suffixIconConstraints:  BoxConstraints(
                                        minWidth: langController.appLocale == 'ar' ? 2:0,
                                        minHeight: langController.appLocale == 'ar' ? 2:0,
                                      ),
                                      suffixIcon: langController.appLocale == 'ar' ?Padding(
                                        padding:  EdgeInsets.only(right: sizeW10,left: sizeW10),
                                        child: Text('+966',style: TextStyle(color: blackolor,fontSize: sizeW16),textDirection: TextDirection.ltr,),
                                      ):Container(width: 0,),
                                      prefixIconConstraints:  BoxConstraints(
                                        minWidth: langController.appLocale == 'en' ? 2:0,
                                        minHeight: langController.appLocale == 'en' ? 2:0,
                                      ),
                                      prefixIcon: langController.appLocale == 'en' ?Padding(
                                        padding:  EdgeInsets.only(right: sizeW10,left: sizeW10),
                                        child: Text('+966',style: TextStyle(color: blackolor,fontSize: sizeW16),textDirection: TextDirection.ltr,),
                                      ):Container(width: 0,),
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
                                      if (!GetUtils.isPhoneNumber(value!)) {
                                        return 'Phone number is wrong'.tr;
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: sizeH10,),
                                  
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType : TextInputType.emailAddress,
                                    controller: controller.email,
                                    readOnly: !controller.isEditShow.value ?true:false,
                                    decoration:   InputDecoration(
                                      hintText: 'Email'.tr,
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
                                      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                                      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                                      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                                      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                                      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                                      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                                      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                                      final regex = RegExp(pattern);
                                      if(value!.isEmpty || !regex.hasMatch(value)){
                                        return 'Email is wrong'.tr;
                                      }else{
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: sizeH30,),
                                  controller.isEditShow.value ? MaterialButton(
                                    elevation: 0,
                                    color: primaryColor,
                                    minWidth: Get.width / 1.1,
                                    height: sizeH50,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(sizeW15),
                                    ),
                                    onPressed: (){
                                      if (!_formKey2.currentState!.validate()) {
                                      }else{
                                        controller.editUserData();
                                      }
                                    },
                                    child:Text(
                                      'save'.tr,
                                      style:  TextStyle(
                                        fontSize: sizeW22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ):Container(),
                                ],
                              ),
                            ),
                          ),),
                        ],
                      ),
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
