import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../../../../constance.dart';
import '../../../../../../http/request.dart';
import '../../../../../../http/url.dart';
import '../../../../../../model/categories_model.dart';

class AddPcakcageController extends GetxController {
  var sectionName= ''.obs;
  var sectionsData = [].obs;
  var providerId= 0.obs;
  var isSections = false.obs;
  late TextEditingController sectionId= TextEditingController();
  late TextEditingController title= TextEditingController();
  late TextEditingController price= TextEditingController();
  late TextEditingController note= TextEditingController();

  @override
  void onInit() {
    providerId.value = Get.arguments[0];
    getProviderData();
    super.onInit();
  }

  addPackage(image) async {
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
      'provider_id': providerId.value,
      'title' : title.text,
      'description' : note.text,
      'price' : price.text,
      'type' : 'pack',
    };
    if(image != ''){
      data.addAll({'image' : image});
    }
    if(sectionId.text.isNotEmpty){
      data.addAll({'provider_section_id' : sectionName.value});
    }
    Request request = Request(url: urladdCategory, body: data);
    request.postAuth().then((value) {
      Get.back();
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
        title.clear();
        price.clear();
        note.clear();
        sectionId.clear();
        Get.back();
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

  getProviderData() async {
    var data = {
      'provider_id': providerId.value,
    };
    Request request = Request(url: urlgetProviderData, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        CategoriesListModel sectionsListModel = CategoriesListModel.fromJson(value['data']);
        sectionsData.value = sectionsListModel.category!;
        isSections.value = true;
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

  page1(BuildContext modalSheetContext) {
    return WoltModalSheetPage(
      navBarHeight : 1,
      topBar : Container(color: primaryColor.withOpacity(.1),),
      hasSabGradient: false,
      stickyActionBar: Container(
        padding: EdgeInsets.only(top: sizeH15,bottom: sizeH15),
        margin: EdgeInsets.only(right: sizeW15,left: sizeW15),
        decoration :  const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: grey3,
              width: 0.5,
            ),
          ),
        ),
        child:  Row(
          children: [
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Text(
                'Close'.tr,
                style:  TextStyle(
                  fontSize: sizeW16,
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  
                ),
              ),
            ),
          ],
        ),
      ),
      // topBarTitle: const Text('Pagination'),
      isTopBarLayerAlwaysVisible: false,
      child: SizedBox(
        height: Get.height / 2,
        child:  ListView(
          children:  [
            SizedBox(height: sizeH30,),
            Obx(() => isSections.value ?SizedBox(
              height: Get.height /2,
              child: ListView.builder(
                itemCount: sectionsData.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return sectionsData[index].type == 'cat'? Padding(
                    padding: EdgeInsets.only(left: sizeW15, right: sizeW15,bottom: sizeH15),
                    child: GestureDetector(
                      onTap: (){
                        sectionName.value =sectionsData[index].id.toString();
                        sectionId.text =sectionsData[index].title;
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(sizeW15),
                        decoration: BoxDecoration(
                          border: Border.all(color: sectionName.value == sectionsData[index].id.toString() ?  primaryColor:greyOpacityColor,width: 1),
                          borderRadius: BorderRadius.circular(sizeW15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Get.width / 2,
                              child: Text(
                                sectionsData[index].title,
                                style: TextStyle(
                                  color: blackolor,
                                  fontSize: sizeW14,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Container(
                              width: sizeW25,
                              height: sizeW25,
                              padding: EdgeInsets.all(sizeW15),
                              decoration: BoxDecoration(
                                color: sectionName.value == sectionsData[index].id.toString() ? primaryColor:whitecolor,
                                border: Border.all(color: sectionName.value == sectionsData[index].id.toString() ?primaryColor:grey3,width: 1),
                                borderRadius: BorderRadius.circular(sizeW45),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ):Container();
                },
              ),
            ):Container(),),
            SizedBox(height: sizeH100,),
          ],
        ),
      ),
    );
  }
  

  @override
  void onClose() {
    title.dispose();
    price.dispose();
    note.dispose();
    sectionId.dispose();
    super.onClose();
  }
}
