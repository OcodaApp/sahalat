
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import '../../../constance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'controllers/search_providers_controller.dart';
class SearchProviders extends StatelessWidget {
  SearchProviders({Key? key}) : super(key: key);
  final SearchProvidersController controller = Get.put(SearchProvidersController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        controller.searchForm.clear();
        controller.textSearch.value = '';
        controller.getProvidersList();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: primaryColor,),
        ),
        body: ListView(
          children:  [
            FadeInDown(
              child: Container(
                color: primaryColor,
                padding: EdgeInsets.only(right: sizeW10,left: sizeW10),
                child: Column(
                  children: [
                    SizedBox(height: sizeH10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Text('Home'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor))),
                            SizedBox(width: sizeW5,),
                            Icon(Icons.arrow_forward_ios,color: whitecolor.withOpacity(.8),size: sizeW20,),
                            SizedBox(width: sizeW5,),
                            Text('search one'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor))
                          ],
                        ),
                        FadeInDown(
                          child:Image.asset('assets/icons/textalign-justifycenter.png',width: sizeW30,height: sizeH30,),
                        ),
                      ],
                    ),
                    SizedBox(height: sizeH10,),
                    FadeInRight(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType : TextInputType.text,
                        controller: controller.searchForm,
                        onFieldSubmitted: (value){
                          if (value.isNotEmpty) {
                            controller.getProvidersList();
                          }
                        },
                        onChanged: (value)async{
                          controller.textSearch.value = value;
                        },
                        decoration:  InputDecoration(
                          fillColor: whitecolor,
                          filled: true,
                          contentPadding: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            right: sizeW15,
                            left: sizeW15,
                          ),
                          prefixIcon: Image.asset('assets/icons/search.png',width: sizeW25,height: sizeH25,),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              if (controller.textSearch.value.isNotEmpty) {
                                controller.getProvidersList();
                              }
                            },
                            child: Container(
                              width: sizeW65,
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(sizeW15),
                                  bottomLeft: Radius.circular(sizeW15),
                                ),
                                color:  primaryColor,
                              ),
                              child: Center(
                                child: Text('search one'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                              ),
                            ),
                          ),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                            borderSide: const BorderSide(
                              color: whitecolor,
                              width:1.5,
                            ),
                          ),
                          hintStyle:  TextStyle(
                            fontSize: sizeW16,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.all(Radius.circular(sizeW15)),
                            borderSide: const BorderSide(
                              color: whitecolor,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(sizeW15)),
                            borderSide: const BorderSide(
                              color: whitecolor,
                              width: 1.5,
                            ),
                          ),
                        ),
                        style:  TextStyle(
                          fontSize: sizeW16,
                          color: blackolor,
                          fontWeight: FontWeight.w400,
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'required'.tr;
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    SizedBox(height: sizeH10,),
                  ],
                ),
              )
            ),
            
            Padding(
              padding:  EdgeInsets.all(sizeW10),
              child: Column(
                children: [
                  SizedBox(height: sizeH10,),
                  Obx(() => controller.isProviders.value? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.providersData.isNotEmpty? controller.createProviders():[
                      Container()
                    ],
                  ):Container(),),
                  
                ],
              ),
            ),
            SizedBox(height: sizeH20,),
          ],
        ),
      ),
    );
  }
}
