// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shlat/utility/General.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../../model/products_user_model.dart';

class PhotoEditController extends GetxController {
  late TextEditingController searchForm= TextEditingController();
  var textSearch = ''.obs; 
  var providerId = 0.obs;
  var sectionId = 0.obs;
  var productsData = [].obs;
  var isProducts = false.obs;
  var sectionsShow = false.obs;
  var count = 1.obs;
  var provider;
  var inOrOut = 'in'.obs;
  // sliders
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
        print("productsData.length");
        print(productsData.length);
        isProducts.value = true;
        sectionsShow.value = true;
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  void getPackagesList() async {
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
    Request request = Request(url: urlPackages, body: data);
    request.post().then((value) async {
      if (value['status']) {
        ProductsUserListModel lists = ProductsUserListModel.fromJson(value);
        productsData.value = lists.data!;
        print("productsData.length");
        print(productsData.length);
        isProducts.value = true;
        sectionsShow.value = true;
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  var itemId = 0.obs;

  @override
  void onInit() {
    providerId.value = Get.arguments[0];
    provider = Get.arguments[1];

    packageChoose.value = Get.arguments[3];
    packageChoosePrice.value = Get.arguments[4];
    print("Get.arguments[5]");
    print(Get.arguments[5]);
    categoryChooseShow = Get.arguments[6];
    serviceChooses = Get.arguments[5];
    inOrOut.value = Get.arguments[7];
    itemId.value = Get.arguments[8];
    getProductssList();
    super.onInit();
  }
  DateTime date = DateTime.now().add(const Duration(days : 1));
  var amOrpm = ''.obs;
  var dateChoose = ''.obs;
  var timeChoose = ''.obs;

  void getAddBasket() async {
    var data  = {
      'provider_id' : providerId.value,
      'type' : provider.type,
      'addres_text' : General.address,
      'latitude' : General.latitude,
      'longitude' : General.longitude,
      'price' : provider.price,
      'total' : provider.price,
      'date' :dateChoose.value,
      'sale' : 0,
      'delivery_price' : 0,
    };
    if(amOrpm.value.isNotEmpty){
      data.addAll({'am_or_pm':amOrpm.value});
    }
    Request request = Request(url: urlPostBasket, body: data);
    request.postAuth().then((value) async {
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
        Get.back();
      }else{
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
      print(onError);
    });
  }

  void getAddBasketPackages(id) async {
    var data  = {
      'item_id' : id,
      'provider_section_id' : packageChoose.value,
      'addres_text' : General.address,
      'latitude' : General.latitude,
      'longitude' : General.longitude,
      'price' : packageChoosePrice.value,
      'total' : packageChoosePrice.value,
      'date' :dateChoose.value,
      'time' :timeChoose.value,
      'sale' : 0,
      'delivery_price' : 0,
    };
    Request request = Request(url: urlEditItem, body: data);
    request.postAuth().then((value) async {
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
        Get.back();
      }else{
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
      print(onError);
    });
  }

  void getEditBasketServices(price) async {
    var data  = {
      'addres_text' : General.address,
      'latitude' : General.latitude,
      'longitude' : General.longitude,
      'price' : price,
      'total' : price,
      'date' :dateChoose.value,
      'time' :timeChoose.value,
      'sale' : 0,
      'services' : serviceChooses,
      'delivery_price' : 0,
      'in_or_out' :inOrOut.value
    };
    Request request = Request(url: editBasketSalon, body: data);
    request.postAuth().then((value) async {
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
        Get.back();
      }else{
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
      print(onError);
    });
  }

  var packageChoose = 0.obs;
  var packageChoosePrice = 0.0.obs;
  var packageChooseShow = 0.obs;

  List<Widget> createPackages() {
    List<Widget> imageSliders = provider['packages'].asMap().entries.map<Widget>((item) {
      return Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW15),
              border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: 1.4)
            ),
            padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    packageChoose.value = item.value['id'];
                    packageChoosePrice.value = double.parse(item.value['price'].toString());
                    packageChooseShow.value = 0;
                  },
                  child: Row(
                    children: [
                      Container(
                        width: sizeW20,
                        height: sizeW20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW45),
                          color: packageChoose.value == item.value['id'] ? primaryColor:whitecolor,
                          border: Border.all(color: packageChoose.value == item.value['id'] ? primaryColor:grey3)
                        ),
                      ),
                      SizedBox(width: sizeW10,),
                      SizedBox(
                        width: Get.width / 4,
                        child: Text(item.value['title'],style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                      SizedBox(width: sizeW35,),
                      SizedBox(
                        width: Get.width / 4,
                        child: Text('${item.value['price']} ${'SAR'.tr}',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    packageChooseShow.value = item.value['id'];
                  },
                  child: Image.asset('assets/icons/arrow-right.png'))
              ],
            ),
          ),
          SizedBox(height: sizeH10,),
          packageChooseShow.value == item.value['id'] ? Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW15),
              border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: 1.4)
            ),
            padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
            child: Text(item.value['description'],
              style: TextStyle(color: const Color(0xFF797C7E),fontSize: sizeW16,fontWeight: FontWeight.w400,height: 1.5),
            ),
          ):Container(),
          SizedBox(height: packageChooseShow.value == item.value['id']?sizeH10:0,),
        ],
      );
    }).toList();
    return imageSliders;
  }
  List<int> categoryChooseShow = <int>[].obs;
  
  List<Widget> createCategories() {
    List<Widget> imageSliders = provider['categories'].asMap().entries.map<Widget>((item) {
      return Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW15),
              border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: 1.4)
            ),
            padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 1.5,
                  child: Text(item.value['title'],
                  style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                  onTap: (){
                    if(categoryChooseShow.contains(item.value['id'])){
                      categoryChooseShow.removeWhere((vv) => vv == item.value['id']);
                    }else{
                      categoryChooseShow.add(item.value['id']);
                    }
                    
                  },
                  child: Image.asset('assets/icons/arrow-right.png'))
              ],
            ),
          ),
          SizedBox(height: sizeH10,),
          categoryChooseShow.contains(item.value['id']) ?Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: createServices(item.value['id']),
          ):Container(),
        ],
      );
    }).toList();
    return imageSliders;
  }
  List serviceChooses = [].obs;
  getCount(int i, String key) {
    for (var map in serviceChooses) {
      if (map.containsKey("id")) {
        if (map["id"] == i) {
          return map[key].toString();
        }
      }
    }
  }

  getChoose(int i) {
    if(serviceChooses.indexWhere((value) => value["id"] == i) == -1){
      return whitecolor;
    }else{
      return primaryColor;
    }
  }

  List<Widget> createServices(id) {
    List<Widget> imageSliders = provider['services'].asMap().entries.map<Widget>((item) {
      return int.parse(item.value['section_id']) == int.parse(id.toString())? Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW15),
              border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: 1.4)
            ),
            padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        // if(serviceChooses.indexWhere((value) => value["id"] == item.value['id']) == -1){
                        //   serviceChooses.addAll([
                        //     {
                        //       'item_id' : itemId.value,
                        //       'id' : item.value['id'],
                        //       'price' : item.value['price'],
                        //       'count' : 1,
                        //       'total' : item.value['price']
                        //     }
                        //   ]);
                        // }else{
                        //   serviceChooses.removeWhere((vv) => vv["id"] == item.value['id']);
                        // }
                      },
                      child: Row(
                        children: [
                          Container(
                            width: sizeW20,
                            height: sizeW20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(sizeW45),
                              color: getChoose(item.value['id']),
                              border: Border.all(color: grey3)
                            ),
                          ),
                          SizedBox(width: sizeW10,),
                          SizedBox(
                            width: Get.width / 4.5,
                            child: Text(item.value['title'],style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 4.5,
                      child: Text('${item.value['price']} ${'SAR'.tr}',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              if(getCount(item.value['id'], 'count')!= null){
                                var count =getCount(item.value['id'], 'count');
                                if(int.parse(count)< 999){
                                  serviceChooses.removeWhere((vv) => vv["id"] == item.value['id']);
                                  serviceChooses.addAll([
                                    {
                                      'item_id' : itemId.value,
                                      'id' : item.value['id'],
                                      'price' : item.value['price'],
                                      'count' : int.parse(count) + 1,
                                      'total' : (int.parse(count)+ 1) *int.parse(item.value['price'])
                                    }
                                  ]);
                                }
                                
                              }
                            },
                            child: Container(
                              height: sizeW30,
                              width: sizeW30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(sizeW8),
                                  topRight: Radius.circular(sizeW8),
                                  bottomRight: Radius.circular(sizeW8),
                                ),
                                border: Border.all(color: primaryColor,width: 1.5),
                              ),
                              child: const Center(
                                child: Icon(Icons.add,color: primaryColor,size: 20,),
                              ),
                            ),
                          ),
                          Container(
                            margin:  EdgeInsets.only(right: sizeW15,left: sizeW15),
                            child:  Center(
                              child: Text(getCount(item.value['id'], 'count') ?? '0',style: TextStyle(fontSize: sizeW18,fontWeight: FontWeight.w500,color: primaryColor)),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(getCount(item.value['id'], 'count')!= null){
                                var count =getCount(item.value['id'], 'count');
                                if(int.parse(count)> 1){
                                  serviceChooses.removeWhere((vv) => vv["id"] == item.value['id']);
                                  serviceChooses.addAll([
                                    {
                                      'item_id' : itemId.value,
                                      'id' : item.value['id'],
                                      'price' : item.value['price'],
                                      'count' : int.parse(count) - 1,
                                      'total' : (int.parse(count)- 1) *int.parse(item.value['price'])
                                    }
                                  ]);
                                }
                              }
                            },
                            child: Container(
                              height: sizeW30,
                              width: sizeW30,
                              decoration: BoxDecoration(
                                border: Border.all(color: primaryColor,width: 1.5),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(sizeW8),
                                  topRight: Radius.circular(sizeW8),
                                  bottomRight: Radius.circular(sizeW8),
                                ),
                              ),
                              child:  Center(
                                child: Container(height: 1.5,width: 10,color: primaryColor,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
                SizedBox(height: sizeH10,),
              ],
            ),
          ),
          SizedBox(height: sizeH10,),
        ],
      ):Container();
    }).toList();
    return imageSliders;
  }
  @override
  void onClose() {
    searchForm.dispose();
    super.onClose();
  }

  
}
