import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:shlat/constance.dart';
import 'controllers/choose_service_controller.dart';
import 'controllers/service_location.dart';

class ChooseServiceView extends StatelessWidget {
  ChooseServiceView({Key? key}) : super(key: key);
  final ChooseServiceController controller = Get.put(ChooseServiceController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        controller.getSectionsList();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: whitecolor,
          elevation: 0,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
          ),
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.white,
          padding: EdgeInsets.all(sizeW15),
          child: Obx(() => ListView(
            children: [
              Image.asset('assets/logo.png',width: Get.width / 3.5,height: Get.height/8,fit: BoxFit.fitHeight,),
              SizedBox(height: sizeH10,),
              Image.asset('assets/shlattext.png',width: Get.width / 4.6,color: blackolor,height: sizeH20,),
              SizedBox(height: sizeH50,),
              Text('Please choose the service you provide'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: blackolor)),
              SizedBox(height: sizeH15,),
              controller.isSections.value? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: controller.sectionsData.isNotEmpty? controller.createSections():[
                  Container()
                ],
              ):Container(),
              
              SizedBox(height: sizeH15,),
              MaterialButton(
                elevation: 0,
                color: primaryColor,
                minWidth: Get.width / 1.1,
                height: sizeH50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(sizeW15),
                ),
                onPressed: (){
                  if(controller.section.value > 0){
                    PageRouteTransition.effect = TransitionEffect.topToBottom;
                    PageRouteTransition.push(context,   ServiceLoctionView(section : controller.section.value,sectionData:controller.sectionData));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Choose the service'.tr)),
                    );
                  }
                },
                child: Text(
                  'continuation'.tr,
                  style:  TextStyle(
                    fontSize: sizeW16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: sizeH15,),
            ],
          ),)
        ),
      ),
    );
  }
}
