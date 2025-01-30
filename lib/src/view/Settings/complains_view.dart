// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplainsView extends StatelessWidget {
  const ComplainsView({Key? key}) : super(key: key);
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
              child: const Text('Complains',style: TextStyle(color: Color(0xFF36388E),fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/person2.png',width: 40,height: 45,fit: BoxFit.fill,),
                          const SizedBox(width: 10,),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('This is simply dummy text ',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                              SizedBox(height: 2,),
                              Text('13 october 2023',style: TextStyle(color: Color(0xFF36388E),fontSize: 12,fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,'
                    ,style: TextStyle(color: Color(0xFF999999),fontSize: 14,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/person2.png',width: 40,height: 45,fit: BoxFit.fill,),
                          const SizedBox(width: 10,),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('This is simply dummy text ',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                              SizedBox(height: 2,),
                              Text('13 october 2023',style: TextStyle(color: Color(0xFF36388E),fontSize: 12,fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,'
                    ,style: TextStyle(color: Color(0xFF999999),fontSize: 14,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/person2.png',width: 40,height: 45,fit: BoxFit.fill,),
                          const SizedBox(width: 10,),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('This is simply dummy text ',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                              SizedBox(height: 2,),
                              Text('13 october 2023',style: TextStyle(color: Color(0xFF36388E),fontSize: 12,fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,'
                    ,style: TextStyle(color: Color(0xFF999999),fontSize: 14,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/person2.png',width: 40,height: 45,fit: BoxFit.fill,),
                          const SizedBox(width: 10,),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('This is simply dummy text ',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                              SizedBox(height: 2,),
                              Text('13 october 2023',style: TextStyle(color: Color(0xFF36388E),fontSize: 12,fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,'
                    ,style: TextStyle(color: Color(0xFF999999),fontSize: 14,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
