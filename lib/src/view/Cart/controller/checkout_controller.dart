// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
// import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
// import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
// import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
// import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
// import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
// import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../controller/cart_count_controller.dart';
import '../../Settings/thank_view.dart';

class CheckOutController extends GetxController {
  var paymethod = 1.obs;
  var basketStoreCount = 0.obs;
  var basketStoreTotal = 0.0.obs;
  var deliveryTotal= 0.0.obs;
  var servicePrice= 0.obs;
  var salePrice= 0.0.obs;
  var sale= 0.obs;
  var couponId= '0'.obs;
  var allTotal= 0.0.obs;
  var timeAll= 0.0.obs;
  var itemsCount= 0.obs;
  var notes= ''.obs;
  var storeId= 0.obs;
  final pageIndexNotifier = ValueNotifier(0);
  var isDataAddress = false.obs;
  var addrssData = [].obs;

  void postOrder() async {
    Future.delayed(
      Duration.zero,
      () => Get.dialog(
      const Center(
            child: CircularProgressIndicator(
          backgroundColor: primaryColor,
        )),
        barrierDismissible: false,
      ),
    );
    var data = {
      'store_id' : storeId.value,
      'address_id' : addrssId.value,
      // 'transaction_id' : '',
      'note' : notes.value,
      // 'pay_data' : '',
      'delivery_total' : deliveryTotal.value,
      'service_price' : servicePrice.value,
      'sale_total' : salePrice.value,
      'sale' : sale.value,
      'total' : allTotal.value,
      'items_total' : basketStoreTotal.value,
      'time' : timeAll.value,
    };

    if(couponId.value != '0'){
      data.addAll({'coupon_id' : couponId.value});
    }
    if(paymethod.value == 1){
      data.addAll({'pay_method' : 'visa','pay' : pay.value,'transaction_id':transactionId.value});
    }
    if(paymethod.value == 2){
      data.addAll({'pay_method' : 'cash','pay' : 'no'});
    }
    if(paymethod.value == 3){
      data.addAll({'pay_method' : 'wallet','pay' : 'yes'});
    }
    Request request = Request(url: urlPostOrder, body: data);
    request.postAuth().then((value) {
      Get.back();
      if (value['status']) {
        final CartCountController cartCountcontroller = Get.put(CartCountController());
        cartCountcontroller.cartCoynt.value = 0;
        Get.offAll(()=>const ThankView());
        
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
      Get.back();
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

  var addrssId = 0.obs;
  

  

  @override
  void onInit() {
    deliveryTotal.value= Get.arguments[0];
    allTotal.value= Get.arguments[1];
    salePrice.value=double.parse(Get.arguments[2].toString());
    // basketStoreCount.value =Get.arguments[2];
    // basketStoreTotal.value = Get.arguments[3];
    // deliveryTotal.value= Get.arguments[4];
    // servicePrice.value=Get.arguments[5];
    // salePrice.value=double.parse(Get.arguments[6].toString());
    // allTotal.value= Get.arguments[7];
    // timeAll.value= Get.arguments[8];
    // itemsCount.value= Get.arguments[9];
    // notes.value= Get.arguments[10];
    // storeId.value = Get.arguments[11];
    // sale.value = Get.arguments[12];
    // couponId.value = Get.arguments[13];
    super.onInit();
  }

  
  // var rng = Random();
  // PaymentSdkConfigurationDetails generateConfig() {
  // var billingDetails = BillingDetails(General.username, General.email,
  //     General.mobile, address.Address.a_street, "sa", address.Address.a_city, address.Address.a_city, "12345");
  // var shippingDetails = ShippingDetails(General.username, General.email,
  //     General.mobile, address.Address.a_street, "sa", address.Address.a_city, address.Address.a_city, "12345");
  // List<PaymentSdkAPms> apms = [];
  // apms.add(PaymentSdkAPms.AMAN);
  // final configuration = PaymentSdkConfigurationDetails(
  //     profileId: "109021",
  //     serverKey: "SMJNHNDLNL-JHT9JN9DD2-WT6LRLJHBZ",
  //     clientKey: "CTKM9D-NQNG6H-7P6QPD-RDH977",
  //     cartId: rng.nextInt(100).toString(),
  //     cartDescription: "Flowers",
  //     merchantName: "The bird sa",
  //     screentTitle: "payment".tr,
  //     amount: allTotal.value,
  //     showBillingInfo: false,
  //     forceShippingInfo: false,
  //     currencyCode: "SAR",
  //     merchantCountryCode: "SA",
  //     billingDetails: billingDetails,
  //     shippingDetails: shippingDetails,
  //     alternativePaymentMethods: apms,
  //     linkBillingNameWithCardHolderName: true,
  //   );
  //   final theme = IOSThemeConfigurations();
  //   theme.logoImage = "assets/logo.png";
  //   configuration.iOSThemeConfigurations = theme;
  //   configuration.tokeniseType = PaymentSdkTokeniseType.MERCHANT_MANDATORY;
  //   return configuration;
  // }

  var pay= 'no'.obs;
  var transactionId = ''.obs;
  var payData = {};
  // Future<void> payPressed() async {
  //   FlutterPaytabsBridge.startCardPayment(generateConfig(), (event) {
  //     if (event["status"] == "success") {
  //       var transactionDetails = event["data"];
  //       if (transactionDetails["isSuccess"]) {
  //         pay.value = 'yes';
  //         transactionId.value = event['data']['transactionReference'];
  //         // payData = event['data'];
          
  //         postOrder();
  //         if (transactionDetails["isPending"]) {
  //           Fluttertoast.showToast(
  //             msg: 'agien'.tr,
  //             toastLength: Toast.LENGTH_LONG,
  //             gravity: ToastGravity.CENTER,
  //             timeInSecForIosWeb: 1,
  //             backgroundColor: Colors.redAccent,
  //             textColor: Colors.white,
  //             fontSize: sizeW14,
  //           );
  //         }
  //       } else {
  //         Fluttertoast.showToast(
  //           msg: 'agien'.tr,
  //           toastLength: Toast.LENGTH_LONG,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.redAccent,
  //           textColor: Colors.white,
  //           fontSize: sizeW14,
  //         );

  //       }
  //     } else if (event["status"] == "error") {
  //       Fluttertoast.showToast(
  //         msg: 'agien'.tr,
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.redAccent,
  //         textColor: Colors.white,
  //         fontSize: sizeW14,
  //       );
  //     } else if (event["status"] == "event") {
  //       Fluttertoast.showToast(
  //         msg: 'agien'.tr,
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.redAccent,
  //         textColor: Colors.white,
  //         fontSize: sizeW14,
  //       );
  //     }
  //   });
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
