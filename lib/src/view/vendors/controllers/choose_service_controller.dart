// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../../model/sections_list_model.dart';

class ChooseServiceController extends GetxController {
  var section = 0.obs;
  var sectionData;
  var sectionsData = [].obs;
  var isSections = false.obs;
  // intros
  void getSectionsList() async {
    Request request = Request(url: urlSections, body: null);
    request.get().then((value) async {
      if (value['status']) {
        SectionsListModel sectionsListModel = SectionsListModel.fromJson(value);
        sectionsData.value = sectionsListModel.data!;
        section.value = sectionsData[0].id;
        sectionData = sectionsData[0];
        isSections.value = true;
      } 
    }).catchError((onError) {
      print(onError);
    });
  }
  @override
  void onInit() {
    getSectionsList();
    super.onInit();
  }

  List<Widget> createSections() {
    List<Widget> imageSliders = sectionsData.asMap().entries.map((item) {
      return Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW15),
              border: Border.all(color: primaryColor,width: 1),
              
            ),
            padding: EdgeInsets.only(top: sizeH15,bottom: sizeH15,right: sizeW15,left: sizeW15),
            child: GestureDetector(
              onTap: (){
                section.value = item.value.id;
                sectionData = item.value;
              },
              child: Row(
                children: [
                  Container(
                    width: sizeW20,
                    height: sizeW20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(sizeW45),
                      color: section.value == item.value.id?primaryColor:whitecolor,
                      border: Border.all(color: primaryColor,width: 1)
                    ),
                  ),
                  SizedBox(width: sizeW10,),
                  Text(item.value.titleP,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                ],
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
