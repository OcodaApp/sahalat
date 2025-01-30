// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shlat/src/view/home_view.dart';
import '../../../constance.dart';

class ThankView extends StatelessWidget {
  const ThankView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: FadeInRight(
          child: ListView(
            children: [
              FadeInDown(
                child: Container(
                  color: primaryColor,
                  padding: EdgeInsets.only(right: sizeW10,left: sizeW10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: sizeH15,),
                      Row(
                        children: [
                          Text('الرئيسية',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                          SizedBox(width: sizeW5,),
                          Icon(Icons.arrow_forward_ios,color: whitecolor.withOpacity(.8),size: sizeW20,),
                          SizedBox(width: sizeW5,),
                          Text('السلة',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                        ],
                      ),
                      SizedBox(height: sizeH15,),
                      Text('تاكيد الدفع',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                      SizedBox(height: sizeH20,),
                    ],
                  ),
                )
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: sizeH45,),
                  Image.asset('assets/icons/thank.png'),
                  SizedBox(height: sizeH20,),
                  Text('شكرا لك',style: TextStyle(color: primaryColor,fontSize: sizeW25,fontWeight: FontWeight.w700),),
                  Text('لقد تمت عملية الدفع بنجاح',style: TextStyle(color: primaryColor,fontSize: sizeW25,fontWeight: FontWeight.w700),),
                  SizedBox(height: sizeH25,),
                  Container(
                    margin:  EdgeInsets.all(sizeW15),
                    padding: EdgeInsets.all(sizeW15),
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(sizeW15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(31, 153, 152, 152).withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: sizeH10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width: sizeW5,height: sizeW5,decoration:  BoxDecoration(color: blackolor,borderRadius: BorderRadius.circular(sizeW45),)),
                            SizedBox(width: sizeW10,),
                            Text('رقم الطلب : 114857 ',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: sizeH10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width: sizeW5,height: sizeW5,decoration:  BoxDecoration(color: blackolor,borderRadius: BorderRadius.circular(sizeW45),)),
                            SizedBox(width: sizeW10,),
                            Text('التاريخ : 5/2/2024',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: sizeH10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width: sizeW5,height: sizeW5,decoration:  BoxDecoration(color: blackolor,borderRadius: BorderRadius.circular(sizeW45),)),
                            SizedBox(width: sizeW10,),
                            Text('رقم الجوال : 123456789 966+',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: sizeH10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width: sizeW5,height: sizeW5,decoration:  BoxDecoration(color: blackolor,borderRadius: BorderRadius.circular(sizeW45),)),
                            SizedBox(width: sizeW10,),
                            Text('البريد الالكترونى : info@gmail.com',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: sizeH10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width: sizeW5,height: sizeW5,decoration:  BoxDecoration(color: blackolor,borderRadius: BorderRadius.circular(sizeW45),)),
                            SizedBox(width: sizeW10,),
                            Text('الاجمالى : 700.00 ريال',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: sizeH10,),
                      ],
                    ),
                  ),
                  SizedBox(height: sizeH10,),
                  Padding(
                    padding: EdgeInsets.all(sizeW15),
                    child: Column(
                      children: [
                        Text('تم إرسال بريد إلكتروني تأكيد إلى عنوان البريد الإلكتروني المسجل',
                        style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                        SizedBox(height: sizeH20,),
                        MaterialButton(
                          elevation: 0,
                          color: primaryColor,
                          minWidth: Get.width / 1.1,
                          height: sizeH50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(sizeW15),
                          ),
                          onPressed: (){
                            Get.to(()=>const HomeView());
                          },
                          child: Text(
                            'الرئيسية',
                            style:  TextStyle(
                              fontSize: sizeW16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
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
      ),
    );
  }
}
