// ignore_for_file: dead_code, avoid_function_literals_in_foreach_calls

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../../model/basket_list_modal.dart';
import '../../Halls/hall_page_edit.dart';
import '../../Halls/photos_edit.dart';
import '../../Restaurants/product_edit.dart';

class CartController extends GetxController {
  late TextEditingController notes;
  late TextEditingController coupon;
  var count = 1.obs;
  var cart = false.obs;
  var ordertype = 1.obs;

  var basketStoreCount = 0.obs;
  var basketStoreTotal = 0.0.obs;
  var isitems= false.obs;
  var basketsData = [].obs;


  var deliveryTotal= 0.0.obs;
  var salePrice= 0.0.obs;
  var sale= 0.obs;
  var allTotal= 0.0.obs;
  var timeAll= 0.0.obs;
  var couponId= '0'.obs;

  List shops = [].obs;
  List shopsProducts = [].obs;

  List photos = [].obs;
  List photosPackages = [].obs;

  List events = [].obs;
  List eventsProducts = [].obs;

  List salons = [].obs;
  List salonsServices = [].obs;
  getBaskets() async {
    Request request = Request(url: urlGetBaskets, body: null);
    request.postAuth().then((value) async {
      if (value['status']) {
        BasketsListModel basketsListModel = BasketsListModel.fromJson(value);
        basketsData.value = basketsListModel.basket!;
        if(basketsData.isNotEmpty){
          // isitems.value = true;
          cart.value = true;
          allTotal.value = double.parse(value['total'].toString());
          deliveryTotal.value = double.parse(value['delivery_total'].toString());
          salePrice.value = double.parse(value['sale_price'].toString());
          // shops
          basketsData.forEach((element) async {
            if(element.type == 'restaurants' || element.type == 'sweets' ||element.type == 'flowers'){
              if(shops.indexWhere((value) => value["provider_id"] == element.providerId) == -1){
                shops.addAll([
                  {
                    'id' : element.id,
                    'provider_id' : element.providerId,
                    'image' : element.productimageurl,
                    'providername' : element.providername,
                  }
                ]);
              }
            }
          });

          basketsData.forEach((element) async {
            if(element.type == 'restaurants' || element.type == 'sweets' ||element.type == 'flowers'){
              if(shopsProducts.indexWhere((value) => value.productid == element.productid) == -1){
                shopsProducts.addAll([
                  element
                ]);
              }
            }
          });
          

          // events
          basketsData.forEach((element) async {
            if(element.type == 'events'){
              if(events.indexWhere((value) => value.providerId == element.providerId) == -1){
                events.addAll([
                  element
                ]);
              }
            }
          });

          basketsData.forEach((element) async {
            if(element.type == 'events'){
              if(eventsProducts.indexWhere((value) => value.productid == element.productid) == -1){
                eventsProducts.addAll([
                  element
                ]);
              }
            }
          });

          // salons
          basketsData.forEach((element) async {
            if(element.type == 'salons' ){
              if(salons.indexWhere((value) => value.date == element.date) == -1){
                salons.addAll([
                  element
                ]);
              }
            }
          });

          basketsData.forEach((element) async {
            if(element.type == 'salons' ){
              if(salonsServices.indexWhere((value) => value.providerserviceid == element.providerserviceid && value.date == element.date) == -1){
                salonsServices.addAll([
                  element
                ]);
              }
            }
          });
          showAddAndMins.value = true;
        }else{
          cart.value = false;
        }
      } 
    }).catchError((onError) {
      print(onError);
    });
  }

