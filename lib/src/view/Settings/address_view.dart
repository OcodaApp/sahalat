// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        padding : const EdgeInsets.all(10),
        child: ListView(
          children:  [
            const SizedBox(height: 10,),
            FadeInRight(
              child: const Text('Address book',style: TextStyle(color: Color(0xFF36388E),fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 25,),
            Container(
              width: Get.width / 1,
              padding: const EdgeInsets.only(right: 20,left: 20,top: 15,bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color:  const Color(0xFF36388E).withOpacity(.1),
                border: Border.all(color: const Color(0xFF36388E))
              ),
              child: Row(
                children: [
                  Image.asset('assets/profile/plus.png',height: 14,width: 14,fit: BoxFit.fill,),
                  const SizedBox(width: 10,),
                  const Text(
                    'Add new adress',
                    style:  TextStyle(
                      fontSize: 16,
                      color: Color(0xFF36388E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/marker.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 10,),
                      const Text('Home',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('25 ST - Wadi Ad-Dawasir - Riyadh',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w400),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                        height: 10,
                        child: Transform.scale(
                          scale: 0.7,
                          child: Radio(
                            value: 1,
                            groupValue: 1,
                            activeColor: const Color(0xFF36388E),
                            onChanged: (value) {
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text('Make as primary adress',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w400),),
                      const SizedBox(width: 20,),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Delete',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/profile/edit-2.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Edit',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                    ],
                  ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/marker.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 10,),
                      const Text('Work',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('25 ST - Wadi Ad-Dawasir - Riyadh',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w400),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                        height: 10,
                        child: Transform.scale(
                          scale: 0.7,
                          child: Radio(
                            value: 2,
                            groupValue: 1,
                            activeColor: const Color(0xFF36388E),
                            onChanged: (value) {
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text('Make as primary adress',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w400),),
                      const SizedBox(width: 20,),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Delete',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/profile/edit-2.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Edit',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                    ],
                  ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/marker.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 10,),
                      const Text('Work',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('25 ST - Wadi Ad-Dawasir - Riyadh',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w400),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                        height: 10,
                        child: Transform.scale(
                          scale: 0.7,
                          child: Radio(
                            value: 2,
                            groupValue: 1,
                            activeColor: const Color(0xFF36388E),
                            onChanged: (value) {
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text('Make as primary adress',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w400),),
                      const SizedBox(width: 20,),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Delete',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/profile/edit-2.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Edit',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                    ],
                  ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/marker.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 10,),
                      const Text('Work',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('25 ST - Wadi Ad-Dawasir - Riyadh',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w400),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                        height: 10,
                        child: Transform.scale(
                          scale: 0.7,
                          child: Radio(
                            value: 2,
                            groupValue: 1,
                            activeColor: const Color(0xFF36388E),
                            onChanged: (value) {
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text('Make as primary adress',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w400),),
                      const SizedBox(width: 20,),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Delete',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/profile/edit-2.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Edit',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                    ],
                  ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/marker.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 10,),
                      const Text('Work',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('25 ST - Wadi Ad-Dawasir - Riyadh',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w400),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                        height: 10,
                        child: Transform.scale(
                          scale: 0.7,
                          child: Radio(
                            value: 2,
                            groupValue: 1,
                            activeColor: const Color(0xFF36388E),
                            onChanged: (value) {
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text('Make as primary adress',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w400),),
                      const SizedBox(width: 20,),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Delete',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/profile/edit-2.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Edit',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                    ],
                  ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/marker.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 10,),
                      const Text('Work',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('25 ST - Wadi Ad-Dawasir - Riyadh',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w400),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                        height: 10,
                        child: Transform.scale(
                          scale: 0.7,
                          child: Radio(
                            value: 2,
                            groupValue: 1,
                            activeColor: const Color(0xFF36388E),
                            onChanged: (value) {
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text('Make as primary adress',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w400),),
                      const SizedBox(width: 20,),
                      Image.asset('assets/icons/trash.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Delete',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/profile/edit-2.png',width: 16,height: 16,fit: BoxFit.fill,color: const Color(0xFF36388E),),
                      const SizedBox(width: 2,),
                      const Text('Edit',style: TextStyle(color: Color(0xFF36388E),fontSize: 14,fontWeight: FontWeight.w600),),
                    ],
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
