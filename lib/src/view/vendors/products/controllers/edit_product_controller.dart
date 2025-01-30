import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../../../constance.dart';
import '../../../../../http/request.dart';
import '../../../../../http/url.dart';
import '../../../../../model/categories_model.dart';

class EditProductController extends GetxController {
  var productId = 0.obs;
  var sectionName= ''.obs;
  var providerId= 0.obs;
  var sectionsData = [].obs;
  var isSections = false.obs;
  late TextEditingController sectionId= TextEditingController();
  late TextEditingController title= TextEditingController();
  late TextEditingController price= TextEditingController();
  late TextEditingController note= TextEditingController();
  var oldImage = ''.obs;
  var oldImageUrl = ''.obs;
  var olditemsSize = [].obs;
  var olditemsAdds = [].obs;

  @override
  void onInit() {
    olditemsSize.value = Get.arguments[1].sizes;
    olditemsAdds.value = Get.arguments[1].additions;
    oldImageUrl.value = Get.arguments[1].image;
    oldImage.value = Get.arguments[1].img;
    productId.value = Get.arguments[0];
    title.text = Get.arguments[1].name;
    price.text = Get.arguments[1].price.toString();
    note.text = Get.arguments[1].desc;
    providerId.value= Get.arguments[1].providerId;
    sectionName.value= Get.arguments[1].sectionId.toString();
    sectionId.text= Get.arguments[1].sectionName.toString();
    getProviderData();
    super.onInit();
  }

