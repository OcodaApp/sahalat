// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constance.dart';
import 'controllers/about_controller.dart';


class AboutView extends StatelessWidget {
   AboutView({Key? key}) : super(key: key);
  final PageController introCarousel = PageController();
  final AboutController controller = Get.put(AboutController());
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
            Stack(
              children: [
                FadeInDown(
                  child: Container(
                    color: primaryColor,
                    height: Get.height / 3.5,
                    padding: EdgeInsets.only(right: sizeW10,left: sizeW10),
                  )
                ),
                Container(
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
                          Text('About the app'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                        ],
                      ),
                    
                      SizedBox(height: sizeH25,),
                      Obx(() => Container(
                        height: Get.height / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW25),
                        ),
                        child: controller.isSliders.value ? Stack(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                height: Get.height,
                                viewportFraction: 1.0,
                                enlargeCenterPage: true,
                                autoPlay: false,
                                aspectRatio: 2.0,
                                initialPage: 0,
                                onPageChanged: (index, reason) {
                                  controller.current.value = index;

                                },
                              ),
                              // carouselController: introCarousel,
                              items:  createSliders() ,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: sizeH8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ...Iterable<int>.generate(
                                            controller.slidersData.length)
                                        .map(
                                      (int pageIndex) => Flexible(
                                        child: Container(
                                          width: controller.current.value == pageIndex ? sizeW20:sizeW10,
                                          height: Get.width / 40,
                                          margin:  EdgeInsets.symmetric(
                                              vertical: Get.width / 120, horizontal: Get.width / 120,),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: controller.current.value == pageIndex
                                                ? primaryColor
                                                : whitecolor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ):Container(),
                      ),),
                      SizedBox(height: sizeH15,),
                      Text('About the Sahalat application',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: primaryColor)),
                      SizedBox(height: sizeH10,),
                     
                      Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.createAbouts(),
                      )),
                      SizedBox(height: sizeH30,),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createSliders() {
    List<Widget> imageSliders = controller.slidersData.map((item) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sizeW25),
          image:  DecorationImage(
            image: NetworkImage('${item.img}',),
            fit: BoxFit.fill,
          ),
        ),
        width: Get.width,
        height: Get.height,
      );
    }).toList();
    return imageSliders;
  }
}
