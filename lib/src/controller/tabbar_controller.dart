
// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';

class TabBarController extends GetxController
    with SingleGetTickerProviderMixin {
  int tabIndex = 0;
  var tabName = ''.obs;

  @override
  void onInit() {
    tabName.value ='Home'.tr;
    update();
    super.onInit();
  }

  void onTabTapped(int index) {
    tabIndex = index;

    switch (index) {
      case 0:
        {
          tabName.value ='Home'.tr;
        }
        break;
      case 1:
        {
          tabName.value = 'explore'.tr;
        }
        break;
      case 2:
        {
          tabName.value = 'my reservations'.tr;
        }
        break;
      case 3:
        {
          tabName.value = 'Arithmetic'.tr;
        }
        break;
    }
    update();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
