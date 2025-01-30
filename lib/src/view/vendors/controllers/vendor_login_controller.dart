// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:page_route_transition/page_route_transition.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../user/verify_email.dart';

class VendorLoginController extends GetxController {
  late TextEditingController phone;
  var code = ''.obs;

  @override
  void onInit() {
    phone = TextEditingController();
    super.onInit();
  }

  providerLogin(context) async {
    var data = {
      'phone': '966${phone.text}',
      'type' : 'provider',
      // 'device_token': deviceToken,
    };
    
    Request request = Request(url: urlLogin, body: data);
    request.post().then((value) {
      print("value['code']");
      print(value['code']);
      print(value['user']['type']);
      if (value['status']) {
        PageRouteTransition.effect = TransitionEffect.topToBottom;
        PageRouteTransition.push(context,   VerifyView(type : value['user']['type'],phone: value['phone'],code : value['code'].toString()));
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
    phone.dispose();
    super.onClose();
  }
}
