// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../../model/sliders_list_model.dart';

class AboutController extends GetxController {
  var current = 0.obs;

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

  var abouts = [].obs;
  void getAboutsList() async {
    isSliders.value = false;
    Request request = Request(url: urlGetSetting, body: null);
    request.get().then((value) async {
      if (value['status']) {
        print(value['data']['abouts']);
        abouts.value = value['data']['abouts'];
      }
    }).catchError((onError) {
    });
  }
  @override
  void onInit() {
    getSlidersList();
    getAboutsList();
    super.onInit();
  }

  List<Widget> createAbouts() {
    List<Widget> imageSliders = abouts.asMap().entries.map((item) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item.value['name'] != null ? Text(item.value['name'],style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)):Container(),
          SizedBox(height: item.value['name'] != null ?sizeH10:0,),
          Text(item.value['desc'],
          style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: grey3,height: 1.4)),
          SizedBox(height: sizeH10,),
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
