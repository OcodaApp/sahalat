// ignore_for_file: avoid_print

import 'package:get/get.dart';
import '../view/Settings/profile_view.dart';
import '../view/vendors/vendor_home/hall_home_page.dart';

class HomeController extends GetxController {
  var current = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  homes(newIndex,section,providerData) {
    if(newIndex == 0){
      return HallHomePage(providerData : providerData,images2 : providerData['images']);
    }

    if(newIndex == 1){
      return const ProfileView();
    }
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
