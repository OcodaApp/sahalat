// ignore_for_file: must_be_immutable, no_logic_in_create_state, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:get/get.dart';
import 'package:shlat/constance.dart';
import '../../../controller/home_controller.dart';
import '../../bottom_navy_bar.dart';

class VendorHomeView extends StatefulWidget {
  int section;
  var providerData;
  VendorHomeView({super.key,required this.section,this.providerData});
  @override
  State<VendorHomeView> createState() => _VendorHomeViewState(section:section,providerData:providerData);
}

class _VendorHomeViewState extends State<VendorHomeView> {
  int newIndex = 0;
  int section;
   var providerData;
  _VendorHomeViewState({required this.section,this.providerData});
  final HomeController homeController = Get.put(HomeController());  
  // static List<Widget> screens = [
  //   HallHomePage(),
  //   CartView(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
        bottomNavigationBar: BottomNavyBar(
          itemCornerRadius: 10,
          selectedIndex: newIndex,
          items: [
            BottomNavyBarItem(
              iconActive : 'assets/bottom/home.png',
              icon: 'assets/bottom/home.png',
            ),
            BottomNavyBarItem(
              iconActive : 'assets/bottom/user.png',
              icon: 'assets/bottom/user.png',
            ),
            
          ],
          onItemSelected: (currentIndex) {
            newIndex = currentIndex;
            setState(() {});
          },
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: homeController.homes(newIndex, section,providerData),
        ),
      );
  }

  
}
