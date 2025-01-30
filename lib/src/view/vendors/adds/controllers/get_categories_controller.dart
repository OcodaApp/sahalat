import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../constance.dart';
import '../../../../../http/request.dart';
import '../../../../../http/url.dart';
import '../../../../../model/categories_model.dart';
import '../../../../../model/products_list_model.dart';
import '../../../../../model/services_modal.dart';
import '../../products/edit_product.dart';
import '../categories/edit_category.dart';
import '../packs/edit_pack.dart';
import '../services/edit_service.dart';

class GetCategoriesController extends GetxController {
  var providerId = 0.obs;
  var sectionsData = [].obs;
  var productsData = [].obs;
  var servicesData = [].obs;
  var isSections = false.obs;
  var isProducts = false.obs;
  var isServices = false.obs;
  @override
  void onInit() {
    providerId.value = Get.arguments[0];
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

        ProductsListModel productsListModel = ProductsListModel.fromJson(value['data']);
        productsData.value = productsListModel.data!;
        isProducts.value = true;

        ServicesListModel servicesListModel = ServicesListModel.fromJson(value['data']);
        servicesData.value = servicesListModel.service!;
        isServices.value = true;
      }
    }).catchError((onError) {
      print('onError');
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

  deleteSection(sectionId) async {
    var data = {
      'section_id': sectionId,
    };
    Request request = Request(url: urldeleteSectionProvider, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        getProviderData();
      }
    }).catchError((onError) {
      getProviderData();
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

  deleteService(serviceId) async {
    var data = {
      'service_id': serviceId,
    };
    Request request = Request(url: urldeleteService, body: data);
    request.postAuth().then((value) {
      if (value['status']) {
        getProviderData();
      }
    }).catchError((onError) {
      getProviderData();
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

  deleteProduct(productId) async {
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
      'product_id': productId,
    };
    Request request = Request(url: urldeleteProduct, body: data);
    request.postAuth().then((value) {
      Get.back();
      if (value['status']) {
        getProviderData();
      }
    }).catchError((onError) {
      getProviderData();
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

  List<Widget> createSections(providerData) {
    List<Widget> imageSliders = sectionsData.asMap().entries.map((item) {
      return item.value.type == 'cat'? Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW15),
              border: Border.all(color: primaryColor,width: 1)
            ),
            padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 1.8,
                  child: Text(item.value.title,style: TextStyle(color: const Color(0xFF797C7E),fontSize: sizeW16,fontWeight: FontWeight.w400),),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: ()async{
                        await Get.to(()=>EditCategory(providerData : providerData),arguments: [item.value.id,item.value]);
                        getProviderData();
                      },
                      child: Image.asset('assets/icons/edit-2.png',color: primaryColor,),
                    ),
                    SizedBox(width: sizeW20,),
                    GestureDetector(
                      onTap: (){
                        deleteSection(item.value.id);
                      },
                      child: Image.asset('assets/icons/trash.png',color: primaryColor,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: sizeH15,),
        ],
      ):Container();
    }).toList();
    return imageSliders;
  }

  List<Widget> createServices(providerData) {
    List<Widget> imageSliders = servicesData.asMap().entries.map((item) {
      return  Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW15),
              border: Border.all(color: primaryColor,width: 1)
            ),
            padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 1.8,
                  child: Text(item.value.title,style: TextStyle(color: const Color(0xFF797C7E),fontSize: sizeW16,fontWeight: FontWeight.w400),),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: ()async{
                        await Get.to(()=>EditService(providerData : providerData),arguments: [item.value.id,item.value,providerData['id']]);
                        getProviderData();
                      },
                      child: Image.asset('assets/icons/edit-2.png',color: primaryColor,),
                    ),
                    SizedBox(width: sizeW20,),
                    GestureDetector(
                      onTap: (){
                        deleteService(item.value.id);
                      },
                      child: Image.asset('assets/icons/trash.png',color: primaryColor,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: sizeH15,),
        ],
      );
    }).toList();
    return imageSliders;
  }

  List<Widget> createPackages(providerData) {
    List<Widget> imageSliders = sectionsData.asMap().entries.map((item) {
      return item.value.type == 'pack'?Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW15),
              border: Border.all(color: primaryColor,width: 1)
            ),
            padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 1.8,
                  child: Text(item.value.title,style: TextStyle(color: const Color(0xFF797C7E),fontSize: sizeW16,fontWeight: FontWeight.w400),),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: ()async{
                        await Get.to(()=>EditPackEvent(providerData : providerData),arguments: [item.value.id,item.value,providerData['id']]);
                        getProviderData();
                      },
                      child: Image.asset('assets/icons/edit-2.png',color: primaryColor,),
                    ),
                    SizedBox(width: sizeW20,),
                    GestureDetector(
                      onTap: (){
                        deleteSection(item.value.id);
                      },
                      child: Image.asset('assets/icons/trash.png',color: primaryColor,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: sizeH15,),
        ],
      ):Container();
    }).toList();
    return imageSliders;
  }

  List<Widget> createProducts(providerData) {
    List<Widget> imageSliders = productsData.asMap().entries.map((item) {
      return Column(
        children: [
          Row(
            children: [
              FadeInDown(
                child: Container(
                  width: sizeW100,
                  height: sizeW100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.circular(sizeW15),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: greyOpacityColor.withOpacity(.3),
                        offset: const Offset(0, 0),
                        blurRadius: 10.0,
                      )
                    ],
                    image: DecorationImage(image: NetworkImage(item.value.image),fit: BoxFit.fill)
                  ),
                  // child: Center(
                  //   child: Image.network(item.value.image,width: sizeW100,height: sizeW100,),
                  // ),
                ),
              ),
              SizedBox(width: sizeW10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width /2.5,
                          child: Text(item.value.name,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),)),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                await Get.to(()=>EditProduct(providerData : providerData),arguments: [item.value.id,item.value]);
                                getProviderData();
                              },
                              child: Image.asset('assets/icons/edit-2.png',color: primaryColor,),
                            ),
                            SizedBox(width: sizeW15,),
                            GestureDetector(
                              onTap: (){
                                deleteProduct(item.value.id);
                              },
                              child: Image.asset('assets/icons/trash.png',color: primaryColor,),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: sizeH5,),
                    Text(item.value.desc,style: TextStyle(color: greyOpacityColor,fontSize: sizeW14,fontWeight: FontWeight.w500,height: 1.4),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: item.key +1 == productsData.length ? 0: sizeH20,),
          Container(height: item.key +1 == productsData.length ? 0:1,color: greyOpacityColor,width: Get.width,),
          SizedBox(height: item.key+1 == productsData.length ? 0:sizeH20,),
        ],
      );
    }).toList();
    return imageSliders;
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
