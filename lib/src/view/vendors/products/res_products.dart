
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../constance.dart';
import '../adds/controllers/get_categories_controller.dart';
import 'add_product.dart';

class ResProductsView extends StatelessWidget {
  ResProductsView({Key? key,this.providerData}) : super(key: key);
  var providerData;
  final GetCategoriesController controller = Get.put(GetCategoriesController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        controller.getProviderData();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: Container(),
          leadingWidth: 0,
          title: Text('products'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: whitecolor)),
        ),
        body: Container(
          margin: EdgeInsets.all(sizeW15),
          child: ListView(
            children:  [
              SizedBox(height: sizeH15,),
              Obx(() => controller.isProducts.value? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: controller.productsData.isNotEmpty? controller.createProducts(providerData):[
                  Container()
                ],
              ):Container(),),
    
              SizedBox(height: sizeH25,),
              MaterialButton(
                elevation: 0,
                color: primaryColor,
                minWidth: Get.width / 1.1,
                height: sizeH50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(sizeW15),
                ),
                onPressed: ()async{
                 await Get.to(()=>AddResProduct(providerData : providerData),arguments: [providerData]);
                 controller.getProviderData();
                },
                child: Text(
                  'add product'.tr,
                  style:  TextStyle(
                    fontSize: sizeW16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              
             
            ],
          ),
        ),
      ),
    );
  }
}
