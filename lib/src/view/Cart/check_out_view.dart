// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import '../../../constance.dart';
import '../Settings/thank_view.dart';
import 'controller/checkout_controller.dart';

class CheckOutView extends StatelessWidget {
  CheckOutView({Key? key,required this.imageSliders}) : super(key: key);

  List<Widget> imageSliders;
   final CheckOutController controller = Get.put(CheckOutController());
  LatLng startLocation = const LatLng(21.389082, 39.857910); 
  var textController = TextEditingController();
  double? lat,long;
  List predictions = [];
  late GoogleMapController mapController;
  MapPickerController mapPickerController = MapPickerController();
  CameraPosition cameraPosition =  const CameraPosition(
    target: LatLng(21.389082, 39.857910),
    zoom: 14.4746,
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: Obx(() => ListView(
          children:  [
            FadeInDown(
              child: Container(
                color: primaryColor,
                padding: EdgeInsets.only(right: sizeW10,left: sizeW10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text('Payment method'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                    SizedBox(height: sizeH20,),
                  ],
                ),
              )
            ),
            FadeInRight(
              child: Container(
                margin: EdgeInsets.all(sizeW10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sizeH10,),
                    Text('Payment method'.tr,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                    SizedBox(height: sizeH20,),
                    GestureDetector(
                      onTap: (){
                        controller.paymethod.value = 1;
                      },
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW15),
                          border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: 1.4)
                        ),
                        padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
                        child: Row(
                          children: [
                            Container(
                              width: sizeW20,
                              height: sizeW20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(sizeW45),
                                border: Border.all(color: primaryColor),
                                color: controller.paymethod.value == 1?primaryColor:whitecolor,
                              ),
                            ),
                            SizedBox(width: sizeW10,),
                            FadeInDown(child:Image.asset('assets/icons/card.png',fit: BoxFit.fill,),),
                            SizedBox(width: sizeW10,),
                            Text('visa'.tr,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH15,),
                    GestureDetector(
                      onTap: (){
                        controller.paymethod.value = 2;
                      },
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sizeW15),
                          border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: 1.4)
                        ),
                        padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
                        child: Row(
                          children: [
                            Container(
                              width: sizeW20,
                              height: sizeW20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(sizeW45),
                                border: Border.all(color: primaryColor),
                                color: controller.paymethod.value == 2?primaryColor:whitecolor,
                              ),
                            ),
                            SizedBox(width: sizeW10,),
                            FadeInDown(child:Image.asset('assets/icons/Isolation_Mode.png',fit: BoxFit.fill,),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeH15,),
                    // Container(
                    //   width: Get.width,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(sizeW15),
                    //     border: Border.all(color: greyOpacityColor.withOpacity(0.3),width: 1.4)
                    //   ),
                    //   padding: EdgeInsets.only(top: sizeH10,bottom: sizeH10,right: sizeW15,left: sizeW15),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: sizeW20,
                    //         height: sizeW20,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(sizeW45),
                    //           border: Border.all(color: primaryColor)
                    //         ),
                    //       ),
                    //       SizedBox(width: sizeW10,),
                    //       FadeInDown(child:Image.asset('assets/icons/Isolation_Mode-2.png',fit: BoxFit.fill,),),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: sizeH20,),
                    // Container(height: 1,color: greyOpacityColor,width: Get.width,),
                    // SizedBox(height: sizeH20,),
                    // Text('سنوصل الطلب الى',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                    // SizedBox(height: sizeH20,),
                    // Container(
                    //   margin:  EdgeInsets.only(right: sizeW5,left: sizeW5),
                    //   decoration:  BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(sizeW15),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: const Color.fromARGB(31, 153, 152, 152).withOpacity(0.2),
                    //         blurRadius: 5,
                    //         offset: const Offset(0, 0), // Shadow position
                    //       ),
                    //     ],
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //         height: Get.height /4.8,
                    //         width: Get.width,
                    //         decoration:   BoxDecoration(
                    //           borderRadius:  BorderRadius.only(
                    //             topLeft: Radius.circular(sizeW15),
                    //             topRight: Radius.circular(sizeW15),
                    //           ),
                    //         ),
                    //         child: ClipRRect(
                    //           borderRadius:  BorderRadius.only(
                    //             topLeft: Radius.circular(sizeW15),
                    //             topRight: Radius.circular(sizeW15),
                    //           ),
                    //           child: MapPicker(
                    //             iconWidget: Image.asset(
                    //               "assets/icons/marker.png",
                    //             ),
                    //             mapPickerController: mapPickerController,
                    //             child: GoogleMap(
                    //               myLocationEnabled: false,
                    //               zoomControlsEnabled: false,
                    //               myLocationButtonEnabled: false,
                    //               mapType: MapType.normal,
                    //               rotateGesturesEnabled : false,
                    //               initialCameraPosition: CameraPosition( //innital position in map
                    //                 target: startLocation, //initial position
                    //                 zoom: 14.0, //initial zoom level
                    //               ),
                                  
                    //               onCameraMoveStarted: () {
                    //                 mapPickerController.mapMoving!();
                    //                 textController.text = "checking ...";
                    //               },
                    //               onCameraMove: (cameraPosition) {
                    //                 this.cameraPosition = cameraPosition;
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.all(sizeW10),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 Row(
                    //                   children: [
                    //                     FadeInDown(child:Image.asset('assets/icons/location-tick.png',width: sizeW25,height: sizeW25,fit: BoxFit.fill,color: primaryColor),),
                    //                     SizedBox(width: sizeW10,),
                    //                     Text('المملكة العربية السعودية',style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                    //                   ],
                    //                 ),
                    //                 Text('تغيير',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w400),),
                    //               ],
                    //             ),
                    //             SizedBox(height: sizeH10,),
                    //             Row(
                    //               children: [
                    //                 SizedBox(width: sizeW35,),
                    //                 Text('اسم الشارع - رقم العقار - رقم الطابق',style: TextStyle(color: const Color(0xFF797C7E),fontSize: sizeW16,fontWeight: FontWeight.w400),),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: sizeH20,),
                    Container(height: 1,color: greyOpacityColor,width: Get.width,),
                    SizedBox(height: sizeH20,),
                    Text('Subtotal'.tr,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                    SizedBox(height: sizeH20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: imageSliders,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'.tr,style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                        Text('${(controller.deliveryTotal.value + controller.allTotal.value)} ${'SAR'.tr}',style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),),
                      ],
                    ),
                    SizedBox(height: sizeH20,),
                    controller.salePrice.value > 0?Row(
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
                    SizedBox(height: controller.salePrice.value > 0?sizeH20:0,),
  
                    MaterialButton(
                      elevation: 0,
                      color: primaryColor,
                      minWidth: Get.width / 1.1,
                      height: sizeH50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(sizeW15),
                      ),
                      onPressed: (){
                        Get.to(()=>const ThankView());
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
            ),

            
          ],
        ),)
      ),
    );
  }
}
