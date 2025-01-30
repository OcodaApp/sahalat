// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../constance.dart';
import '../../http/request.dart';
import '../../http/url.dart';
import '../../utility/General.dart';
import '../view/home_view.dart';
import '../view/intro/intro_view.dart';
import '../view/user/location_view.dart';
import '../view/user/login_view.dart';
import '../view/vendors/choose_service.dart';
import '../view/vendors/vendor_home/vendor_home_view.dart';
import 'lang_controller.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

class SplashController extends GetxController {
  late Timer timer;
  var isLogin = false.obs;
  var isIntro = false.obs;
  final LangController langController = Get.put(LangController());
  String? deviceToken = '';
  // final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  getToken() async {
    // await firebaseMessaging.getToken().then((value) {
    //   deviceToken = value!;
    // });
  }

  checkGoPage() async {
    getToken();
    General.token.trim() != "" ? isLogin.value = true : isLogin.value = false;
    General.isIntro ? isIntro.value = true : isIntro.value = false;
    update();
  }

  var image = ''.obs;
  var title = ''.obs;
  var desc = ''.obs;
  getIntrosList() async {
    Request request = Request(url: urlGetSetting, body: null);
    request.get().then((value) async {
      if (value['status']) {
        image.value = urlBaseImage + value['data']['intro_image'];
        title.value = value['data']['intro_title'];
        desc.value = value['data']['intro_desc'];
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  checkNet() async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        checkGoPage().then((value) {
          if (isLogin.value) {
            timer =  Timer(const Duration(seconds: 2), () {
              print('login');
              login();
            });
          } else {
            if (isIntro.value) {
              timer =  Timer(const Duration(seconds: 2), () {
                noLogin();
              });
            } else {
              getIntrosList().then((value){
                timer =  Timer(const Duration(seconds: 4), () {
                  Get.offAll(()=>IntroViews(image:image.value,title: title.value,desc: desc.value,));
                });
              });
            }
          }
        });
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg: 'not connected'.tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: sizeW15,
      );
    }
  }
  
  @override
  void onInit() {
    FocusManager.instance.primaryFocus?.unfocus();
    checkNet();
    super.onInit();
  }

  void noLogin() {
    Get.offAll(()=> LoginView());
  }

  void login() async {
    var data = {
      'device_token': deviceToken,
      'language': langController.appLocale,
    };
    Request request = Request(url: urlUserData, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        if (value['data'] != null) {
          General().setUserData(value['data']);
          General().setwalletCount(double.parse(value['data']['count_walet'].toString()));
          General().getUserData().then((vv){
            if(value['data']['type'] == 'client'){
              if(value['data']['latitude'] != '' &&value['data']['latitude'] != null&&value['data']['longitude'] != '' &&value['data']['longitude'] != null ){
                General().setlatitude(double.parse(value['data']['latitude'].toString()));
                General().setlongitude(double.parse(value['data']['longitude'].toString()));
                General().setaddress(value['data']['address_text']);
                General().getlatitude();
                General().getlongitude();
                General().getaddress().then((aaa){
                  Get.offAll(()=>const HomeView());
                });
              }else{
                Get.offAll(()=>const MapSearchView());
              }
            }else{
              if(value['data']['is_provider'] == 0){
                Get.offAll(()=> ChooseServiceView());
              }else{
                Get.offAll(()=> VendorHomeView(section: int.parse(value['data']['provider']['section_id']),providerData: value['data']['provider'],),arguments: [value['data']['provider']]);
              }
            }
          });
        } else {
          noLogin();
        }
      } else {
        noLogin();
      }
    }).catchError((onError) {
      noLogin();
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
