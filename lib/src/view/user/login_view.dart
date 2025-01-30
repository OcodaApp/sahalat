import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:shlat/constance.dart';
import '../../controller/lang_controller.dart';
import '../vendors/vendor_sign_up.dart';
import 'controllers/login_controller.dart';
import 'location_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final LoginController controller = Get.put(LoginController());
  final LangController langController = Get.put(LangController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: whitecolor,
        leading: Container(),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: sizeW20,left: sizeW20,top: sizeH18),
            child: GestureDetector(
              onTap: (){
                PageRouteTransition.effect = TransitionEffect.fade;
                PageRouteTransition.pushReplacement(context,  const MapSearchView());
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Skip'.tr,
                  style:  TextStyle(
                    fontSize: sizeW16,
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
        
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
            FadeInUp(child: Text('Login page desc'.tr,style: TextStyle(fontSize: sizeW25,fontWeight: FontWeight.w400,color: blackolor),textAlign: TextAlign.center,)),
            SizedBox(height: sizeH25,),
            FadeInLeft(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.phone,
                      textDirection: TextDirection.ltr,
                      controller: controller.phone,
                      maxLength: 9,
                      decoration:  InputDecoration(
                        counterText: "",
                        hintText: 'Phone'.tr,
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
                  ],
                ),
              ),
            ),
            SizedBox(height: sizeH30,),
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
                    controller.userLogin(context);
                  }
                },
                child: Text(
                  'Login'.tr,
                  style:  TextStyle(
                    fontSize: sizeW16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            // SizedBox(height: sizeH25,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       width: Get.width / 5.2,
            //       height: 1,
            //       color: primaryColor,
            //     ),
            //     Text(
            //       'او انشاء حساب بواسطة',
            //       style:  TextStyle(
            //         fontSize: sizeW16,
            //         color: blackolor,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //     Container(
            //       width: Get.width / 5.2,
            //       height: 1,
            //       color: primaryColor,
            //     ),
            //   ],
            // ),
            // SizedBox(height: sizeH25,),
            // Container(
            //   margin: EdgeInsets.only(right: sizeW30,left: sizeW30),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         height: sizeH45,
            //         width: sizeW75,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(sizeW15),
            //           color:  Colors.white,
            //           border: Border.all(color: primaryColor)
            //         ),
            //         child: Center(
            //           child: Image.asset('assets/icons/apple.png'),
            //         ),
            //       ),
            //       Container(
            //         height: sizeH45,
            //         width: sizeW75,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(sizeW15),
            //           color:  Colors.white,
            //           border: Border.all(color: primaryColor)
            //         ),
            //         child: Center(
            //           child: Image.asset('assets/icons/gmail.png'),
            //         ),
            //       ),
            //       Container(
            //         height: sizeH45,
            //         width: sizeW75,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(sizeW15),
            //           color:  Colors.white,
            //           border: Border.all(color: primaryColor)
            //         ),
            //         child: Center(
            //           child: Image.asset('assets/icons/mail.png'),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            
            SizedBox(height: sizeH20,),
            GestureDetector(
              onTap: (){
                PageRouteTransition.effect = TransitionEffect.topToBottom;
                PageRouteTransition.push(context,  VendorSignUpView());
              },
              child:  Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                       TextSpan(
                        text: 'You can join us as a service provider'.tr,
                        style:  TextStyle(
                          fontSize: sizeW16,
                          color: blackolor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'from here'.tr,
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
