
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';
import '../../../../../constance.dart';
import '../controllers/get_categories_controller.dart';
import 'add_category.dart';


class CategoriesView extends StatelessWidget {
   CategoriesView({Key? key,this.providerData}) : super(key: key);
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
          title: Text(providerData['section']['categories_desc'],style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: whitecolor)),
        ),
        body: Container(
          margin: EdgeInsets.all(sizeW15),
          child: ListView(
            children:  [
              SizedBox(height: sizeH15,),
              Obx(() => controller.isSections.value? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: controller.sectionsData.isNotEmpty? controller.createSections(providerData):[
                  Container()
                ],
              ):Container(),),
    
              SizedBox(height: sizeH10,),
              MaterialButton(
                elevation: 0,
                color: primaryColor,
                minWidth: Get.width / 1.1,
                height: sizeH50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(sizeW15),
                ),
                onPressed: ()async{
                  PageRouteTransition.effect = TransitionEffect.topToBottom;
                  await PageRouteTransition.push(context,  AddCategory(providerData : providerData));
                  controller.getProviderData();
                },
                child: Text(
                  '${'add'.tr} ${providerData['section']['category_name']}',
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
