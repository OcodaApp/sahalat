// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'thank_view.dart';

class PostComplainView extends StatelessWidget {
  PostComplainView({Key? key}) : super(key: key);
  final _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            FadeInRight(
              child: const Text('Complain',style: TextStyle(color: Color(0xFF36388E),fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 20,),
            Image.asset('assets/icons/ccc.png',height: Get.height /5.5,width: Get.width /3),
            const SizedBox(height: 20,),
            Form(
              key: _formKey2,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text('First Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF7D7D7D)),textAlign: TextAlign.center,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: 15,
                        left: 15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      
                      hintStyle:  TextStyle(
                        fontSize: 16,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 1,
                        ),
                      ),
                    ),
                    style:  const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB0B0B0),
                      fontWeight: FontWeight.w300,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter First Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Text('Last Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF7D7D7D)),textAlign: TextAlign.center,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.name,
                    decoration:  const InputDecoration(
                      hintText: 'Last Name',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: 15,
                        left: 15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: 16,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 1,
                        ),
                      ),
                    ),
                    style:  const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB0B0B0),
                      fontWeight: FontWeight.w300,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Last Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Text('Phone number',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF7D7D7D)),textAlign: TextAlign.center,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.name,
                    decoration:  const InputDecoration(
                      hintText: 'Phone number',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: 15,
                        left: 15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: 16,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 1,
                        ),
                      ),
                    ),
                    style:  const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB0B0B0),
                      fontWeight: FontWeight.w300,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Text('Email',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF7D7D7D)),textAlign: TextAlign.center,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.name,
                    decoration:  const InputDecoration(
                      hintText: 'Email',
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        right: 15,
                        left: 15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: 16,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 1,
                        ),
                      ),
                    ),
                    style:  const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB0B0B0),
                      fontWeight: FontWeight.w300,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  const Row(
                    children: [
                      Text('Your message',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF7D7D7D)),textAlign: TextAlign.center,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.name,
                    maxLines: 6,
                    decoration:  const InputDecoration(
                      hintText: 'Placeholder',
                      contentPadding: EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        right: 15,
                        left: 15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: 16,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 0.8,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          color: Color(0xFFB0B0B0),
                          width: 1,
                        ),
                      ),
                    ),
                    style:  const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB0B0B0),
                      fontWeight: FontWeight.w300,
                    ),
                    validator: (value) {
                      // if (value == null || value.isEmpty) {
                      //   return 'Please enter Delivering adress';
                      // }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  MaterialButton(
                    elevation: 0,
                    color: const Color(0xFF36388E),
                    minWidth: Get.width / 1.1,
                    height: 58,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    onPressed: (){
                      Get.to(()=>const ThankView());
                    },
                    child: const Text(
                      'Submit',
                      style:  TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
