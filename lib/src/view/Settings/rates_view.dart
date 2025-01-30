// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class RatesView extends StatelessWidget {
  const RatesView({Key? key}) : super(key: key);
  
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
              child: const Text('Rates',style: TextStyle(color: Color(0xFF36388E),fontSize: 20,fontWeight: FontWeight.w600),),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/store/r-logo.png',width: 17,height: 18,fit: BoxFit.fill,),
                      const SizedBox(width: 10,),
                      const Text('Restaurant name ',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('13 October 2023  2:45 Pm',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 5,),
                  const Text('Order ID: 13589874',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 10,),
                  const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 20,),
                  SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {
                    },
                    starCount: 5,
                    rating: 4,
                    size: 25.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star,
                    color: Colors.orange,
                    borderColor: Colors.orange,
                    spacing:5.0
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
                      Image.asset('assets/store/r-logo.png',width: 17,height: 18,fit: BoxFit.fill,),
                      const SizedBox(width: 10,),
                      const Text('Restaurant name ',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('13 October 2023  2:45 Pm',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 5,),
                  const Text('Order ID: 13589874',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 20,),
                  SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {
                    },
                    starCount: 5,
                    rating: 4,
                    size: 25.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star,
                    color: Colors.orange,
                    borderColor: Colors.orange,
                    spacing:5.0
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
                      Image.asset('assets/store/r-logo.png',width: 17,height: 18,fit: BoxFit.fill,),
                      const SizedBox(width: 10,),
                      const Text('Restaurant name ',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('13 October 2023  2:45 Pm',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 5,),
                  const Text('Order ID: 13589874',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 20,),
                  SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {
                    },
                    starCount: 5,
                    rating: 4,
                    size: 25.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star,
                    color: Colors.orange,
                    borderColor: Colors.orange,
                    spacing:5.0
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
                      Image.asset('assets/store/r-logo.png',width: 17,height: 18,fit: BoxFit.fill,),
                      const SizedBox(width: 10,),
                      const Text('Restaurant name ',style: TextStyle(color: Color(0xFF36388E),fontSize: 16,fontWeight: FontWeight.w600),),
                      
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('13 October 2023  2:45 Pm',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 5,),
                  const Text('Order ID: 13589874',style: TextStyle(color: Color(0xFF7D7D7D),fontSize: 14,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 20,),
                  SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {
                    },
                    starCount: 5,
                    rating: 4,
                    size: 25.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star,
                    color: Colors.orange,
                    borderColor: Colors.orange,
                    spacing:5.0
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
