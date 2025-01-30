// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';

class ProviderEditController extends GetxController {
  late TextEditingController searchForm= TextEditingController();
  var providerId = 0.obs;
  var provider;
  @override
  void onInit() {
    providerId.value = Get.arguments[0];
    provider = Get.arguments[1];
    super.onInit();
  }
  var amOrpm = ''.obs;
  var dateChoose = ''.obs;
  void getAddBasket(id) async {
    var data  = {
      'item_id' : id,
      'date' :dateChoose.value,
    };
    if(amOrpm.value.isNotEmpty){
      data.addAll({'am_or_pm':amOrpm.value});
    }
    Request request = Request(url: urlEditItemHall, body: data);
    request.postAuth().then((value) async {
      if (value['status']) {
        Fluttertoast.showToast(
          msg: value['msg'],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.white,
          fontSize: sizeW14,
        );
        Get.back();
      }else{
        Fluttertoast.showToast(
          msg: value['msg'],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: sizeW14,
        );
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void onClose() {
    searchForm.dispose();
    super.onClose();
  }
}
