import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../../../constance.dart';
import '../../../../../http/request.dart';
import '../../../../../http/url.dart';
import '../../../../../model/categories_model.dart';

class AddProductController extends GetxController {
  var sectionName= ''.obs;
  var providerId= 0.obs;
  var sectionsData = [].obs;
  var isSections = false.obs;
  late TextEditingController sectionId= TextEditingController();
  late TextEditingController title= TextEditingController();
  late TextEditingController price= TextEditingController();
  late TextEditingController note= TextEditingController();

  @override
  void onInit() {
    providerId.value = Get.arguments[0]['id'];
    getProviderData();
    super.onInit();
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

  page2(BuildContext modalSheetContext) {
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
                  return sectionsData[index].type == 'pack'? Padding(
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
  
  addProduct(image) async {
    var data = {
      'provider_id': providerId.value,
      'title' : title.text,
      'description' : note.text,
      'price' : price.text,
      'section_id' : sectionName.value,
      'image' : image
    };

    if(itemsAdds.isNotEmpty && itemsAddsPrice.isNotEmpty){
      data.addAll({'additions':itemsAdds});
      data.addAll({'additions_price':itemsAddsPrice});
    }

    if(itemsSize.isNotEmpty ){
      data.addAll({'sizes':itemsSize});
      data.addAll({'sizes_price':itemsPrice});
    }
    Request request = Request(url: urladdProduct, body: data);
    request.postAuth().then((value) {
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
        sectionId.clear();
        price.clear();
        note.clear();
        sectionName.value= '';
        providerId.value= 0;
        itemsSize.clear();
        itemsAdds.clear();
        itemsAddsPrice.clear();
        itemsPrice.clear();
        listAdds.clear();
        listSizes.clear();
        fieldCountSizez.value = 1;
        fieldCountAdds.value = 1;
        
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
    sectionId.dispose();
    price.dispose();
    note.dispose();
    super.onClose();
  }

  var listSizes = [].obs;
  var fieldCountSizez = 1.obs;
  List<Map<String, dynamic>> itemsSize = [];
  List<Map<String, dynamic>> itemsPrice = [];

  dynamic storeValueSize(int i, String v) {
    bool valueFound = false;

    for (int j = 1; j < itemsSize.length; j++) {
      if (itemsSize[j].containsKey("id")) {
        if (itemsSize[j]["id"] == i) {
          valueFound = !valueFound;
          break;
        }
      }
    }

    /// If value is found
    if (valueFound) {
      itemsSize.removeWhere((e) => e["id"] == i);
    }
    itemsSize.add({
      "id": i,
      "title": v,
    });
  }

  dynamic storeValuePrice(int i, String v) {
    bool valueFound = false;

    for (int j = 1; j < itemsPrice.length; j++) {
      if (itemsPrice[j].containsKey("id")) {
        if (itemsPrice[j]["id"] == i) {
          valueFound = !valueFound;
          break;
        }
      }
    }

    /// If value is found
    if (valueFound) {
      itemsPrice.removeWhere((e) => e["id"] == i);
    }
    itemsPrice.add({
      "id": i,
      "price": v,
    });
  }
  Widget buildFieldSizes(int i) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width / 1.8,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType : TextInputType.text,
                onChanged: (data) => storeValueSize(i+2, data),
                decoration:  InputDecoration(
                  hintText: '${'size'.tr } ${i+2}',
                  contentPadding: EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    right: sizeW15,
                    left: sizeW15,
                  ),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: greyOpacityColor,
                      width:1.5,
                    ),
                  ),
                  hintStyle:  TextStyle(
                    fontSize: sizeW16,
                    color: greyOpacityColor,
                    fontWeight: FontWeight.w400,
                  ),
                  
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: greyOpacityColor,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
                style:  TextStyle(
                  fontSize: sizeW16,
                  color: blackolor,
                  fontWeight: FontWeight.w400,
                ),
                validator: (value) {
                  return null;
                },
              ),
            ),
            SizedBox(
              width: Get.width / 2.9,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType : TextInputType.number,
                onChanged: (data) => storeValuePrice(i+2, data),
                decoration:  InputDecoration(
                  hintText: '${'price'.tr } ${i+2}',
                  contentPadding: EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    right: sizeW15,
                    left: sizeW15,
                  ),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: greyOpacityColor,
                      width:1.5,
                    ),
                  ),
                  hintStyle:  TextStyle(
                    fontSize: sizeW16,
                    color: greyOpacityColor,
                    fontWeight: FontWeight.w400,
                  ),
                  
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: greyOpacityColor,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
                style:  TextStyle(
                  fontSize: sizeW16,
                  color: blackolor,
                  fontWeight: FontWeight.w400,
                ),
                validator: (value) {
                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: sizeH15,),
      ],
    );
  }

  var listAdds = [].obs;
  var fieldCountAdds = 1.obs;
  List<Map<String, dynamic>> itemsAdds = [];
  List<Map<String, dynamic>> itemsAddsPrice = [];

  dynamic storeValueAdds(int i, String v) {
    bool valueFound = false;

    for (int j = 1; j < itemsAdds.length; j++) {
      if (itemsAdds[j].containsKey("id")) {
        if (itemsAdds[j]["id"] == i) {
          valueFound = !valueFound;
          break;
        }
      }
    }

    /// If value is found
    if (valueFound) {
      itemsAdds.removeWhere((e) => e["id"] == i);
    }
    itemsAdds.add({
      "id": i,
      "title": v,
    });
  }

  dynamic storeValueAddsPrice(int i, String v) {
    bool valueFound = false;

    for (int j = 1; j < itemsAddsPrice.length; j++) {
      if (itemsAddsPrice[j].containsKey("id")) {
        if (itemsAddsPrice[j]["id"] == i) {
          valueFound = !valueFound;
          break;
        }
      }
    }

    /// If value is found
    if (valueFound) {
      itemsAddsPrice.removeWhere((e) => e["id"] == i);
    }
    itemsAddsPrice.add({
      "id": i,
      "price": v,
    });
  }

  Widget buildFieldAdds(int i) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width / 1.8,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType : TextInputType.text,
                onChanged: (data) => storeValueAdds(i+2, data),
                decoration:  InputDecoration(
                  hintText: '${'addtion'.tr } ${i+2}',
                  contentPadding: EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    right: sizeW15,
                    left: sizeW15,
                  ),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: greyOpacityColor,
                      width:1.5,
                    ),
                  ),
                  hintStyle:  TextStyle(
                    fontSize: sizeW16,
                    color: greyOpacityColor,
                    fontWeight: FontWeight.w400,
                  ),
                  
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: greyOpacityColor,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
                style:  TextStyle(
                  fontSize: sizeW16,
                  color: blackolor,
                  fontWeight: FontWeight.w400,
                ),
                validator: (value) {
                  return null;
                },
              ),
            ),
            SizedBox(
              width: Get.width / 2.9,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType : TextInputType.number,
                onChanged: (data) => storeValueAddsPrice(i+2, data),
                decoration:  InputDecoration(
                  hintText: '${'price'.tr } ${i+2}',
                  contentPadding: EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    right: sizeW15,
                    left: sizeW15,
                  ),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: greyOpacityColor,
                      width:1.5,
                    ),
                  ),
                  hintStyle:  TextStyle(
                    fontSize: sizeW16,
                    color: greyOpacityColor,
                    fontWeight: FontWeight.w400,
                  ),
                  
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: greyOpacityColor,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
                style:  TextStyle(
                  fontSize: sizeW16,
                  color: blackolor,
                  fontWeight: FontWeight.w400,
                ),
                validator: (value) {
                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: sizeH15,),
      ],
    );
  }
}
