
// ignore_for_file: must_be_immutable
import 'package:get/get.dart';
import '../../../constance.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../controller/lang_controller.dart';
import 'check_out_view.dart';
import 'controller/cart_controller.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  final CartController controller = Get.put(CartController());
  final LangController langController = Get.put(LangController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.cart.value = false;
          controller.shops.clear();
          controller.shopsProducts.clear();
          controller.photos.clear();
          controller.photosPackages.clear();
          controller.events.clear();
          controller.eventsProducts.clear();
          controller.salons.clear();
          controller.salonsServices.clear();
          controller.coupon.clear();
          controller.couponText.value = '';
          controller.salePrice.value = 0.0;
          controller.sale.value = 0;
          controller.couponId.value = '0';
          controller.isCoupon.value = false;
          controller.getBaskets();
        },
        child: Obx(() => ListView(
          children:  [
            FadeInDown(
              child: Container(
                color: primaryColor,
                padding: EdgeInsets.only(right: sizeW10,left: sizeW10),
                child: Column(
                  children: [
                    SizedBox(height: sizeH15,),
                    Row(
                      children: [
                        Text('Home'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                        SizedBox(width: sizeW5,),
                        Icon(Icons.arrow_forward_ios,color: whitecolor.withOpacity(.8),size: sizeW20,),
                        SizedBox(width: sizeW5,),
                        Text('basket'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                      ],
                    ),
                    SizedBox(height: sizeH15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width /1.2,
                          child: Text('Learn and manage your chosen services and products'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor))),
                         Visibility(
                          visible: controller.cart.value,
                          child: GestureDetector(
                            onTap: (){
                              Get.dialog(
                                Scaffold(
                                  backgroundColor: greycolor.withOpacity(0.1),
                                  body: Center(
                                    child: Container(
                                      height: Get.height / 3,
                                      margin: EdgeInsets.all(sizeW20),
                                      padding: EdgeInsets.all(sizeW20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(sizeW15),
                                        color: whitecolor
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('Delete cart'.tr,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                                          SizedBox(height: sizeH30,),
                                          SizedBox(
                                            width: Get.width / 1.5,
                                            child: Text('Are you sure you want to delete all basket items?'.tr,
                                              style: TextStyle(color: const Color(0xFF797C7E),fontSize: sizeW16,fontWeight: FontWeight.w400)
                                              ,textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(height: sizeH20,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              MaterialButton(
                                                elevation: 0,
                                                color: primaryColor,
                                                minWidth: Get.width / 2.7,
                                                height: sizeH40,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(sizeW15),
                                                ),
                                                onPressed: (){
                                                  // controller.cart.value = false;
                                                  controller.deleteAll();
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'delete'.tr,
                                                  style:  TextStyle(
                                                    fontSize: sizeW16,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              MaterialButton(
                                                elevation: 0,
                                                color: whitecolor,
                                                minWidth: Get.width / 2.7,
                                                height: sizeH40,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(sizeW15),
                                                  side: const BorderSide(color: primaryColor)
                                                ),
                                                
                                                onPressed: (){
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'cancel'.tr,
                                                  style:  TextStyle(
                                                    fontSize: sizeW16,
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                barrierDismissible: false,
                              );
                            },
                            child: Image.asset('assets/icons/trash.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: sizeH20,),
                  ],
                ),
              )
            ),
             Visibility(
              visible: !controller.cart.value,
              child: SizedBox(
                height: Get.height / 1.3,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Your basket is empty'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                    SizedBox(height: sizeH10,),
                    Text('Explore services and products to add items'.tr,
                      style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400)
                      ,textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            Visibility(
              visible: controller.cart.value,
              child: Column(
                children: [
                  // hall
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.createHalls(),
                  ),
                  // res
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.createShops(),
                  ),
                  // photo
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.createPhotos(),
                  ),
                  // events
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.createEvents(),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.createSalons(),
                  ),
                  
                  Container(
                    padding:  EdgeInsets.all(sizeW10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Subtotal'.tr,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                        SizedBox(height: sizeH20,),
                        Visibility(
                          visible: controller.showAddAndMins.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: controller.createDetils(),
                          ),
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('shipping fees'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                            Text('${controller.deliveryTotal.value}',style: TextStyle(color: Colors.red,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: sizeH20,),
                       
                        Container(height: 1,color: greyOpacityColor,width: Get.width,),
                        SizedBox(height: sizeH20,),
                        Visibility(
                          visible: controller.showAddAndMins.value,
                          child: FadeInRight(
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType : TextInputType.text,
                              onChanged: (value){
                                controller.couponText.value = value;
                              },
                              decoration:  InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  right: sizeW15,
                                  left: sizeW15,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    FocusScope.of(context).unfocus();
                                    if(controller.couponText.value != ''){
                                      controller.checkCoupon(context);
                                    }
                                  },
                                  child: !controller.isCoupon.value?Container(
                                    width: sizeW75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft:  Radius.circular(langController.appLocale == 'ar'?sizeW15:0),
                                        bottomLeft: Radius.circular(langController.appLocale == 'ar'?sizeW15:0),
                                        topRight:  Radius.circular(langController.appLocale == 'en'?sizeW15:0),
                                        bottomRight: Radius.circular(langController.appLocale == 'en'?sizeW15:0),
                                      ),
                                      color:  primaryColor,
                                    ),
                                    child: Center(
                                      child: Text('application'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                                    ),
                                  ):SizedBox(
                                    width: Get.width / 2.5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: Get.width / 3.5,
                                          margin:  EdgeInsets.all(sizeW5),
                                          padding:  EdgeInsets.only(right: sizeW15,left: sizeW15,bottom: sizeH5,top: sizeH5),
                                          decoration: BoxDecoration(
                                            color:   primaryTowColor.withOpacity(.2),
                                            borderRadius: BorderRadius.circular(sizeW45),
                                          ),
                                          child:  Row(
                                            children: [
                                              Container(
                                                width: sizeW20,
                                                height: sizeW20,
                                                decoration: BoxDecoration(
                                                  color:   primaryTowColor,
                                                  borderRadius: BorderRadius.circular(sizeW45),
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.add_task_outlined,size: sizeW12,color: whitecolor,),
                                                ),
                                              ),
                                              SizedBox(width: sizeW5,),
                                              Text('Applied'.tr,style: TextStyle(fontSize: sizeW14,fontWeight: FontWeight.w400,color: primaryColor),),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            controller.coupon.clear();
                                            controller.couponText.value = '';
                                            controller.salePrice.value = 0.0;
                                            controller.sale.value = 0;
                                            controller.couponId.value = '0';
                                            controller.isCoupon.value = false;
                                            controller.getBaskets();
                                          },
                                          child: Container(
                                            width: sizeW20,
                                            height: sizeW20,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(sizeW45),
                                            ),
                                            child: Center(
                                              child: Icon(Icons.close_outlined,size: sizeW12,color: whitecolor,),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: sizeW10,)
                                      ],
                                    ),
                                  ),
                                ),
                                hintText: 'Enter promo code'.tr,
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
                        ),
                        SizedBox(height: sizeH20,),
                        Container(height: 1,color: greyOpacityColor,width: Get.width,),
                        SizedBox(height: sizeH20,),
                        Visibility(
                          visible: controller.showAddAndMins.value,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total'.tr,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                                  Text('${(controller.deliveryTotal.value + controller.allTotal.value)} ${'SAR'.tr}',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                                ],
                              ),
                              SizedBox(height: sizeH20,),
                              controller.isCoupon.value? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('after discount'.tr,style: TextStyle(color: Colors.red,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                                      SizedBox(
                                        width: Get.width /3,
                                        child: Text('( ${'You saved'.tr}  ${controller.salePrice.value} ${'SAR'.tr} )',
                                        style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w300)),
                                      ),
                                    ],
                                  ),
                                  Text('${(controller.deliveryTotal.value + controller.allTotal.value) - controller.salePrice.value} ${'SAR'.tr}',style: TextStyle(color: Colors.red,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                                ],
                              ):Container(),
                              SizedBox(height: sizeH20,),
                            ],
                          ),
                        ),
                        
      
                        MaterialButton(
                          elevation: 0,
                          color: primaryColor,
                          minWidth: Get.width / 1.1,
                          height: sizeH50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(sizeW15),
                          ),
                          onPressed: (){
                            FocusManager.instance.primaryFocus?.unfocus();
                            FocusScope.of(context).unfocus();
                            Get.to(()=>CheckOutView(
                              imageSliders : controller.createDetils()
                              ),arguments: [
                                controller.deliveryTotal.value,
                                controller.allTotal.value,
                                controller.salePrice.value
                              ]
                            );
                          },
                          child: Text(
                            'payment'.tr,
                            style:  TextStyle(
                              fontSize: sizeW16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: sizeH20,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
