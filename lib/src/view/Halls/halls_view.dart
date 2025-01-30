
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import '../../../constance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../controller/lang_controller.dart';
import '../Home/controllers/providers_controller.dart';
class HallsView extends StatelessWidget {
  HallsView({Key? key,required this.sections,this.sectionData}) : super(key: key);
  final ProvidersController controller = Get.put(ProvidersController());
  final LangController langController = Get.put(LangController());
  var sections = [];
  var sectionData;
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
                            Text('Home'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),
                            SizedBox(width: sizeW5,),
                            Icon(Icons.arrow_forward_ios,color: whitecolor.withOpacity(.8),size: sizeW20,),
                            SizedBox(width: sizeW5,),
                            Obx(() => Text(controller.sectionName.value,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w400,color: whitecolor)),),
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
                                  
                                  topLeft:  Radius.circular(langController.appLocale == 'ar'?sizeW15:0),
                                  bottomLeft: Radius.circular(langController.appLocale == 'ar'?sizeW15:0),
                                  topRight:  Radius.circular(langController.appLocale == 'en'?sizeW15:0),
                                  bottomRight: Radius.circular(langController.appLocale == 'en'?sizeW15:0),
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
            Padding(
              padding:  EdgeInsets.all(sizeW10),
              child: Text('Other sections'.tr,style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w700,color: primaryColor)),
            ),
            Obx(() => controller.sectionsShow.value? Padding(
              padding:  EdgeInsets.all(sizeW10),
              child: SizedBox(
                height: Get.height / 6.7,
                child: ListView.builder(
                  itemCount: sections.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return sections[index].id != controller.sectionId.value? GestureDetector(
                      onTap: (){
                        controller.sectionsShow.value = false;
                        controller.sectionId.value = sections[index].id;
                        controller.sectionName.value = sections[index].title;
                        controller.sectionId.value = sections[index].id;
                        controller.sectionsData = sections[index];
                        controller.getProvidersList();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: sizeW10),
                        height : Get.height / 6.7,
                        width: Get.width / 3,
                        child: Stack(
                          children: [
                            Container(
                              height : Get.height / 6.7,
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(sizeW15),
                                image: DecorationImage(
                                  image: NetworkImage(sections[index].icon,),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(sizeW15),
                                    bottomRight: Radius.circular(sizeW15),
                                  ),
                                  color: blackolor.withOpacity(.4),
                                ),
                                height : (Get.height / 6.7) / 5,
                                width: Get.width,
                                child: Center(
                                  child: Text(
                                    sections[index].title,
                                    style:  TextStyle(
                                      fontSize: sizeW12,
                                      color: whitecolor,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ):Container();
                  },
                ),
              ),
            ):Container(),),
            SizedBox(height: sizeH20,),
          ],
        ),
      ),
    );
  }
}
