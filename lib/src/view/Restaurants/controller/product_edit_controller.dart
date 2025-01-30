import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../../utility/General.dart';

class ProductEditController extends GetxController {
  late TextEditingController note= TextEditingController();
  var count = 1.obs;
  var cart = false.obs;
  var current = 0.obs;
  var address = General.address.obs;
  var sizes = [].obs;
  var additions = [].obs;
  var productId = 0.obs;
  var providerId = 0.obs;
  var providerType = ''.obs;
  var sizeId = 0.obs;
  var sizePrice = 0.0.obs;
  var addId = 0.obs;
  var addPrice = 0.0.obs;
  var sectionsShow = true.obs;
  var delivery = 0.obs;

  @override
  void onInit() {
    sizes.value = Get.arguments[0];
    additions.value = Get.arguments[1];
    productId.value = Get.arguments[2];
    providerId.value = Get.arguments[3];
    providerType.value = Get.arguments[4];
    delivery.value = Get.arguments[5];
    count.value = Get.arguments[6];
    sizeId.value = Get.arguments[7];
    addId.value = Get.arguments[8];
    sizePrice.value = double.parse(Get.arguments[9].toString());
    addPrice.value = double.parse(Get.arguments[10].toString());
    super.onInit();
  }

  void getEditBasket(price,date,time,id) async {
    var data  = {
      'item_id' : id,
      'addres_text' : General.address,
      'latitude' : General.latitude,
      'longitude' : General.longitude,
      'price' : price,
      'total' : (price * count.value),
      'date' :date,
      'time' :time,
      'sale' : 0,
      'delivery_price' : delivery.value,
      'choose_size_total' : (sizePrice.value * count.value),
      'choose_addition_total' : (addPrice.value * count.value),
      'choose_size_price' : sizePrice.value,
      'choose_addition_price' : addPrice.value,
      'quantity' : count.value
    };
    if(note.text.isNotEmpty){
      data.addAll({'note':note.text});
    }
    if(addId.value != 0){
      data.addAll({'product_addition_id':addId.value});
    }
    if(sizeId.value != 0){
      data.addAll({'product_size_id':sizeId.value});
    }
    Request request = Request(url: editBasketProduct, body: data);
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

  List<Widget> createSizes() {
    List<Widget> imageSliders = sizes.asMap().entries.map((item) {
      if(int.parse(item.value['plus_price']) == 0){
        sizeId.value = item.value['id'];
        sizePrice.value = double.parse(item.value['plus_price'].toString());
      }
      return Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(sizeW15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color:  greyOpacityColor.withOpacity(0.3),
                  offset: const Offset(0, 0),
                  blurRadius: 5.0,
                )
              ],
            ),
            padding: EdgeInsets.only(top: sizeH15,bottom: sizeH15,right: sizeW15,left: sizeW15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    sizeId.value = item.value['id'];
                    sizePrice.value = double.parse(item.value['plus_price'].toString());
                  },
                  child: Row(
                    children: [
                      Container(
                        width: sizeW20,
                        height: sizeW20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW45),
                            border: Border.all(color: primaryColor,width: 1.4),
                            color: sizeId.value == item.value['id'] ? primaryColor:whitecolor
                        ),
                      ),
                      SizedBox(width: sizeW10,),
                      Text(item.value['title'],style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),
                int.parse(item.value['plus_price']) > 0? Text(item.value['plus_price'],style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),):Container()
              ],
            ),
          ),
          SizedBox(height: sizeH15,),
        ],
      );
    }).toList();
    return imageSliders;
  }

  List<Widget> createAdds() {
    List<Widget> imageSliders = additions.asMap().entries.map((item) {
      return Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(sizeW15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color:  greyOpacityColor.withOpacity(0.3),
                  offset: const Offset(0, 0),
                  blurRadius: 5.0,
                )
              ],
            ),
            padding: EdgeInsets.only(top: sizeH15,bottom: sizeH15,right: sizeW15,left: sizeW15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    addId.value = item.value['id'];
                    addPrice.value = double.parse(item.value['price'].toString());
                  },
                  child: Row(
                    children: [
                      Container(
                        width: sizeW20,
                        height: sizeW20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW45),
                            border: Border.all(color: primaryColor,width: 1.4),
                            color: addId.value == item.value['id'] ? primaryColor:whitecolor
                        ),
                      ),
                      SizedBox(width: sizeW10,),
                      Text(item.value['title'],style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),
                int.parse(item.value['price']) > 0? Text(item.value['price'],style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),):Container()
              ],
            ),
          ),
          SizedBox(height: sizeH15,),
        ],
      );
    }).toList();
    return imageSliders;
  }

  @override
  void onClose() {
    note.dispose();
    super.onClose();
  }
}
