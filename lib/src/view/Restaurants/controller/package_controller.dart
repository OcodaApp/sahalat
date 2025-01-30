import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../../model/products_user_model.dart';
import '../../../../utility/General.dart';

class PackageController extends GetxController {
  late TextEditingController searchForm= TextEditingController();
  var textSearch = ''.obs; 
  var address = General.address.obs;
  var providerId = 0.obs;
  var sectionId = 0.obs;
  var delivery = 0.obs;
  var providerType = ''.obs;
  var productsData = [].obs;
  var isProducts = false.obs;

  void getProductssList() async {
    var data  = {
      'provider_id' : providerId.value,
      'user_id' : General.id,
    };
    if(textSearch.value.isNotEmpty){
      data.addAll({'word':textSearch.value});
    }
    if(sectionId.value != 0){
      data.addAll({'section_id':sectionId.value});
    }
    isProducts.value = false;
    Request request = Request(url: urlProducts, body: data);
    request.post().then((value) async {
      if (value['status']) {
        ProductsUserListModel lists = ProductsUserListModel.fromJson(value);
        productsData.value = lists.data!;
        isProducts.value = true;
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void onInit() {
    sectionId.value = Get.arguments[0];
    providerId.value = Get.arguments[1];
    providerType.value = Get.arguments[2];
    delivery.value = Get.arguments[3];
    getProductssList();
    super.onInit();
  }
  @override
  void onClose() {
    searchForm.dispose();
    super.onClose();
  }
}
