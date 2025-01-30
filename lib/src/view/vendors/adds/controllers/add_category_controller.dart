import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../constance.dart';
import '../../../../../http/request.dart';
import '../../../../../http/url.dart';

class AddCategoryController extends GetxController {
  late TextEditingController title= TextEditingController();
  addCategory(providerId,context) async {
    var data = {
      'provider_id': providerId,
      'title' : title.text,
      'type' : 'cat',
    };
    Request request = Request(url: urladdCategory, body: data);
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
      print('onError');
      print(onError);
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
