// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);
  
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
              child: const Text('Notification',style: TextStyle(color: Color(0xFF36388E),fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 20,),
            const Text('Current Order',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
            const SizedBox(height: 15,),
            Container(
              width: Get.width / 1,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:  Colors.white,
                border: Border.all(color: const Color(0xFF36388E))
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order 417825',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      Text('Restaurant name',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      Text('13 october 2023',style: TextStyle(color: Color(0xFF36388E),fontSize: 12,fontWeight: FontWeight.w400),),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10,left: 5,top: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 15,
                          height: 85,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                maxRadius: 5,
                                minRadius: 5,
                                backgroundColor: Color(0xFF36388E),
                              ),
                              const SizedBox(height: 2,),
                              Container(
                                width: 1.5,
                                height: 70,
                                color: const Color(0xFF36388E),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                          height: 85,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                maxRadius: 5,
                                minRadius: 5,
                                backgroundColor: Color(0xFF36388E),
                              ),
                              const SizedBox(height: 2,),
                              Container(
                                width: 1.5,
                                height: 70,
                                color: const Color(0xFF36388E),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                          height: 100,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                maxRadius: 5,
                                minRadius: 5,
                                backgroundColor: Color(0xFF36388E),
                              ),
                              const SizedBox(height: 2,),
                              Container(
                                width: 1.5,
                                height: 70,
                                color: const Color(0xFF36388E),
                              ),
                              const SizedBox(height: 2,),
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  color:  const Color(0xFF36388E).withOpacity(.2),
                                ),
                                child: const CircleAvatar(
                                  maxRadius: 5,
                                  minRadius: 5,
                                  backgroundColor: Color(0xFF36388E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: Get.width /2.5,
                        child: Row(
                          children: [
                            FadeInDown(child:Image.asset('assets/icons/Frame 1261.png',width: 40,height: 45,fit: BoxFit.fill,),),
                            const SizedBox(width: 10,),
                            SizedBox(
                              width: Get.width /3.9,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Order is placed',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 16,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 2,),
                                  Text('9:12 pm',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: Get.width /2.5,
                        child: Row(
                          children: [
                            FadeInDown(child:Image.asset('assets/icons/Frame 93.png',width: 40,height: 45,fit: BoxFit.fill,),),
                            const SizedBox(width: 10,),
                            SizedBox(
                              width: Get.width /3.9,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Order is preparing',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 16,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 2,),
                                  Text('9:12 pm',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: Get.width /2.5,
                        child: Row(
                          children: [
                            FadeInDown(child:Image.asset('assets/icons/Asset 1-8 1.png',width: 40,height: 45,fit: BoxFit.fill,),),
                            const SizedBox(width: 10,),
                            SizedBox(
                              width: Get.width /3.9,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Order is prepared',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 16,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 2,),
                                  Text('9:12 pm',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: Get.width /2.5,
                        child: Row(
                          children: [
                            FadeInDown(child:Image.asset('assets/icons/Asset 4-88 1.png',width: 40,height: 45,fit: BoxFit.fill,),),
                            const SizedBox(width: 10,),
                            SizedBox(
                              width: Get.width /3.9,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Order is out for delivery',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 16,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 2,),
                                  Text('9:12 pm',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Text('Previews Orders',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(right: 5,left: 5),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color.fromARGB(31, 153, 152, 152).withOpacity(0.2),
                    offset: const Offset(0, 0),
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order 417825',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      Text('Restaurant name',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      Text('13 october 2023',style: TextStyle(color: Color(0xFF36388E),fontSize: 12,fontWeight: FontWeight.w400),),
                    ],
                  ),
                  
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FadeInDown(child:Image.asset('assets/icons/Frame 1259.png',width: 40,height: 45,fit: BoxFit.fill,),),
                        const SizedBox(width: 10,),
                        const Text('Deliverd',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(right: 5,left: 5),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color.fromARGB(31, 153, 152, 152).withOpacity(0.2),
                    offset: const Offset(0, 0),
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order 417825',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      Text('Restaurant name',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      Text('13 october 2023',style: TextStyle(color: Color(0xFF36388E),fontSize: 12,fontWeight: FontWeight.w400),),
                    ],
                  ),
                  
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FadeInDown(child:Image.asset('assets/icons/Asset124 1-8 1.png',width: 40,height: 45,fit: BoxFit.fill,),),
                        const SizedBox(width: 10,),
                        const Text('Cancelled',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(right: 5,left: 5),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color.fromARGB(31, 153, 152, 152).withOpacity(0.2),
                    offset: const Offset(0, 0),
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order 417825',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      Text('Restaurant name',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      Text('13 october 2023',style: TextStyle(color: Color(0xFF36388E),fontSize: 12,fontWeight: FontWeight.w400),),
                    ],
                  ),
                  
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FadeInDown(child:Image.asset('assets/icons/Frame 1259.png',width: 40,height: 45,fit: BoxFit.fill,),),
                        const SizedBox(width: 10,),
                        const Text('Deliverd',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            
           
          ],
        ),
      ),
    );
  }
}
