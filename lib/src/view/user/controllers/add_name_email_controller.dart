import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../../utility/General.dart';
import '../../home_view.dart';
import '../location_view.dart';

class AddNameEmailController extends GetxController {
  late TextEditingController name= TextEditingController();
  late TextEditingController email= TextEditingController();
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  void editUserData(user) async {
    var data = {
      'device_token': 'deviceToken',
      'email': email.text,
      'name': name.text,
    };
    Request request = Request(url: urlUserUpdate, body: data);
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
        if (value['data'] != null) {
          General().setUserData(value['data']);
          General().getUserData().then((vv){
            Get.back();
            // to home page or location page
            if(
              user['user']['latitude'] != '' 
              && user['user']['latitude'] != null
              && user['user']['longitude'] != '' 
              && user['user']['longitude'] != null 
            ){
              General().setlatitude(double.parse(user['user']['latitude'].toString()));
              General().setlongitude(double.parse(user['user']['longitude'].toString()));
              General().setaddress(user['user']['address_text']);
              General().getlatitude();
              General().getlongitude();
              General().getaddress().then((aaa){
                Get.offAll(()=>const HomeView());
              });
            }else{
              Get.offAll(()=>const MapSearchView());
            }
          });
        }
        
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
    name.dispose();
    email.dispose();
    super.onClose();
  }
}
