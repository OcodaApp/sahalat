// ignore_for_file: avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';
import '../../http/request.dart';
import '../../http/url.dart';
import '../../model/sections_list_model.dart';
import '../../model/sliders_list_model.dart';
import '../../utility/General.dart';
import '../view/Halls/halls_view.dart';
// import '../view/Photographers/photographers_view.dart';
// import '../view/Restaurants/restaurants_page.dart';
// import '../view/Salons/salons_view.dart';
// import '../view/Sweets/sweets_page.dart';
// import '../view/events/events_view.dart';
// import '../view/roses/roses_page.dart';

class HomeUserController extends GetxController {
  late TextEditingController searchForm= TextEditingController();
  var current = 0.obs;
  var textController = TextEditingController();
  List predictions = [];
  var address = General.address.obs;

  var isSliders = false.obs;
  var slidersData = [].obs;
  // sliders
  void getSlidersList() async {
    isSliders.value = false;
    Request request = Request(url: urlSliders, body: null);
    request.get().then((value) async {
      if (value['status']) {
        SlidersListModel lists = SlidersListModel.fromJson(value);
        slidersData.value = lists.sliders!;
        isSliders.value = true;
      }
    }).catchError((onError) {
    });
  }

  var sectionsData = [].obs;
  var isSections = false.obs;
  // intros
  void getSectionsList() async {
    Request request = Request(url: urlSections, body: null);
    request.get().then((value) async {
      if (value['status']) {
        SectionsListModel sectionsListModel = SectionsListModel.fromJson(value);
        sectionsData.value = sectionsListModel.data!;
        print("sectionsData[0]");
        print(sectionsData[0].title);
        isSections.value = true;
      } 
    }).catchError((onError) {
      print(onError);
    });
  }
  @override
  void onInit() {
    getSlidersList();
    getSectionsList();
    super.onInit();
  }

  List<Widget> createSections() {
    List<Widget> imageSliders = sectionsData.asMap().entries.map((item) {
      return Column(
        children: [
          FadeInLeft(
            child: GestureDetector(
              onTap: (){
                Get.to(()=> HallsView(sections: sectionsData,
                  sectionData:item.value
                ),
                  arguments: [item.value.id,item.value,item.value.title],
                );
              },
              child: SizedBox(
                height : Get.height / 4.2,
                width: Get.width,
                child: Stack(
                  children: [
                    Container(
                      height : Get.height / 4.2,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(sizeW25),
                        color: blackolor.withOpacity(.4),
                        image: DecorationImage(
                          image: NetworkImage(item.value.icon,),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(right: sizeW25,left: sizeW25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(sizeW25),
                            bottomRight: Radius.circular(sizeW25),
                          ),
                          color: blackolor.withOpacity(.4),
                        ),
                        height : (Get.height / 4.2) / 4.4,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.value.title,
                              style:  TextStyle(
                                fontSize: sizeW20,
                                color: whitecolor,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios,color: whitecolor,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: sizeH15,),
        ],
      );
    }).toList();
    return imageSliders;
  }

  

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
