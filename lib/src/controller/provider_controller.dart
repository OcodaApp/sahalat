import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../constance.dart';
import '../../../../../http/request.dart';
import '../../../../../http/url.dart';

class ProviderController extends GetxController {
  late TextEditingController title= TextEditingController();
  late TextEditingController locationName= TextEditingController();
  late TextEditingController fromTime= TextEditingController();
  late TextEditingController toTime= TextEditingController();
  late TextEditingController personCount= TextEditingController();
  late TextEditingController price= TextEditingController();
  late TextEditingController note= TextEditingController();
  late TextEditingController amFrom= TextEditingController();
  late TextEditingController amTo= TextEditingController();
  late TextEditingController pmFrom= TextEditingController();
  late TextEditingController pmTo= TextEditingController();
  late TextEditingController categoryName= TextEditingController();
  late TextEditingController delivery= TextEditingController();

  var editShow = false.obs;
  var oldImages = [].obs;
  var oldImage = ''.obs;
  var oldImageUrl = ''.obs;

  @override
  void onInit() {
    oldImages.value = Get.arguments[0]['images'];
    oldImage.value = Get.arguments[0]['image'];
    oldImageUrl.value = Get.arguments[0]['image_url'];
    title.text = Get.arguments[0]['title'] ?? '';
    categoryName.text = Get.arguments[0]['category_name'] ?? '';
    locationName.text = Get.arguments[0]['location_text'] ?? '';
    fromTime.text = Get.arguments[0]['from_time'] ?? '';
    toTime.text = Get.arguments[0]['to_time'] ?? '';
    personCount.text = Get.arguments[0]['person_count'] ?? '0';
    price.text = Get.arguments[0]['price'] ?? '0';
    note.text = Get.arguments[0]['desc'] ?? '';
    amFrom.text = Get.arguments[0]['am_from'] ?? '00:00:00';
    amTo.text = Get.arguments[0]['am_to'] ?? '00:00:00';
    pmFrom.text = Get.arguments[0]['pm_from'] ?? '00:00:00';
    pmTo.text = Get.arguments[0]['pm_to'] ?? '00:00:00';
    delivery.text = Get.arguments[0]['delivery'] ?? '0';

    super.onInit();
  }

  editProvider(image,context,providerId) async {
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
      'provider_id' : providerId,
      'location_text' : locationName.text,
      'title' : title.text,
      'desc' : note.text,
      'price' : price.text,
      'from_time' : fromTime.text,
      'to_time' : toTime.text,
      'delivery' : delivery.text,
      'am_from' : amFrom.text,
      'am_to' : amTo.text,
      'pm_from' : pmFrom.text,
      'pm_to' : pmTo.text,
      'category_name' : categoryName.text,
      'person_count' : personCount.text
    };

    if(image != ''){
      data.addAll({'image' : image});
    }
    
    Request request = Request(url: urlEditProvider, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        oldImages.value = value['data']['images'];
        oldImage.value = value['data']['image'];
        oldImageUrl.value = value['data']['image_url'];
        title.text = value['data']['title'] ?? '';
        categoryName.text = value['data']['category_name'] ?? '';
        locationName.text = value['data']['location_text'] ?? '';
        fromTime.text = value['data']['from_time'] ?? '';
        toTime.text = value['data']['to_time'] ?? '';
        personCount.text = value['data']['person_count'] ?? '0';
        price.text = value['data']['price'] ?? '0';
        note.text = value['data']['desc'] ?? '';
        amFrom.text = value['data']['am_from'] ?? '00:00:00';
        amTo.text = value['data']['am_to'] ?? '00:00:00';
        pmFrom.text = value['data']['pm_from'] ?? '00:00:00';
        pmTo.text = value['data']['pm_to'] ?? '00:00:00';
        delivery.text = value['data']['delivery'] ?? '0';
        editShow.value = false;
      }
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

  deleteImage(imageId,providerId) async {
    var data = {
      'image_id' : imageId,
      'provider_id' : providerId,
    };
    Request request = Request(url: urldeleteProviderImage, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        oldImages.value = value['data'];
        Fluttertoast.showToast(
          msg: value['msg'],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: sizeW14,
        );
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

  addImage(image,providerId) async {
    var data = {
      'provider_id' : providerId,
      'image' : image,
    };
    Request request = Request(url: urladdProviderImage, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        oldImages.value = value['data'];
        Fluttertoast.showToast(
          msg: value['msg'],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.white,
          fontSize: sizeW14,
        );
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
      print(onError);
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

  @override
  void onClose() {
    title.dispose();
    locationName.dispose();
    fromTime.dispose();
    toTime.dispose();
    personCount.dispose();
    price.dispose();
    note.dispose();
    amFrom.dispose();
    amTo.dispose();
    pmFrom.dispose();
    pmTo.dispose();
    categoryName.dispose();
    super.onClose();
  }
}
