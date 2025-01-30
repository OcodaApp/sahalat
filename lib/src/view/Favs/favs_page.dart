
// ignore_for_file: must_be_immutable
import 'package:carousel_slider/carousel_slider.dart';
import '../../../constance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:page_route_transition/page_route_transition.dart';
import '../../../utility/General.dart';
import '../user/edit_location_map.dart';
import 'controllers/favs_controller.dart';

class FavsPage extends StatelessWidget {
  FavsPage({Key? key}) : super(key: key);
  final PageController introCarousel = PageController();
  final FavsController favscontroller = Get.put(FavsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      body: ListView(
        children:  [
          FadeInDown(
            child: SizedBox(
              height: Get.height / 3,
              child: Stack(
                children: [
                  Container(
                    height: Get.height / 3.4,
                    color: primaryColor,
                  ),
                  Obx(() => FadeInDown(
                    child: AppBar(
                      leading: Container(),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Text(favscontroller.address.value,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                      centerTitle: true,
                      actions: [
                        GestureDetector(
                          onTap: ()async{
                            PageRouteTransition.effect = TransitionEffect.fade;
                            await PageRouteTransition.push(context,  const EditMapSearchView());
                            favscontroller.address.value = General.address;
                          },
                          child: Row(
                            children: [
                              Icon(Icons.expand_more,color: whitecolor,size: sizeW25,),
                              SizedBox(width: sizeW15,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),),
                  FadeInLeft(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Obx(() => Container(
                        height: Get.height / 4,
                        margin:  EdgeInsets.only(right: sizeW15,left: sizeW15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: favscontroller.isSliders.value ? Stack(
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
                                  favscontroller.current.value = index;
                                  
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
                                            favscontroller.slidersData.length)
                                        .map(
                                      (int pageIndex) => Flexible(
                                        child: Container(
                                          width: favscontroller.current.value == pageIndex ? sizeW20:sizeW10,
                                          height: Get.width / 40,
                                          margin:  EdgeInsets.symmetric(
                                              vertical: Get.width / 120, horizontal: Get.width / 120,),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: favscontroller.current.value == pageIndex
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
                      ),)
                    ),
                  )
                ],
              ),
            ),
          ),
          
          Padding(
            padding:  EdgeInsets.all(sizeW10),
            child: Column(
              children: [
                SizedBox(height: sizeH10,),
                Obx(() => favscontroller.isProviders.value? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: favscontroller.providersData.isNotEmpty? favscontroller.createProviders():[
                    SizedBox(
                      height: Get.height / 2,
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Favorites are empty'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                          SizedBox(height: sizeH10,),
                          Text('Add your favorites and they will appear here'.tr,
                            style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400)
                            ,textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ):Container(),),

                General.token.trim() == "" ? SizedBox(
                  height: Get.height / 2,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('You are not logged in'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                      SizedBox(height: sizeH10,),
                      Text('Your favorites will be added after logging in'.tr,
                        style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400)
                        ,textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ):Container(),
                
              ],
            ),
          ),
          
          SizedBox(height: sizeH20,),
        ],
      ),
    );
  }

  List<Widget> createSliders() {
    List<Widget> imageSliders = favscontroller.slidersData.map((item) {
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
