// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shlat/constance.dart';

import '../controllers/add_category_controller.dart';

class AddCategory extends StatelessWidget {
  AddCategory({Key? key,this.providerData}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var providerData;
  final AddCategoryController controller = Get.put(AddCategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text('${'add'.tr} ${providerData['section']['category_name']}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: whitecolor)),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        padding: EdgeInsets.all(sizeW15),
        child: ListView(
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
                    controller : controller.title,
                    decoration:  InputDecoration(
                      hintText: '${'Enter'.tr} ${'name one'.tr} ${'al'.tr}${providerData['section']['category_name']}',
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
                      if(value!.isEmpty){
                        return 'required'.tr;
                      }
                      return null;
                    },
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
                  controller.addCategory(providerData['id'], context);
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
        ),
      ),
    );
  }
}
