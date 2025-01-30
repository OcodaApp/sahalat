import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shlat/utility/General.dart';
import '../../utility/local_storage/local_storgae.dart';

class LangController extends GetxController {
  var appLocale = Platform.localeName.substring(0, 2);

  @override
  void onInit() async {
    String phoneLang;
    if (Platform.localeName.substring(0, 2) != 'ar' &&
        Platform.localeName.substring(0, 2) != 'en' &&
        Platform.localeName.substring(0, 2) != 'gr' &&
        Platform.localeName.substring(0, 2) != 'it' &&
        Platform.localeName.substring(0, 2) != 'ru') {
      phoneLang = 'en';
    } else {
      phoneLang = Platform.localeName.substring(0, 2);
    }

    LocalStorage localStorage = LocalStorage();
    appLocale = await localStorage.languageSelected ?? phoneLang;

    update();
    Get.updateLocale(Locale(appLocale));
    super.onInit();
  }

  void changeLanguage(String type) async {
    LocalStorage localStorage = LocalStorage();
    if (type == 'ar') {
      appLocale = 'ar';
      localStorage.saveLanguageToDisk('ar');
      Get.updateLocale(const Locale('ar', 'EG'));
      if(General.type == 'provider'){
        Get.offAllNamed('/Splash');
      }else{
        Get.back();
      }
    } else {
      appLocale = type;
      localStorage.saveLanguageToDisk(type);
      Get.updateLocale(Locale(type, 'EG'));
      if(General.type == 'provider'){
        Get.offAllNamed('/Splash');
      }else{
        Get.back();
      }
    }
  }
}
