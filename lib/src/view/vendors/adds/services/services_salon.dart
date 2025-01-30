
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import '../../../../../constance.dart';
import '../controllers/get_categories_controller.dart';
import 'add_service.dart';

class ServiceSalon extends StatelessWidget {
  ServiceSalon({Key? key,this.providerData}) : super(key: key);
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
          title: Text(providerData['section']['services_name'],style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: whitecolor)),
        ),
        body: Container(
          margin: EdgeInsets.all(sizeW15),
          child: ListView(
            children:  [
              SizedBox(height: sizeH15,),
              Obx(() => controller.isSections.value? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: controller.sectionsData.isNotEmpty? controller.createServices(providerData):[
                  Container()
                ],
              ):Container(),),
              SizedBox(height: sizeH15,),
              MaterialButton(
                elevation: 0,
                color: primaryColor,
                minWidth: Get.width / 1.1,
                height: sizeH50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(sizeW15),
                ),
                onPressed: ()async{
                  await Get.to(()=>AddService(providerData : providerData),arguments: [providerData['id']]);
                  controller.getProviderData();
                },
                child: Text(
                  '${'add'.tr} ${providerData['section']['service_name']}',
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
