// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constance.dart';
import '../Cart/controller/cart_controller.dart';
import 'show_order_view.dart';


class MyOrdersView extends StatelessWidget {
  MyOrdersView({Key? key}) : super(key: key);
  final CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            FadeInDown(
              child: Container(
                color: primaryColor,
                height: Get.height / 4,
                padding: EdgeInsets.only(right: sizeW10,left: sizeW10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sizeH15,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_ios,color: whitecolor.withOpacity(.8),size: sizeW20,)),
                        SizedBox(width: sizeW5,),
                        Text('طلباتك',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                      ],
                    ),
                    SizedBox(height: sizeH15,),
                    Text('يمكنك تصفح طلباتك السابقة و الحالية ',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                    SizedBox(height: sizeH35,),
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          elevation: 0,
                          color: controller.ordertype.value == 1 ?whitecolor:primaryColor,
                          minWidth: Get.width / 2.2,
                          height: sizeH40,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(sizeW15),
                            side:  BorderSide(color: controller.ordertype.value == 1 ?primaryColor:whitecolor,)
                          ),
                          onPressed: (){
                            controller.ordertype.value = 1;
                          },
                          child: Text(
                            'الطلبات الحالية',
                            style:  TextStyle(
                              fontSize: sizeW16,
                              color: controller.ordertype.value == 1 ?primaryColor:whitecolor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        MaterialButton(
                          elevation: 0,
                          color: controller.ordertype.value == 2 ?whitecolor:primaryColor,
                          minWidth: Get.width / 2.2,
                          height: sizeH40,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(sizeW15),
                            side:  BorderSide(color: controller.ordertype.value == 2 ?primaryColor:whitecolor,)
                          ),
                          
                          onPressed: (){
                            controller.ordertype.value = 2;
                          },
                          child: Text(
                            'الطلبات السابقة',
                            style:  TextStyle(
                              fontSize: sizeW16,
                              color: controller.ordertype.value == 2 ?primaryColor:whitecolor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),),


                  ],
                ),
              )
            ),

            Obx(() => Visibility(
              visible: controller.ordertype.value == 0 ? true:false,
              child: SizedBox(
                height: Get.height / 1.5,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('لا توجد طلبات حالية الان',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                    SizedBox(height: sizeH10,),
                    Text(' استكشف الخدمات والمنتجات لإضافة العناصر',
                      style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400)
                      ,textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )),

            Obx(() => Visibility(
              visible: controller.ordertype.value == 1 ? true:false,
              child: Container(
                margin: EdgeInsets.all(sizeW15),
                child: Column(
                  children: [
                    SizedBox(height: sizeH10,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ShowOrderView(type : 'Order Placed'));
                      },
                      child: Container(
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
                            FadeInDown(
                              child: Container(
                                height : sizeW100,
                                width: sizeW100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(sizeW15),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/sections/image.jpeg',),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: sizeH15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('اسم القاعه',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH10,),
                                  Text('رقم الطلب 114857',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('الثلاثاء 15-1-2024 ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('قيد الانتظار',style: TextStyle(color: const Color(0xFFB80000),fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH20,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ShowOrderView(type : 'Order Placed'));
                      },
                      child: Container(
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
                            FadeInDown(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: whitecolor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: greyOpacityColor.withOpacity(.3),
                                      offset: const Offset(0, 0),
                                      blurRadius: 10.0,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset('assets/sections/item1.png',width: sizeW100,height: sizeW100,),
                                ),
                              ),
                            ),
                            SizedBox(width: sizeH15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('اسم المنتج',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH10,),
                                  Text('رقم الطلب 114857',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('الثلاثاء 15-1-2024 ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('قيد الانتظار',style: TextStyle(color: const Color(0xFFB80000),fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH20,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ShowOrderView(type : 'Order Placed'));
                      },
                      child: Container(
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
                            FadeInDown(
                              child: Container(
                                height : sizeW100,
                                width: sizeW100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(sizeW15),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/sections/image.jpeg',),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: sizeH15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('اسم القاعه',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH10,),
                                  Text('رقم الطلب 114857',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('الثلاثاء 15-1-2024 ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('قيد الانتظار',style: TextStyle(color: const Color(0xFFB80000),fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH20,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ShowOrderView(type : 'Order Placed'));
                      },
                      child: Container(
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
                            FadeInDown(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: whitecolor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: greyOpacityColor.withOpacity(.3),
                                      offset: const Offset(0, 0),
                                      blurRadius: 10.0,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset('assets/sections/item1.png',width: sizeW100,height: sizeW100,),
                                ),
                              ),
                            ),
                            SizedBox(width: sizeH15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('اسم المنتج',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH10,),
                                  Text('رقم الطلب 114857',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('الثلاثاء 15-1-2024 ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('قيد الانتظار',style: TextStyle(color: const Color(0xFFB80000),fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),),
             Obx(() => Visibility(
              visible: controller.ordertype.value == 2 ? true:false,
              child: Container(
                margin: EdgeInsets.all(sizeW15),
                child: Column(
                  children: [
                    SizedBox(height: sizeH10,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ShowOrderView(type : 'Order Placed'));
                      },
                      child: Container(
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
                            FadeInDown(
                              child: Container(
                                height : sizeW100,
                                width: sizeW100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(sizeW15),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/sections/image.jpeg',),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: sizeH15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('اسم القاعه',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH10,),
                                  Text('رقم الطلب 114857',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('الثلاثاء 15-1-2024 ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('اعادة الطلب',style: TextStyle(color: const Color(0xFF00B833),fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH20,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ShowOrderView(type : 'Order Placed'));
                      },
                      child: Container(
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
                            FadeInDown(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: whitecolor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: greyOpacityColor.withOpacity(.3),
                                      offset: const Offset(0, 0),
                                      blurRadius: 10.0,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset('assets/sections/item1.png',width: sizeW100,height: sizeW100,),
                                ),
                              ),
                            ),
                            SizedBox(width: sizeH15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('اسم المنتج',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH10,),
                                  Text('رقم الطلب 114857',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('الثلاثاء 15-1-2024 ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('اعادة الطلب',style: TextStyle(color: const Color(0xFF00B833),fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH20,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ShowOrderView(type : 'Order Placed'));
                      },
                      child: Container(
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
                            FadeInDown(
                              child: Container(
                                height : sizeW100,
                                width: sizeW100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(sizeW15),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/sections/image.jpeg',),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: sizeH15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('اسم القاعه',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH10,),
                                  Text('رقم الطلب 114857',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('الثلاثاء 15-1-2024 ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('اعادة الطلب',style: TextStyle(color: const Color(0xFF00B833),fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH20,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ShowOrderView(type : 'Order Placed'));
                      },
                      child: Container(
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
                            FadeInDown(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: whitecolor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: greyOpacityColor.withOpacity(.3),
                                      offset: const Offset(0, 0),
                                      blurRadius: 10.0,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset('assets/sections/item1.png',width: sizeW100,height: sizeW100,),
                                ),
                              ),
                            ),
                            SizedBox(width: sizeH15,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('اسم المنتج',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH10,),
                                  Text('رقم الطلب 114857',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('الثلاثاء 15-1-2024 ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                  SizedBox(height: sizeH5,),
                                  Text('اعادة الطلب',style: TextStyle(color: const Color(0xFF00B833),fontSize: sizeW14,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),),


            
            
          ],
        ),
      ),
    );
  }
}
