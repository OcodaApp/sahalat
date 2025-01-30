// ignore_for_file: must_be_immutable, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:page_route_transition/page_route_transition.dart';
import '../../../constance.dart';
import '../../../utility/General.dart';
import '../../controller/home_controller.dart';
import '../Restaurants/controller/package_controller.dart';
import '../Restaurants/product_view.dart';
import '../user/edit_location_map.dart';

class SectionPage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  SectionPage({Key? key,this.section,this.date,this.time,this.sectionsData}) : super(key: key);
  final PackageController controller = Get.put(PackageController());
  var section;
  var date,time;
  var sectionsData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      body: Obx(() => ListView(
        children:  [
          FadeInDown(
            child: SizedBox(
              height: Get.height / 3.3,
              child: Stack(
                children: [
                  Container(
                    height: Get.height / 4.4,
                    color: primaryColor,
                  ),
                  AppBar(
                    leading: Container(),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(controller.address.value,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                    actions: [
                      GestureDetector(
                        onTap: ()async{
                          PageRouteTransition.effect = TransitionEffect.fade;
                          await PageRouteTransition.push(context,  const EditMapSearchView());
                          controller.address.value = General.address;
                        },
                        child: Row(
                          children: [
                            Icon(Icons.expand_more,color: whitecolor,size: sizeW25,),
                            SizedBox(width: sizeW15,),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // FadeInRight(
                        //   child: Container(
                        //     margin:  EdgeInsets.only(right: sizeW15,left: sizeW15),
                        //     child: TextFormField(
                        //       autovalidateMode: AutovalidateMode.onUserInteraction,
                        //       keyboardType : TextInputType.text,
                        //       decoration:  InputDecoration(
                        //         fillColor: whitecolor,
                        //         filled: true,
                        //         contentPadding: EdgeInsets.only(
                        //           top: 5,
                        //           bottom: 5,
                        //           right: sizeW15,
                        //           left: sizeW15,
                        //         ),
                        //         prefixIcon: Image.asset('assets/icons/search.png',width: sizeW25,height: sizeH25,),
                        //         suffixIcon: Container(
                        //           width: sizeW65,
                        //           margin: const EdgeInsets.all(1),
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.only(
                        //               topLeft: Radius.circular(sizeW15),
                        //               bottomLeft: Radius.circular(sizeW15),
                        //             ),
                        //             color:  primaryColor,
                        //           ),
                        //           child: Center(
                        //             child: Text('بحث',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                        //           ),
                        //         ),
                        //         border:  OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        //           borderSide: const BorderSide(
                        //             color: whitecolor,
                        //             width:1.5,
                        //           ),
                        //         ),
                        //         hintStyle:  TextStyle(
                        //           fontSize: sizeW16,
                        //           color: primaryColor,
                        //           fontWeight: FontWeight.w400,
                        //         ),
                        //         labelStyle:   TextStyle(
                        //           fontSize: sizeW16,
                        //           color: primaryColor,
                        //           fontWeight: FontWeight.w400,
                        //         ),
                        //         enabledBorder: OutlineInputBorder(
                        //           borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                        //           borderSide: const BorderSide(
                        //             color: whitecolor,
                        //             width: 1.5,
                        //           ),
                        //         ),
                        //         focusedBorder:  OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        //           borderSide: const BorderSide(
                        //             color: whitecolor,
                        //             width: 1.5,
                        //           ),
                        //         ),
                        //       ),
                        //       style:  TextStyle(
                        //         fontSize: sizeW16,
                        //         color: blackolor,
                        //         fontWeight: FontWeight.w400,
                        //       ),
                        //       validator: (value) {
                                
                        //         return null;
                        //       },
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: sizeH15,),
                         Container(
                            height: Get.height / 4.5,
                            margin:  EdgeInsets.only(right: sizeW15,left: sizeW15),
                            decoration: BoxDecoration(
                              color: whitecolor,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color:  greyOpacityColor.withOpacity(0.4),
                                  offset: const Offset(0, 0),
                                  blurRadius: 5.0,
                                )
                              ],
                              image:  DecorationImage(
                                image: NetworkImage(section['image_url'],),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: sizeH25,),
          controller.productsData.isNotEmpty?  Container(
            margin:  EdgeInsets.only(right: sizeW15,left: sizeW15),
            height: sizeH100 *(controller.productsData.length+.9),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: sizeW15,
                mainAxisSpacing: sizeH15,
              ),
              itemCount: controller.productsData.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: (){
                    Get.to(()=>ProductView(
                      product : controller.productsData[index],
                      date: date,
                      time: time,
                      products: controller.productsData,
                      sectionsData : sectionsData,
                    ),
                    arguments: [
                      controller.productsData[index].sizes,
                      controller.productsData[index].additions,
                      controller.productsData[index].id,
                      controller.providerId.value,
                      controller.providerType.value,
                      controller.delivery.value,
                    ]);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
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
                            ),
                            child: Center(
                              child: Image.network(controller.productsData[index].image,width: Get.width / 2.8,height: Get.height / 4.8,),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2.8,height: Get.height / 4.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(sizeW10),
                                  decoration: BoxDecoration(
                                    color: whitecolor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(sizeW8),
                                      topRight: Radius.circular(sizeW8),
                                      bottomRight: Radius.circular(sizeW8),
                                    ),
                                    border: Border.all(color: primaryColor,width: 1.5),
                                  ),
                                  child: Icon(Icons.add,color: primaryColor,size: sizeW20,)),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: sizeH10,),
                      Text(controller.productsData[index].name,style: TextStyle(color: blackolor,fontSize: sizeW16,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,),
                      SizedBox(height: sizeH5,),
                      Text(controller.productsData[index].price.toString(),style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis),
                    ],
                  ),
                );
              }),
          ):Container(),
        ],
      ),)
    );
  }
}