  List<Widget> createSizes(context,pageIndexNotifier) {
    List<Widget> imageSliders = olditemsSize.asMap().entries.map((item) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width / 2.2,
                height: sizeH40,
                padding: EdgeInsets.all(sizeW10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sizeW15),
                  border: Border.all(color: greyOpacityColor,width: 1.5)
                ),
                child: Text(item.value['title'],style: TextStyle(
                  fontSize: sizeW16,
                  color: blackolor,
                  fontWeight: FontWeight.w400,
                ),),
              ),
              Container(
                width: Get.width / 2.9,
                height: sizeH40,
                padding: EdgeInsets.all(sizeW10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sizeW15),
                  border: Border.all(color: greyOpacityColor,width: 1.5)
                ),
                child: Text(item.value['plus_price'],style: TextStyle(
                  fontSize: sizeW16,
                  color: blackolor,
                  fontWeight: FontWeight.w400,
                ),),
              ),
              GestureDetector(
                onTap: (){
                  WoltModalSheet.show<void>(
                    pageIndexNotifier: pageIndexNotifier,
                    context: context,
                    pageListBuilder: (modalSheetContext) {
                      return [
                        editSize(modalSheetContext,item.value),
                      ];
                    },
                    modalTypeBuilder: (context) {
                      return WoltModalType.bottomSheet();
                    },
                    onModalDismissedWithBarrierTap: () {
                      debugPrint('Closed modal sheet with barrier tap');
                      Navigator.of(context).pop();
                      pageIndexNotifier.value = 0;
                    },
                    // maxDialogWidth: 560,
                    // minDialogWidth: 400,
                    // minPageHeight: 0.0,
                    // maxPageHeight: Get.height /2,
                  );
                },
                child: Image.asset('assets/icons/edit-2.png',color: primaryColor,),
              ),
            ],
          ),
          SizedBox(height: item.key +1 == olditemsSize.length ? 0: sizeH10,),
        ],
      );
    }).toList();
    return imageSliders;
  }

  late TextEditingController titleSize= TextEditingController();
  late TextEditingController pricesize= TextEditingController();
  editSize(BuildContext modalSheetContext,item) {
    titleSize.text = item['title'];
    pricesize.text = item['plus_price'].toString();
    return WoltModalSheetPage(
      navBarHeight : 1,
      topBar : Container(color: primaryColor.withOpacity(.1),),
      hasSabGradient: false,
     
      // topBarTitle: const Text('Pagination'),
      isTopBarLayerAlwaysVisible: false,
      child: Container(
        padding: EdgeInsets.all(sizeW25),
        height: Get.height / 3.7,
        child:  ListView(
          children:  [
            SizedBox(height: sizeH30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 2,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: titleSize,
                    decoration:  InputDecoration(
                      hintText: '${'size'.tr} 1',
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
                  width: Get.width / 3,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.number,
                    controller: pricesize,
                    decoration:  InputDecoration(
                      hintText: '${'price'.tr} 1',
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
            SizedBox(height: sizeH10,),
            Container(height: 1,color: greyOpacityColor,width: Get.width,),
            SizedBox(height: sizeH10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  elevation: 0,
                  color: whitecolor,
                  minWidth: Get.width / 2.6,
                  height: sizeH40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: (){
                    Get.back();
                  },
                  child: Text(
                    'Close'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                MaterialButton(
                  elevation: 0,
                  color: primaryColor,
                  minWidth: Get.width / 2.6,
                  height: sizeH40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                  ),
                  onPressed: (){
                    apiEditSize(item['id'],titleSize.text,pricesize.text);
                  },
                  child: Text(
                    'save'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: whitecolor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                
              ],
            ),
            SizedBox(height: sizeH10,),
          ],
        ),
      ),
    );
  }

  List<Widget> createAdds(context,pageIndexNotifier) {
    List<Widget> imageSliders = olditemsAdds.asMap().entries.map((item) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width / 2.2,
                height: sizeH40,
                padding: EdgeInsets.all(sizeW10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sizeW15),
                  border: Border.all(color: greyOpacityColor,width: 1.5)
                ),
                child: Text(item.value['title'],style: TextStyle(
                  fontSize: sizeW16,
                  color: blackolor,
                  fontWeight: FontWeight.w400,
                ),),
              ),
              Container(
                width: Get.width / 2.9,
                height: sizeH40,
                padding: EdgeInsets.all(sizeW10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sizeW15),
                  border: Border.all(color: greyOpacityColor,width: 1.5)
                ),
                child: Text(item.value['price'],style: TextStyle(
                  fontSize: sizeW16,
                  color: blackolor,
                  fontWeight: FontWeight.w400,
                ),),
              ),
              GestureDetector(
                onTap: (){
                  WoltModalSheet.show<void>(
                    pageIndexNotifier: pageIndexNotifier,
                    context: context,
                    pageListBuilder: (modalSheetContext) {
                      return [
                        editAdds(modalSheetContext,item.value),
                      ];
                    },
                    modalTypeBuilder: (context) {
                      return WoltModalType.bottomSheet();
                    },
                    onModalDismissedWithBarrierTap: () {
                      debugPrint('Closed modal sheet with barrier tap');
                      Navigator.of(context).pop();
                      pageIndexNotifier.value = 0;
                    },
                    // maxDialogWidth: 560,
                    // minDialogWidth: 400,
                    // minPageHeight: 0.0,
                    // maxPageHeight: Get.height /2,
                  );
                },
                child: Image.asset('assets/icons/edit-2.png',color: primaryColor,),
              ),
            ],
          ),
          SizedBox(height: item.key +1 == olditemsAdds.length ? 0: sizeH10,),
        ],
      );
    }).toList();
    return imageSliders;
  }

  late TextEditingController titleAdds= TextEditingController();
  late TextEditingController priceAdds= TextEditingController();
  editAdds(BuildContext modalSheetContext,item) {
    titleAdds.text = item['title'];
    priceAdds.text = item['price'].toString();
    return WoltModalSheetPage(
      navBarHeight : 1,
      topBar : Container(color: primaryColor.withOpacity(.1),),
      hasSabGradient: false,
     
      // topBarTitle: const Text('Pagination'),
      isTopBarLayerAlwaysVisible: false,
      child: Container(
        padding: EdgeInsets.all(sizeW25),
        height: Get.height / 3.7,
        child:  ListView(
          children:  [
            SizedBox(height: sizeH30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 2,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.text,
                    controller: titleAdds,
                    decoration:  InputDecoration(
                      hintText: '${'size'.tr} 1',
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
                  width: Get.width / 3,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.number,
                    controller: priceAdds,
                    decoration:  InputDecoration(
                      hintText: '${'price'.tr} 1',
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
            SizedBox(height: sizeH10,),
            Container(height: 1,color: greyOpacityColor,width: Get.width,),
            SizedBox(height: sizeH10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  elevation: 0,
                  color: whitecolor,
                  minWidth: Get.width / 2.6,
                  height: sizeH40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: (){
                    Get.back();
                  },
                  child: Text(
                    'Close'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                MaterialButton(
                  elevation: 0,
                  color: primaryColor,
                  minWidth: Get.width / 2.6,
                  height: sizeH40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                  ),
                  onPressed: (){
                    apiEditAdds(item['id'],titleAdds.text,priceAdds.text);
                  },
                  child: Text(
                    'save'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: whitecolor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                
              ],
            ),
            SizedBox(height: sizeH10,),
          ],
        ),
      ),
    );
  }

  final formKeyAdds = GlobalKey<FormState>();
  late TextEditingController titleAddsA= TextEditingController();
  late TextEditingController priceAddsA= TextEditingController();
  addAdds(BuildContext modalSheetContext) {
    return WoltModalSheetPage(
      navBarHeight : 1,
      topBar : Container(color: primaryColor.withOpacity(.1),),
      hasSabGradient: false,
     
      // topBarTitle: const Text('Pagination'),
      isTopBarLayerAlwaysVisible: false,
      child: Container(
        padding: EdgeInsets.all(sizeW25),
        height: Get.height / 3.7,
        child:  ListView(
          children:  [
            SizedBox(height: sizeH30,),
            Form(
              key: formKeyAdds,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 2,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.text,
                      controller: titleAddsA,
                      decoration:  InputDecoration(
                        hintText: '${'addtion'.tr} 1',
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
                        if(value!.isEmpty){
                          return 'required'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 3,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.number,
                      controller: priceAddsA,
                      decoration:  InputDecoration(
                        hintText: '${'price'.tr} 1',
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
                        if(value!.isEmpty){
                          return 'required'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sizeH10,),
            Container(height: 1,color: greyOpacityColor,width: Get.width,),
            SizedBox(height: sizeH10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  elevation: 0,
                  color: whitecolor,
                  minWidth: Get.width / 2.6,
                  height: sizeH40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: (){
                    Get.back();
                  },
                  child: Text(
                    'Close'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                MaterialButton(
                  elevation: 0,
                  color: primaryColor,
                  minWidth: Get.width / 2.6,
                  height: sizeH40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                  ),
                  onPressed: (){
                    if (!formKeyAdds.currentState!.validate()) {

                    }else{
                      apiAddAdds(titleAddsA.text,priceAddsA.text);
                    }
                    
                  },
                  child: Text(
                    'save'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: whitecolor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                
              ],
            ),
            SizedBox(height: sizeH10,),
          ],
        ),
      ),
    );
  }

  final formKeySize = GlobalKey<FormState>();
  late TextEditingController titleSizeA= TextEditingController();
  late TextEditingController priceSizeA= TextEditingController();
  addSizes(BuildContext modalSheetContext) {
    return WoltModalSheetPage(
      navBarHeight : 1,
      topBar : Container(color: primaryColor.withOpacity(.1),),
      hasSabGradient: false,
     
      // topBarTitle: const Text('Pagination'),
      isTopBarLayerAlwaysVisible: false,
      child: Container(
        padding: EdgeInsets.all(sizeW25),
        height: Get.height / 3.7,
        child:  ListView(
          children:  [
            SizedBox(height: sizeH30,),
            Form(
              key: formKeySize,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 2,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.text,
                      controller: titleSizeA,
                      decoration:  InputDecoration(
                        hintText: '${'size'.tr} 1',
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
                        if(value!.isEmpty){
                          return 'required'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 3,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType : TextInputType.number,
                      controller: priceSizeA,
                      decoration:  InputDecoration(
                        hintText: '${'price'.tr} 1',
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
                        if(value!.isEmpty){
                          return 'required'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sizeH10,),
            Container(height: 1,color: greyOpacityColor,width: Get.width,),
            SizedBox(height: sizeH10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  elevation: 0,
                  color: whitecolor,
                  minWidth: Get.width / 2.6,
                  height: sizeH40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: (){
                    Get.back();
                  },
                  child: Text(
                    'Close'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                MaterialButton(
                  elevation: 0,
                  color: primaryColor,
                  minWidth: Get.width / 2.6,
                  height: sizeH40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sizeW15),
                  ),
                  onPressed: (){
                    if (!formKeySize.currentState!.validate()) {

                    }else{
                      apiAddSize(titleSizeA.text,priceSizeA.text);
                    }
                    
                  },
                  child: Text(
                    'save'.tr,
                    style:  TextStyle(
                      fontSize: sizeW16,
                      color: whitecolor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                
              ],
            ),
            SizedBox(height: sizeH10,),
          ],
        ),
      ),
    );
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
                  return Padding(
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
                  );
                },
              ),
            ):Container(),),
            SizedBox(height: sizeH100,),
          ],
        ),
      ),
    );
  }
  
  editProduct(image) async {
    var data = {
      'product_id': productId.value,
      'title' : title.text,
      'description' : note.text,
      'price' : price.text,
      'section_id' : sectionName.value,
    };

    if(image != ''){
      data.addAll({'image' : image});
    }
    Request request = Request(url: urleditProduct, body: data);
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
        oldImage.value = value['data']['image'];
        oldImageUrl.value = value['data']['image_url'];
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

  apiEditSize(sizeId,titleS,priceS) async {
    var data = {
      'size_id': sizeId,
      'title' : titleS,
      'plus_price' : priceS,
    };
    Request request = Request(url: urleditProductSize, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        olditemsSize.clear();
        olditemsSize.value  = value['data'];
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

  apiEditAdds(addId,titleA,priceA) async {
    var data = {
      'add_id': addId,
      'title' : titleA,
      'price' : priceA,
    };
    Request request = Request(url: urleditProductAdds, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        olditemsAdds.clear();
        olditemsAdds.value  = value['data'];
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

  apiAddAdds(titleAA,priceAA) async {
    var data = {
      'product_id': productId.value,
      'title' : titleAA,
      'price' : priceAA,
    };
    Request request = Request(url: urladdProductAdds, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        olditemsAdds.clear();
        olditemsAdds.value  = value['data'];
        titleAddsA.clear();
        priceAddsA.clear();
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

  apiAddSize(titleSA,priceSA) async {
    var data = {
      'product_id': productId.value,
      'title' : titleSA,
      'plus_price' : priceSA,
    };
    Request request = Request(url: urladdProductSize, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        olditemsSize.clear();
        olditemsSize.value  = value['data'];
        titleSizeA.clear();
        priceSizeA.clear();
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
  

  @override
  void onClose() {
    title.dispose();
    sectionId.dispose();
    price.dispose();
    note.dispose();
    super.onClose();
  }
}
