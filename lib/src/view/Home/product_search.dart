// ignore_for_file: must_be_immutable, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:shlat/utility/General.dart';
import '../../../constance.dart';
import '../Restaurants/controller/product_controller.dart';
import '../user/edit_location_map.dart';
class ProductSearchView extends StatelessWidget {
  ProductSearchView({Key? key,this.product,this.date,this.time, this.products,this.sectionsData}) : super(key: key);
  final ProductController controller = Get.put(ProductController());
  var product;
  var date,time;
  var products,sectionsData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: primaryColor,),
      ),
      bottomNavigationBar: FadeInUp(
        child: GestureDetector(
          onTap: (){
            if(controller.sizeId.value == 0 && controller.sizes.isNotEmpty){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Choose size'.tr)),
              );
            }else{
              controller.getAddBasket(product.price,date,time);
            }
          },
          child: Container(
            width: Get.width / 1.5,
            height: sizeH50,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeW15),
              color: primaryColor,
            ),
            child: Center(
              child: Text(
                'add basket'.tr,
                style:  TextStyle(
                  fontSize: sizeW16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Obx(() => ListView(
          children:  [
            FadeInDown(
              child: SizedBox(
                height: Get.height / 3.3,
                child: Stack(
                  children: [
                    Container(
                      height: Get.height / 4,
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
                                image: NetworkImage(product.image,),
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
            SizedBox(height: sizeH15,),
            Container(
              padding:  EdgeInsets.only(bottom: sizeH20,right: sizeW15,left: sizeW15),
              margin:  EdgeInsets.only(bottom: sizeH10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: primaryColor)),
                  SizedBox(height: sizeH10,),
                  Text(product.desc,
                  style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: grey3,height: 1.5)),
                  SizedBox(height: sizeH20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                if(controller.count.value< 999){
                                  controller.count.value = controller.count.value + 1;
                                }
                              },
                              child: Container(
                                height: sizeW30,
                                width: sizeW30,
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
                              margin:  EdgeInsets.only(right: sizeW15,left: sizeW15),
                              child:  Center(
                                child: Text(controller.count.value.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Color(0xFF36388E))),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                if(controller.count.value >1){
                                  controller.count.value = controller.count.value - 1;
                                }
                              },
                              child: Container(
                                height: sizeW30,
                                width: sizeW30,
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
                      ),
                      SizedBox(
                        width: Get.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('${product.price} ${'SAR'.tr}',style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: primaryColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            controller.sizes.isNotEmpty? Container(
              margin:  EdgeInsets.only(right: sizeW10,left: sizeW10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Choose size'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: primaryColor)),
                  SizedBox(height: sizeH15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.sizes.isNotEmpty? controller.createSizes():[
                      Container()
                    ],
                  ),
                  SizedBox(height: sizeH20,),
                ],
              ),
            ):Container(),
            
            Container(
              margin:  EdgeInsets.only(right: sizeW10,left: sizeW10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.additions.isNotEmpty?Text('addtions'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: primaryColor)):Container(),
                  SizedBox(height: sizeH15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.additions.isNotEmpty? controller.createAdds():[
                      Container()
                    ],
                  ),
                ],
              ),
            ),
            sectionsData['type'] == 'events'? Container(
              margin:  EdgeInsets.only(right: sizeW10,left: sizeW10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add note'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: primaryColor)),
                  SizedBox(height: sizeH15,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType : TextInputType.name,
                    maxLines: 4,
                    controller: controller.note,
                    decoration:   InputDecoration(
                      hintText: 'You can add your notes here'.tr,
                      contentPadding: EdgeInsets.only(
                        top: sizeW15,
                        bottom: sizeW15,
                        right: sizeW15,
                        left: sizeW15,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: BorderSide(
                          color: blackolor.withOpacity(.2),
                          width: 0.8,
                        ),
                      ),
                      hintStyle:   TextStyle(
                        fontSize: sizeW16,
                        color: grey3,
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: BorderSide(
                          color: blackolor.withOpacity(.2),
                          width: 0.8,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                        borderSide: BorderSide(
                          color: blackolor.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                    ),
                    style:   TextStyle(
                      fontSize: sizeW16,
                      color: blackolor,
                      fontWeight: FontWeight.w300,
                    ),
                    validator: (value) {
                      // if (value == null || value.isEmpty) {
                      //   return 'Please enter Delivering adress';
                      // }
                      return null;
                    },
                  ),
                  SizedBox(height: sizeH20,),
                ],
              ),
            ):Container(),
            SizedBox(height: sizeH30,)
          ],
        ),)
      ),
    );
  }

  
}