  List<Widget> createSalons() {
    List<Widget> imageSliders = basketsData.asMap().entries.map<Widget>((item) {
      return item.value.type == 'salons'? Column(
        children: [
          Container(
            padding:  EdgeInsets.all(sizeW10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.value.providername,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                SizedBox(height: sizeH10,),
                Row(
                  children: [
                    FadeInDown(
                      child: Container(
                        height : sizeW100,
                        width: sizeW100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW15),
                          image: DecorationImage(
                            image: NetworkImage(item.value.providerimage,),
                            fit: BoxFit.fill,
                          ),
                        ),
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
                                width: Get.width / 3,
                                child: Text(item.value.datestring,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),)),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: ()async{
                                      serviceChooses.clear();
                                      categoryChooseShow.clear();
                                      serviceChooses.addAll([
                                        {
                                          'item_id' : item.value.id,
                                          'id' : item.value.providerserviceid,
                                          'price' : item.value.price,
                                          'count' : item.value.quantity,
                                          'total' : item.value.quantity * item.value.price,
                                        }
                                      ]);
                                      categoryChooseShow.add(item.value.providersectionid);
                                      await Get.to(()=>PhotoEdit(sectionsData: item.value.provider['section'],item : item.value),
                                      arguments: [
                                        item.value.providerId,
                                        item.value.provider,
                                        item.value.provider['section'],
                                        int.parse(item.value.providersectionid.toString()),
                                        double.parse(item.value.price.toString()),
                                        serviceChooses,
                                        categoryChooseShow,
                                        item.value.inorout,
                                        item.value.id
                                        ]
                                      );
                                      getBaskets();
                                    },
                                    child: Image.asset('assets/icons/edit-2.png',color: primaryColor,)),
                                  SizedBox(width: sizeW15,),
                                  GestureDetector(
                                    onTap: (){
                                      deleteItem(item.value.id);
                                    },
                                    child: Image.asset('assets/icons/trash.png',color: primaryColor,)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: sizeH5,),
                          Text(item.value.timestring,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                          SizedBox(height: sizeH5,),
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width / 3,
                                child: Text(item.value.providerservicename,
                                style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,)),
                              Text('${item.value.total} ${'SAR'.tr} ',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeH20,),
                Container(height: 1,color: blackolor,width: Get.width,)
              ],
            ),
          ),
        ],
      ):Container();
    }
    ).toList();
    return imageSliders;
  }
  List<int> categoryChooseShow = <int>[].obs;
  List serviceChooses = [].obs;

  List<Widget> createPhotos() {
    List<Widget> imageSliders = basketsData.asMap().entries.map<Widget>((item) {
      return item.value.type ==  'photographers'? Column(
        children: [
          Container(
            padding:  EdgeInsets.all(sizeW10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.value.providername,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                SizedBox(height: sizeH10,),
                Row(
                  children: [
                    FadeInDown(
                      child: Container(
                        height : sizeW100,
                        width: sizeW100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW15),
                          image: DecorationImage(
                            image: NetworkImage(item.value.providerimage,),
                            fit: BoxFit.fill,
                          ),
                        ),
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
                                width: Get.width / 3,
                                child: Text(item.value.provider['category_name'],style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),)),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: ()async{
                                      await Get.to(()=>PhotoEdit(sectionsData: item.value.provider['section'],item : item.value),
                                      arguments: [
                                        item.value.providerId,
                                        item.value.provider,
                                        item.value.provider['section'],
                                        int.parse(item.value.providersectionid.toString()),
                                        double.parse(item.value.price.toString()),
                                        ]
                                      );
                                      getBaskets();
                                    },
                                    child: Image.asset('assets/icons/edit-2.png',color: primaryColor,)),
                                  SizedBox(width: sizeW15,),
                                  GestureDetector(
                                    onTap: (){
                                      deleteItem(item.value.id);
                                    },
                                    child: Image.asset('assets/icons/trash.png',color: primaryColor,)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: sizeH5,),
                          Text(item.value.datestring,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                          SizedBox(height: sizeH5,),
                          Text(item.value.timestring,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                          SizedBox(height: sizeH5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width / 3,
                                child: Text(item.value.providersectionname,
                                style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,)),
                              Text('${item.value.price} ${'SAR'.tr} ',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeH20,),
                Container(height: 1,color: blackolor,width: Get.width,)
              ],
            ),
          ),
        ],
      ):Container();
    }
    ).toList();
    return imageSliders;
  }

  List<Widget> createHalls() {
    List<Widget> imageSliders = basketsData.asMap().entries.map<Widget>((item) {
      return item.value.type == 'halls' ? Column(
        children: [
          Container(
            padding:  EdgeInsets.only(right: sizeW10,left: sizeW10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: sizeH10,),
                Text(item.value.providername,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                SizedBox(height: sizeH10,),
                Row(
                  children: [
                    FadeInDown(
                      child: Container(
                        height : sizeW100,
                        width: sizeW100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW15),
                          image: DecorationImage(
                            image: NetworkImage(item.value.providerimage,),
                            fit: BoxFit.fill,
                          ),
                        ),
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
                                width: Get.width /3,
                                child: Text(item.value.datestring,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),)),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: ()async{
                                      await Get.to(()=>HallPageEdit(sectionsData: item.value.provider['section'],item : item.value),
                                      arguments: [item.value.providerId,item.value.provider,item.value.provider['section']]);
                                      getBaskets();
                                    },
                                    child: Image.asset('assets/icons/edit-2.png',color: primaryColor,)),
                                  SizedBox(width: sizeW15,),
                                  GestureDetector(
                                    onTap: (){
                                      deleteItem(item.value.id);
                                    },
                                    child: Image.asset('assets/icons/trash.png',color: primaryColor,)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: sizeH5,),
                          Text(item.value.amorpmtime,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                          SizedBox(height: sizeH5,),
                          Text(item.value.addrestext,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                          SizedBox(height: sizeH5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width / 3.5,
                                child: Text('${item.value.provider['person_count']} ${'An individual'.tr}',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),)),
                              SizedBox(
                                width: Get.width / 3.5,
                                child: Text('${item.value.alltotal} ${'SAR'.tr}',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizeH20,),
                Container(height: 1,color: blackolor,width: Get.width,)
              ],
            ),
          ),
        ],
      ):Container();
    }).toList();
    return imageSliders;
  }

  List<Widget> createShops() {
    List<Widget> imageSliders = shops.asMap().entries.map<Widget>((item) {
      return Column(
        children: [
          Container(
            padding:  EdgeInsets.all(sizeW10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.value['providername'],style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                SizedBox(height: sizeH20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: createProducts(item.value['provider_id']),
                ),
              ],
            ),
          ),
        ],
      );
    }
    ).toList();
    return imageSliders;
  }

  var shopCount = 0;
  var showAddAndMins = true.obs;
  
  editMinsQuantity(int i) {
    for (var map in shopsProducts) {
      if(map.id == i){
        map.quantity =map.quantity -1;
        map.alltotal = map.total + map.choosesizetotal + map.chooseadditiontotal;
        update();
        showAddAndMins.value = true;
      }
    }
  }

  editPlusQuantity(int i) {
    for (var map in shopsProducts) {
      if(map.id == i){
        map.quantity =map.quantity +1;
        map.alltotal = map.total + map.choosesizetotal + map.chooseadditiontotal;
        update();
        showAddAndMins.value = true;
      }
    }
  }

  editMinsQuantityEvent(int i) {
    for (var map in eventsProducts) {
      if(map.id == i){
        map.quantity =map.quantity -1;
        map.alltotal = map.total + map.choosesizetotal + map.chooseadditiontotal;
        update();
        showAddAndMins.value = true;
      }
    }
  }

  editPlusQuantityEvent(int i) {
    for (var map in eventsProducts) {
      if(map.id == i){
        map.quantity =map.quantity +1;
        map.alltotal = map.total + map.choosesizetotal + map.chooseadditiontotal;
        update();
        showAddAndMins.value = true;
      }
    }
  }
  List<Widget> createProducts(providerId) {
    shopCount = 0;
    List<Widget> imageSliders = shopsProducts.asMap().entries.map<Widget>((item) {
      if(item.value.providerId ==  providerId){
        shopCount = shopCount + 1;
      }
      return item.value.providerId ==  providerId? Column(
        children: [
          Row(
            children: [
              FadeInDown(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: greyOpacityColor.withOpacity(.3),
                        offset: const Offset(0, 0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Image.network(item.value.productimageurl,width: sizeW100,height: sizeW100,),
                  ),
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
                          width: Get.width / 3,
                          child: Text(item.value.productname,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),)),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                
                                await Get.to(()=>ProductEditView(
                                  product : item.value,
                                  date: item.value.date,
                                  time: item.value.time,
                                  products: const [],
                                  sectionsData : item.value.provider['section'],
                                ),
                                arguments: [
                                  item.value.product['sizes'],
                                  item.value.product['additions'],
                                  item.value.productid,
                                  item.value.providerId,
                                  item.value.provider['type'],
                                  int.parse(item.value.provider['delivery'].toString()),
                                  item.value.quantity,
                                  item.value.productsizeid,
                                  item.value.productadditionid,
                                  item.value.choosesizeprice,
                                  item.value.chooseadditionprice,
                                ]);
                                shops.clear();
                                shopsProducts.clear();
                                getBaskets();
                              },
                              child: Image.asset('assets/icons/edit-2.png',color: primaryColor,)),
                            SizedBox(width: sizeW15,),
                            GestureDetector(
                              onTap: (){
                                shopsProducts.removeWhere((e) => e.id == item.value.id);
                                deleteItem(item.value.id);
                              },
                              child: Image.asset('assets/icons/trash.png',color: primaryColor,)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: sizeH5,),
                    item.value.sizename != ''? Text('${'size'.tr} : ${item.value.sizename}',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),):Container(),
                    SizedBox(height: item.value.sizename != ''?sizeH5:0,),
                    Text('${'for every'.tr} 1 : ${item.value.price + item.value.choosesizeprice + item.value.chooseadditionprice} ${'SAR'.tr}',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                    SizedBox(height: sizeH10,),
                    Visibility(
                      visible: showAddAndMins.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  var count =item.value.quantity;
                                  if(int.parse(count.toString())< 99){
                                    showAddAndMins.value = false;
                                    getEditBasketCount(item.value.id,'plus');
                                  }
                                },
                                child: Container(
                                  height: sizeW25,
                                  width: sizeW25,
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
                                margin:  EdgeInsets.only(right: sizeW10,left: sizeW10),
                                child:   Center(
                                  child: Text(item.value.quantity.toString(),style: TextStyle(fontSize: sizeW18,fontWeight: FontWeight.w500,color: primaryColor)),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  showAddAndMins.value = false;
                                  var count =item.value.quantity;
                                  
                                  if(int.parse(count.toString())> 1){
                                    showAddAndMins.value = false;
                                    getEditBasketCount(item.value.id,'min');
                                  }
                                },
                                child: Container(
                                  height: sizeW25,
                                  width: sizeW25,
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
                          SizedBox(
                            width: Get.width / 3.5,
                            child: Wrap(
                              alignment : WrapAlignment.end,
                              children: [
                                Text('${item.value.quantity * (item.value.price + item.value.choosesizeprice + item.value.chooseadditionprice)} ${'SAR'.tr}',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                              ],
                            )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: sizeH20,),
          Container(height: 1,color: (shopCount - shopsProducts.where((c) => c.providerId == providerId).length) != 0? greyOpacityColor:blackolor,width: Get.width,),
          SizedBox(height: (shopCount - shopsProducts.where((c) => c.providerId == providerId).length) != 0? sizeH20:0,),
        ],
      ):Container();
    }).toList();
    return imageSliders;
  }

  List<Widget> createEvents() {
    List<Widget> imageSliders = events.asMap().entries.map<Widget>((item) {
      return Column(
        children: [
          Container(
            padding:  EdgeInsets.all(sizeW10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.value.providername,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                SizedBox(height: sizeH20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: createEventProducts(item.value.providerId),
                ),
              ],
            ),
          ),
        ],
      );
    }
    ).toList();
    return imageSliders;
  }

  
  var eventCount = 0;
  List<Widget> createEventProducts(providerId) {
    eventCount = 0;
    List<Widget> imageSliders = eventsProducts.asMap().entries.map<Widget>((item) {
      if(item.value.providerId ==  providerId){
        eventCount = eventCount + 1;
      }
      return item.value.providerId ==  providerId? Column(
        children: [
          Row(
            children: [
              FadeInDown(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: greyOpacityColor.withOpacity(.3),
                        offset: const Offset(0, 0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Image.network(item.value.productimageurl,width: sizeW100,height: sizeW100,),
                  ),
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
                          width: Get.width / 3,
                          child: Text(item.value.productname,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),)),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                await Get.to(()=>ProductEditView(
                                  product : item.value,
                                  date: item.value.date,
                                  time: item.value.time,
                                  products: const [],
                                  sectionsData : item.value.provider['section'],
                                ),
                                arguments: [
                                  item.value.product['sizes'],
                                  item.value.product['additions'],
                                  item.value.productid,
                                  item.value.providerId,
                                  item.value.provider['type'],
                                  0,
                                  item.value.quantity,
                                  item.value.productsizeid,
                                  item.value.productadditionid,
                                  item.value.choosesizeprice,
                                  item.value.chooseadditionprice,
                                ]);
                                events.clear();
                                eventsProducts.clear();
                                getBaskets();
                              },
                              child: Image.asset('assets/icons/edit-2.png',color: primaryColor,)),
                            SizedBox(width: sizeW15,),
                            GestureDetector(
                              onTap: (){
                                eventsProducts.removeWhere((e) => e.id == item.value.id);
                                deleteItem(item.value.id);
                              },
                              child: Image.asset('assets/icons/trash.png',color: primaryColor,)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: sizeH5,),
                    item.value.sizename != ''? Text('${'size'.tr} : ${item.value.sizename}',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),):Container(),
                    SizedBox(height: item.value.sizename != ''?sizeH5:0,),
                    Text('${'for every'.tr} 1 : ${item.value.price + item.value.choosesizeprice + item.value.chooseadditionprice} ${'SAR'.tr}',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                    SizedBox(height: sizeH10,),
                    Visibility(
                      visible: showAddAndMins.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  var count =item.value.quantity;
                                  if(int.parse(count.toString())< 99){
                                    showAddAndMins.value = false;
                                    getEditBasketCountEvent(item.value.id,'plus');
                                  }
                                },
                                child: Container(
                                  height: sizeW25,
                                  width: sizeW25,
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
                                margin:  EdgeInsets.only(right: sizeW10,left: sizeW10),
                                child:   Center(
                                  child: Text(item.value.quantity.toString(),style: TextStyle(fontSize: sizeW18,fontWeight: FontWeight.w500,color: primaryColor)),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  showAddAndMins.value = false;
                                  var count =item.value.quantity;
                                  
                                  if(int.parse(count.toString())> 1){
                                    showAddAndMins.value = false;
                                    getEditBasketCountEvent(item.value.id,'min');
                                  }
                                },
                                child: Container(
                                  height: sizeW25,
                                  width: sizeW25,
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
                          SizedBox(
                            width: Get.width / 3.5,
                            child: Wrap(
                              alignment : WrapAlignment.end,
                              children: [
                                Text('${item.value.quantity * (item.value.price + item.value.choosesizeprice + item.value.chooseadditionprice)} ${'SAR'.tr}',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                              ],
                            )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: sizeH20,),
          Container(height: 1,color: (eventCount - eventsProducts.where((c) => c.providerId == providerId).length) != 0? greyOpacityColor:blackolor,width: Get.width,),
          SizedBox(height: (eventCount - eventsProducts.where((c) => c.providerId == providerId).length) != 0? sizeH20:0,),
        ],
      ):Container();
    }).toList();
    return imageSliders;
  }

  List<Widget> createDetils() {
    List<Widget> imageSliders = basketsData.asMap().entries.map<Widget>((item) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width / 1.6,
                child: Text(item.value.providername,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),)),
              Text('${item.value.alltotal} ${'SAR'.tr}',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
            ],
          ),
          SizedBox(height: sizeH10,),
        ],
      );
    }
    ).toList();
    return imageSliders;
  }

  var couponText = ''.obs;
  var isCoupon = false.obs;

  checkCoupon(context) async {
    showAddAndMins.value = false;
    var data = {
      'coupon' : couponText.value,
      'total' : allTotal.value,
      'delivery_total' : 1,
    };
    Request request = Request(url: urlCheckCoupns, body: data);
    request.postAuth().then((value) async {
      if (value['status']) {
        salePrice.value= double.parse(value['sale_price'].toString());
        sale.value= int.parse(value['sale']);
        couponId.value= value['promo_id'].toString();
        // allTotal.value = double.parse(value['total'].toString());
        isCoupon.value = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(value['msg'])));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(value['msg'])));
        isCoupon.value = false;
      }
      showAddAndMins.value = true;
    }).catchError((onError) {
      print(onError);
    });
  }

  void deleteItem(id) async {
    var data = {
      'item_id' : id,
    };
    Request request = Request(url: urlDeletItem, body: data);
    request.postAuth().then((value) async {
      if (value['status']) {
        getBaskets();
      } 
    }).catchError((onError) {
    });
  }

  void deleteAll() async {
    Request request = Request(url: urlDeleteAll, body: null);
    request.postAuth().then((value) async {
      if (value['status']) {
        shops.clear();
        shopsProducts.clear();
        photos.clear();
        photosPackages.clear();
        events.clear();
        eventsProducts.clear();
        salons.clear();
        salonsServices.clear();
        cart.value = false;
        getBaskets();
      } 
    }).catchError((onError) {
    });
  }

  @override
  void onInit() {
    // getBaskets();
    notes = TextEditingController();
    coupon = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    notes.dispose();
    coupon.dispose();
    super.onClose();
  }

  void getEditBasketCount(id,type) async {
    var data  = {
      'item_id' : id,
      'type_count' :type,
    };
    Request request = Request(url: editBasketCount, body: data);
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
        if(type == 'min'){
          editMinsQuantity(id);
        }

        if(type == 'plus'){
          editPlusQuantity(id);
        }
        getBaskets();
        
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

  void getEditBasketCountEvent(id,type) async {
    var data  = {
      'item_id' : id,
      'type_count' :type,
    };
    Request request = Request(url: editBasketCount, body: data);
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
        if(type == 'min'){
          editMinsQuantityEvent(id);
        }

        if(type == 'plus'){
          editPlusQuantityEvent(id);
        }
        getBaskets();
        
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
}
