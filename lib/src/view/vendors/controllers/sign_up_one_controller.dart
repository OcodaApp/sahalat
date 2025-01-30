import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:page_route_transition/page_route_transition.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../user/verify_email.dart';

class SignUpOneController extends GetxController {
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController name;
  var code = ''.obs;

  @override
  void onInit() {
    email = TextEditingController();
    phone = TextEditingController();
    name = TextEditingController();
    super.onInit();
  }

  signUp(context) async {
    var data = {
      'email': email.text,
      'phone': '966${phone.text}',
      'name': name.text,
      'type' : 'provider',
      // 'device_token': deviceToken,
    };
    Request request = Request(url: urlsignUp, body: data);
    request.post().then((value) {
      if (value['status']) {
        PageRouteTransition.effect = TransitionEffect.topToBottom;
        PageRouteTransition.push(context,   VerifyView(type : 'provider',phone: value['phone'],code : value['code'].toString()));
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
    email.dispose();
    phone.dispose();
    name.dispose();
    super.onClose();
  }
}
