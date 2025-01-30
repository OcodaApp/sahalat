// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'edit_profile.dart';

class ShowProfileView extends StatelessWidget {
  const ShowProfileView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        padding : const EdgeInsets.all(20),
        child: ListView(
          children:  [
            FadeInRight(
              child: const Text('Edit Profile',style: TextStyle(color: Color(0xFF36388E),fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                 Get.to(()=> EditProfileView());
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: const Color.fromARGB(31, 153, 152, 152).withOpacity(0.2),
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 20.0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/person2.png',width: 70,height: 70,fit: BoxFit.fill,),
                    const SizedBox(width: 25,),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mohammed Salem',style: TextStyle(color: Color(0xFF36388E),fontSize: 20,fontWeight: FontWeight.w600),),
                        SizedBox(height: 2,),
                        Text('mohammed@example.com',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 16,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40,),
            
            GestureDetector(
              onTap: (){
                 Get.to(()=> EditProfileView());
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: const Color(0xFFB0B0B0).withOpacity(0.1)),
                  ),
                ),
                child: Row(
                  children: [
                    FadeInDown(child:Image.asset('assets/profile/user.png',width: 16,height: 16,fit: BoxFit.fill,),),
                    const SizedBox(width: 15,),
                    const Text('Mustafa Emad',style: TextStyle(color: Color(0xFF808080),fontSize: 16,fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                 Get.to(()=> EditProfileView());
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: const Color(0xFFB0B0B0).withOpacity(0.1)),
                  ),
                ),
                child: Row(
                  children: [
                    FadeInDown(child:Image.asset('assets/profile/sms.png',width: 16,height: 16,fit: BoxFit.fill,),),
                    const SizedBox(width: 15,),
                    const Text('mustafa@example.com',style: TextStyle(color: Color(0xFF808080),fontSize: 16,fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                 Get.to(()=> EditProfileView());
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: const Color(0xFFB0B0B0).withOpacity(0.1)),
                  ),
                ),
                child: Row(
                  children: [
                    FadeInDown(child:Image.asset('assets/profile/mobile.png',width: 16,height: 16,fit: BoxFit.fill,),),
                    const SizedBox(width: 15,),
                    const Text('+966 10 12345678',style: TextStyle(color: Color(0xFF808080),fontSize: 16,fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                 Get.to(()=> EditProfileView());
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: const Color(0xFFB0B0B0).withOpacity(0.1)),
                  ),
                ),
                child: Row(
                  children: [
                    FadeInDown(child:Image.asset('assets/profile/man.png',width: 16,height: 16,fit: BoxFit.fill,),),
                    const SizedBox(width: 15,),
                    const Text('Male',style: TextStyle(color: Color(0xFF808080),fontSize: 16,fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                 Get.to(()=> EditProfileView());
              },
              child: Row(
                children: [
                  FadeInDown(child:Image.asset('assets/profile/calendar-2.png',width: 16,height: 16,fit: BoxFit.fill,),),
                  const SizedBox(width: 15,),
                  const Text('Birthday : 19/03/1999',style: TextStyle(color: Color(0xFF808080),fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
            
            
            

          ],
        ),
      ),
    );
  }
}
