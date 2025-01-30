import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:shlat/constance.dart';
import '../../controller/lang_controller.dart';
import 'controllers/sign_up_one_controller.dart';
import 'vendor_login.dart';

class VendorSignUpView extends StatelessWidget {
  VendorSignUpView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final SignUpOneController controller = Get.put(SignUpOneController());
  final LangController langController = Get.put(LangController());
  @override
  Widget build(BuildContext context) {
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
            FadeInUp(child: Text('Register'.tr,style: TextStyle(fontSize: sizeW25,fontWeight: FontWeight.w400,color: blackolor),textAlign: TextAlign.center,)),
            SizedBox(height: sizeH25,),
            FadeInLeft(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.text,
                      controller: controller.name,
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
                        if (value!.length < 3) {
                          return 'required'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: sizeH15,),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.phone,
                      textDirection: TextDirection.ltr,
                      controller: controller.phone,
                      maxLength: 9,
                      decoration:  InputDecoration(
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
                        if (!GetUtils.isPhoneNumber(value!)) {
                          return 'Phone number is wrong'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: sizeH15,),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.emailAddress,
                      controller: controller.email,
                      decoration:  InputDecoration(
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
                  ],
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
                  if (!_formKey.currentState!.validate()) {
                  }else{
                    controller.signUp(context);
                  }
                },
                child: Text(
                  'Register'.tr,
                  style:  TextStyle(
                    fontSize: sizeW16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: sizeH25,),
            GestureDetector(
              onTap: (){
                PageRouteTransition.effect = TransitionEffect.topToBottom;
                PageRouteTransition.push(context,  VendorLoginView());
              },
              child:  Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                       TextSpan(
                        text: 'do you have an account ?'.tr,
                        style:  TextStyle(
                          fontSize: sizeW16,
                          color: blackolor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Login'.tr,
                        style:  TextStyle(
                          fontSize: sizeW16,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
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
