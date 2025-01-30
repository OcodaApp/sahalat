// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constance.dart';
import '../../../utility/General.dart';
import '../home_view.dart';
import 'controllers/add_name_email_controller.dart';
import 'location_view.dart';
class AddNameEmail extends StatelessWidget {
  AddNameEmail({Key? key,this.user}) : super(key: key);
  final _formKey2 = GlobalKey<FormState>();
  final AddNameEmailController controller = Get.put(AddNameEmailController());
  var user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whitecolor,
        leading: Container(),
        elevation: 0,
      ),
      backgroundColor: whitecolor,
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
            FadeInUp(child: Text('add data'.tr,style: TextStyle(fontSize: sizeW25,fontWeight: FontWeight.w400,color: blackolor),textAlign: TextAlign.center,)),
            SizedBox(height: sizeH25,),
            FadeInLeft(
              child: Form(
                key: _formKey2,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.name,
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
                      keyboardType : TextInputType.emailAddress,
                      controller: controller.email,
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
                    MaterialButton(
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
                          controller.editUserData(user);
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
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: sizeH20,),
            GestureDetector(
              onTap: (){
                if(
                  user['user']['latitude'] != '' 
                  && user['user']['latitude'] != null
                  && user['user']['longitude'] != '' 
                  && user['user']['longitude'] != null 
                ){
                  General().setlatitude(double.parse(user['user']['latitude'].toString()));
                  General().setlongitude(double.parse(user['user']['longitude'].toString()));
                  General().setaddress(user['user']['address_text']);
                  General().getlatitude();
                  General().getlongitude();
                  General().getaddress().then((aaa){
                    Get.offAll(()=>const HomeView());
                  });
                }else{
                  Get.offAll(()=>const MapSearchView());
                }
              },
              child:  Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                       TextSpan(
                        text: 'You can skip'.tr,
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
