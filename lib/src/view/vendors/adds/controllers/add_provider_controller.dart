import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../constance.dart';
import '../../../../../http/request.dart';
import '../../../../../http/url.dart';
import '../../vendor_home/vendor_home_view.dart';

class AddProviderController extends GetxController {
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

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  addProvider(sectionId,image,street,lat,long,images,context) async {
    var data = {
      'section_id': sectionId,
      'image' : image,
      'addres_text' : street,
      'latitude' : lat,
      'longitude' : long,
      'location_text' : locationName.text,
      'title' : title.text,
      'desc' : note.text,
      'price' : price.text,
      'from_time' : fromTime.text,
      'to_time' : toTime.text,
      'images' : images,
      'delivery' : delivery.text,
      'am_from' : amFrom.text,
      'am_to' : amTo.text,
      'pm_from' : pmFrom.text,
      'pm_to' : pmTo.text,
      'category_name' : categoryName.text,
      'person_count' : personCount.text
    };
    Request request = Request(url: urlAddProvider, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        Get.offAll(()=> VendorHomeView(section: int.parse(value['data']['section_id'].toString()),providerData: value['data'],),arguments: [value['data']]);
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
