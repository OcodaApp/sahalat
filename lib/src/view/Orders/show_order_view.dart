// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';


class ShowOrderView extends StatelessWidget {
  String type = '';
  ShowOrderView({Key? key,required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Order details',style: TextStyle(color: Color(0xFF36388E),fontSize: 20,fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: FadeInDown(child:Image.asset('assets/icons/back.png',width: 25,height: 25,),),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [

            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFD9D9D9)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInDown(child:Image.asset('assets/store/r-logo.png',width: 32,height: 32,fit: BoxFit.fill,),),
                  const SizedBox(width: 15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Restaurant name',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w500),),
                      Text(type,style: const TextStyle(color: Color(0xFF41ADBB),fontSize: 14,fontWeight: FontWeight.w300),),
                      const Text('13 October 2023  2:45 Pm',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                      const Text('Order ID: 13589874',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFD9D9D9)),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeInDown(child:Image.asset('assets/marker.png',width: 24,height: 24,color: const Color(0xFF36388E),),),
                      const SizedBox(width: 15,),
                      const Text('Delivery Adress',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Text('Home ( Street - Block - building) City ',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            
            const Row(
              children: [
                Text('Order Summery',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF36388E)),),
              ],
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFD9D9D9)),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Beef burger',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      Text('4.50 SAR',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      Text('5 SAR',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('VAT',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      Text('0 SAR',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Grand Total',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      Text('4.50 SAR',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFF36388E))),
                Text('4.50 SAR',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF36388E))),
              ],
            ),
            const SizedBox(height: 5,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Payment method',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                Text('Credit Card',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                
                
              ],
            ),
            SizedBox(height: type == 'Deliverd' ?5:0,),
            type == 'Deliverd' ?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFD9D9D9)),
                      ),
                    ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery time',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                      Text('20 mins',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Rate your order',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFF36388E)),),
                const SizedBox(height: 10,),
                SmoothStarRating(
                  allowHalfRating: true,
                  onRatingChanged: (v) {
                  },
                  starCount: 5,
                  rating: 0,
                  size: 30.0,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star,
                  color: const Color(0xFFD9D9D9),
                  borderColor: const Color(0xFFD9D9D9),
                  spacing:5.0
                ),
              ],
            ):Container(),
            type == 'Out for delivery' ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Track order',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF36388E)),),
                const SizedBox(height: 10,),
                const Text('Your delivery rider ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF36388E)),),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FadeInDown(child:Image.asset('assets/profile/person3.png',width: 45,height: 45,fit: BoxFit.fill,),),
                        const SizedBox(width: 15,),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ahmed Khaled',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF36388E)),),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: 14,),
                                SizedBox(width: 2,),
                                Text('5.0',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF36388E)),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FadeInDown(child:Image.asset('assets/profile/phoeb.png',width: 35,height: 35,fit: BoxFit.fill,),),
                        const SizedBox(width: 15,),
                        FadeInDown(child:Image.asset('assets/profile/chatb.png',width: 35,height: 35,fit: BoxFit.fill,),),
                      ],
                    ),

                  ],
                ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Arrival estimated time',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF36388E))),
                    Text('9 : 12 PM ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF36388E))),
                  ],
                ),
                const SizedBox(height: 5,),
                const Text('The rider arrived to the branch',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D))),
                const SizedBox(height: 20,),
                FadeInDown(child:
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    child: Image.asset('assets/profile/map.png',width: Get.width,height: Get.height / 4,fit: BoxFit.fill,),
                  ),
                ),
              ],
            ):Container(),


            //
            SizedBox(height: type == 'Order Placed'? 35:0,),
            type == 'Order Placed'?FadeInUp(
              child: GestureDetector(
                onTap: (){
                },
                child: Container(
                  width: Get.width / 1.1,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color:  Colors.white,
                    border: Border.all(color: const Color(0xFF36388E))
                  ),
                  child: const Center(
                    child: Text(
                      'Cancel',
                      style:  TextStyle(
                        fontSize: 22,
                        color: Color(0xFF36388E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ):Container(),

            SizedBox(height: type == 'Order Preparing' || type == 'Out for delivery'? 35:0,),
            type == 'Order Preparing'|| type == 'Out for delivery'?FadeInUp(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width / 1.1,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color:  Colors.white,
                      border: Border.all(color: const Color(0xFFD9D9D9))
                    ),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style:  TextStyle(
                          fontSize: 22,
                          color: Color(0xFFD9D9D9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Text(
                    'Order is preparing and can’t be cancelled',
                    style:  TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7D7D7D),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ):Container(),
          ],
        ),
      ),
    );
  }
}
