// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:shlat/constance.dart';
import '../../../utility/General.dart';
import '../../controller/home_user_controller.dart';
import '../../controller/lang_controller.dart';
import '../user/edit_location_map.dart';
import 'search_providers.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);
  final PageController introCarousel = PageController();
  final HomeUserController homeController = Get.put(HomeUserController());
  final LangController langController = Get.put(LangController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        homeController.getSlidersList();
        homeController.getSectionsList();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: primaryColor,),
        ),
        body: Obx(() => ListView(
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
                        title: Text(homeController.address.value,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                        centerTitle: true,
                        actions: [
                          GestureDetector(
                            onTap: ()async{
                              PageRouteTransition.effect = TransitionEffect.fade;
                              await PageRouteTransition.push(context,  const EditMapSearchView());
                              homeController.address.value = General.address;
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
                          child: homeController.isSliders.value ? Stack(
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
                                    homeController.current.value = index;
                                    
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
                                              homeController.slidersData.length)
                                          .map(
                                        (int pageIndex) => Flexible(
                                          child: Container(
                                            width: homeController.current.value == pageIndex ? sizeW20:sizeW10,
                                            height: Get.width / 40,
                                            margin:  EdgeInsets.symmetric(
                                                vertical: Get.width / 120, horizontal: Get.width / 120,),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: homeController.current.value == pageIndex
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
            SizedBox(height: sizeH5,),
            Container(
              margin: EdgeInsets.all(sizeH15),
              child: Column(
                children: [
                  
                  FadeInRight(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.text,
                      controller: homeController.searchForm,
                      onFieldSubmitted: (value){
                        if (value.isNotEmpty) {
                          Get.to(()=>SearchProviders(),arguments: [homeController.searchForm.text,homeController.searchForm.text]);
                        }
                      },
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          right: sizeW15,
                          left: sizeW15,
                        ),
                        prefixIcon: Image.asset('assets/icons/search.png',width: sizeW25,height: sizeH25,),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            Get.to(()=>SearchProviders(),arguments: [homeController.searchForm.text,homeController.searchForm.text]);
                          },
                          child: Container(
                            width: sizeW65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft:  Radius.circular(langController.appLocale == 'ar'?sizeW15:0),
                                bottomLeft: Radius.circular(langController.appLocale == 'ar'?sizeW15:0),
                                topRight:  Radius.circular(langController.appLocale == 'en'?sizeW15:0),
                                bottomRight: Radius.circular(langController.appLocale == 'en'?sizeW15:0),
                              ),
                              color:  primaryColor,
                            ),
                            child: Center(
                              child: Text('search one'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                            ),
                          ),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                          borderSide: const BorderSide(
                            color: primaryColor,
                            width:1.5,
                          ),
                        ),
                        hintStyle:  TextStyle(
                          fontSize: sizeW16,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                          borderSide: const BorderSide(
                            color: primaryColor,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                          borderSide: const BorderSide(
                            color: primaryColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                      style:  TextStyle(
                        fontSize: sizeW16,
                        color: blackolor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: sizeH15,),
                  homeController.isSections.value? FadeInUp(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: homeController.sectionsData.isNotEmpty? homeController.createSections():[
                        Container()
                      ],
                    ),
                  ):Container(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
  List<Widget> createSliders() {
    List<Widget> imageSliders = homeController.slidersData.map((item) {
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
