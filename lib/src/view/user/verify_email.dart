// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../constance.dart';
import 'controllers/verify_login_controller.dart';
class VerifyView extends StatelessWidget {
  String type,phone,code;
  VerifyView({Key? key,required this.type,required this.phone,required this.code}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController textEditingController = TextEditingController();
  final VerifyLoginController controller = Get.put(VerifyLoginController());
  String currentText = "";
  @override
  Widget build(BuildContext context) {
    textEditingController = TextEditingController(text: code);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: whitecolor,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios,color: blackolor,size: sizeW25,),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        padding: EdgeInsets.all(sizeW15),
        child: ListView(
          children: [
            FadeInDown(child: Image.asset('assets/logo.png',width: Get.width / 3.5,height: Get.height/8,fit: BoxFit.fitHeight,)),
            SizedBox(height: sizeH10,),
            FadeInDown(child: Image.asset('assets/shlattext.png',width: Get.width / 4.6,color: blackolor,height: sizeH20,)),
            SizedBox(height: sizeH50,),
            FadeInUp(child: Text('verification code'.tr,style: TextStyle(fontSize: sizeW25,fontWeight: FontWeight.w400,color: blackolor),textAlign: TextAlign.center,)),
            SizedBox(height: sizeH35,),
            FadeInUp(
              child: Text('${'We have sent you the 6-digit code to'.tr} $phone ${'Enter the code below to verify the phone number'.tr}',
              style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w300,color: grey3),textAlign: TextAlign.start,),
            ),
            SizedBox(height: sizeH30,),
            FadeInLeft(
              child: Form(
                key: formKey,
                child: Padding(
                  padding:EdgeInsets.only(
                    right: sizeW10,
                    left: sizeW10
                  ),
                  
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(
                      autoDisposeControllers: false,
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      
                      length: 6,
                      blinkWhenObscuring: true,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 6) {
                          return "code error".tr;
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(sizeW10),
                        fieldHeight: sizeH45,
                        fieldWidth: sizeW45,
                        activeFillColor: primaryColor,
                        inactiveColor: primaryColor,
                        activeColor : primaryColor,
                        selectedColor : primaryColor,
                        selectedFillColor : primaryColor,
                        borderWidth: 0.7,
                        activeBorderWidth: 2,
                        errorBorderColor: Colors.red,
                        errorBorderWidth: 1,
                        disabledBorderWidth: 0.7,
                        inactiveBorderWidth: 0.7,
                        selectedBorderWidth: 0.7,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: false,
                      keyboardType: TextInputType.number,
                      backgroundColor: Colors.transparent,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      onCompleted: (v) {
                        if(v == code){
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("code error".tr)));
                        }
                      },
                      onChanged: (value) {
                        debugPrint(value);
                        currentText = value;
                      },
                      beforeTextPaste: (text) {
                        if(text == code){
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("code error".tr)));
                        }
                        return true;
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: sizeH25,),
            FadeInRight(
              child: MaterialButton(
                elevation: 0,
                color: primaryColor,
                minWidth: Get.width / 1.1,
                height: sizeH50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(sizeW15),
                ),
                onPressed: (){
                  if(textEditingController.text == code){
                    controller.login(phone, context, type);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("code error".tr)));
                  }
                },
                child: Text(
                  'send'.tr,
                  style:  TextStyle(
                    fontSize: sizeW16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: sizeH20,),
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child:  Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                       TextSpan(
                        text: 'Didn’t recieve code?'.tr,
                        style:  TextStyle(
                          fontSize: sizeW16,
                          color: grey3,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'Request'.tr,
                        style:  TextStyle(
                          fontSize: sizeW16,
                          color: primaryColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
