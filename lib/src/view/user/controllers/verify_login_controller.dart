// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:page_route_transition/page_route_transition.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../../utility/General.dart';
import '../../home_view.dart';
import '../../vendors/choose_service.dart';
import '../../vendors/vendor_home/vendor_home_view.dart';
import '../add_name_email.dart';
import '../location_view.dart';

class VerifyLoginController extends GetxController {

  String? deviceToken = '';
  // final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  getToken() async {
    // await firebaseMessaging.getToken().then((value) {
    //   deviceToken = value!;
    // });
  }

  @override
  void onInit() {
    getToken();
    super.onInit();
  }

  void login(phone,context,type) async {
    var data = {
      'phone': phone,
      'device_token': deviceToken,
    };
    Request request = Request(url: urlLogin, body: data);
    request.post().then((value) {
      if (value['status']) {
        if (value['user'] != null) {
          General().setTokenData(value['user']['token']);
          General().setUserData(value['user']);
          General().getUserData().then((vv){
            if(type == 'client'){
              if(value['user']['name'] == '' || value['user']['name'] == null){
                Get.offAll(()=>AddNameEmail(user: value,));
              }else{
                if(
                  value['user']['latitude'] != '' 
                  && value['user']['latitude'] != null
                  && value['user']['longitude'] != '' 
                  && value['user']['longitude'] != null 
                ){
                  General().setlatitude(double.parse(value['user']['latitude'].toString()));
                  General().setlongitude(double.parse(value['user']['longitude'].toString()));
                  General().setaddress(value['user']['address_text']);
                  General().getlatitude();
                  General().getlongitude();
                  General().getaddress().then((aaa){
                    Get.offAll(()=>const HomeView());
                  });
                }else{
                  Get.offAll(()=>const MapSearchView());
                }
              }
              
            }else{
              if(value['user']['is_provider'] == 0){
                PageRouteTransition.effect = TransitionEffect.leftToRight;
                PageRouteTransition.pushReplacement(context,  ChooseServiceView());
              }else{
                Get.offAll(()=> VendorHomeView(
                  section: int.parse(value['user']['provider']['section_id']),
                  providerData: value['user']['provider'],)
                  ,arguments: [value['user']['provider']]
                );
              }
            }
          });
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
    super.onClose();
  }
}
