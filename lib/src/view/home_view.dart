import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:get/get.dart';
import 'package:shlat/constance.dart';
import '../../utility/General.dart';
import '../controller/home_user_controller.dart';
import '../controller/tabbar_controller.dart';
import 'Cart/cart_view.dart';
import 'Cart/controller/cart_controller.dart';
import 'Favs/controllers/favs_controller.dart';
import 'Favs/favs_page.dart';
import 'Home/home_page.dart';
import 'Settings/profile_view.dart';
import 'bottom_navy_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static List<Widget> screens = [
    HomePageView(),
    CartView(),
    FavsPage(),
    const ProfileView()
  ];
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TabBarController tabBarController = Get.put(TabBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
        bottomNavigationBar: BottomNavyBar(
          itemCornerRadius: 10,
          selectedIndex: tabBarController.tabIndex,
          items: [
            BottomNavyBarItem(
              iconActive : 'assets/bottom/home.png',
              icon: 'assets/bottom/home.png',
            ),
            BottomNavyBarItem(
              iconActive : 'assets/bottom/shopping-cart.png',
              icon: 'assets/bottom/shopping-cart.png',
            ),
            BottomNavyBarItem(
              iconActive : 'assets/bottom/heart.png',
              icon: 'assets/bottom/heart.png',
            ),
            BottomNavyBarItem(
              iconActive : 'assets/bottom/user.png',
              icon: 'assets/bottom/user.png',
            ),
          ],
          onItemSelected: (currentIndex) {
            tabBarController.tabIndex = currentIndex;
            tabBarController.onTabTapped;
            setState(() {});
            if(currentIndex == 0){
              final HomeUserController homeController = Get.put(HomeUserController());
              homeController.sectionsData.clear();
              homeController.isSections.value = false;
              homeController.getSectionsList();
              homeController.getSlidersList();
            }
            if(currentIndex == 1){
              final CartController cartcontroller = Get.put(CartController());
              cartcontroller.cart.value = false;
              cartcontroller.shops.clear();
              cartcontroller.shopsProducts.clear();
              cartcontroller.photos.clear();
              cartcontroller.photosPackages.clear();
              cartcontroller.events.clear();
              cartcontroller.eventsProducts.clear();
              cartcontroller.salons.clear();
              cartcontroller.salonsServices.clear();
              cartcontroller.coupon.clear();
              cartcontroller.couponText.value = '';
              cartcontroller.salePrice.value = 0.0;
              cartcontroller.sale.value = 0;
              cartcontroller.couponId.value = '0';
              cartcontroller.isCoupon.value = false;
              cartcontroller.getBaskets();
            }

            if(General.token.trim() != "" && currentIndex == 2){
              final FavsController favscontroller = Get.put(FavsController());
              favscontroller.getProvidersList();
            }
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
          child: HomeView.screens[tabBarController.tabIndex],
        ),
      );
  }
}
