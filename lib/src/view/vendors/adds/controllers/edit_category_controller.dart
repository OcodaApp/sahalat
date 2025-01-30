import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../constance.dart';
import '../../../../../http/request.dart';
import '../../../../../http/url.dart';

class EditCategoryController extends GetxController {
  late TextEditingController title= TextEditingController();
  var sectionId = 0.obs;
  @override
  void onInit() {
    title.text = Get.arguments[1].title;
    sectionId.value = Get.arguments[0];
    super.onInit();
  }
  editCategory() async {
    var data = {
      'section_id': sectionId.value,
      'title' : title.text,
    };
    Request request = Request(url: urleditCategory, body: data);
    request.postAuth().then((value) {
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
        title.clear();
        Get.back();
      } else {
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
      Fluttertoast.showToast(
        msg: 'agien'.tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: sizeW14,
      );
    });
  }
  

  @override
  void onClose() {
    title.dispose();
    super.onClose();
  }
}
