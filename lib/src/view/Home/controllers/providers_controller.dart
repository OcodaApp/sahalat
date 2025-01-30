// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shlat/utility/General.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../../constance.dart';
import '../../../../http/request.dart';
import '../../../../http/url.dart';
import '../../../../model/providers_modal.dart';
import '../../Halls/hall_page.dart';

class ProvidersController extends GetxController {
  late TextEditingController searchForm= TextEditingController();
   var textSearch = ''.obs; 
  List predictions = [];
  var sectionId = 0.obs;
  var sectionName = ''.obs;
  var sectionsData;
  var sectionsShow = true.obs;

  var isProviders = false.obs;
  var providersData = [].obs;
  // sliders
  void getProvidersList() async {
    var data  = {
      'section_id' : sectionId.value,
      'user_id' : General.id,
    };
    if(textSearch.value.isNotEmpty){
      data.addAll({'word':textSearch.value});
    }
    isProviders.value = false;
    Request request = Request(url: urlProviders, body: data);
    request.post().then((value) async {
      if (value['status']) {
        ProviderListModel lists = ProviderListModel.fromJson(value);
        providersData.value = lists.data!;
        isProviders.value = true;
        sectionsShow.value = true;
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void onInit() {
    sectionId.value = Get.arguments[0];
    sectionsData = Get.arguments[1];
    sectionName.value = Get.arguments[2];
    getProvidersList();
    super.onInit();
  }

  var favs = [].obs;
  var showFavIcon = true.obs;

  void addFav(id) async {
    showFavIcon.value = false;
    var data = {
      'provider_id' : id,
    };
    Request request = Request(url: urlAddFav, body: data);
    request.postAuth().then((value) async {
      if (value['status']) {
        if(value['data'] == 1){
          favs.addAll([id]);
        }else{
          favs.remove(id);
        }
        showFavIcon.value = true;
      } 
    }).catchError((onError) {
    });
  }

  List<Widget> createProviders() {
    List<Widget> imageSliders = providersData.asMap().entries.map((item) {
      if(item.value.userFav == 1){
        favs.addAll([item.value.id]);
      }
      return Column(
        children: [
        Container(
          margin: const EdgeInsets.only(right: 5,left: 5),
          height: Get.height  /2.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sizeW20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color.fromARGB(31, 153, 152, 152).withOpacity(0.3),
                offset: const Offset(0, 0),
                blurRadius: 10.0,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (Get.height /3) / 1.5 ,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(sizeW25),
                    topRight: Radius.circular(sizeW25),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(item.value.image,),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showFavIcon.value ?GestureDetector(
                      onTap: (){
                        if(General.token.trim() != ""){
                          addFav(item.value.id);
                        }
                      },
                      child: Padding(
                        padding:EdgeInsets.all(sizeW10),
                        child: Image.asset('assets/bottom/heart.png',width: sizeW25,height: sizeH25,color: favs.contains(item.value.id) ? Colors.red:grey3,),
                      ),
                    ):Container(),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=>HallPage(providers : providersData,sectionsData: sectionsData,),arguments: [item.value.id,item.value,sectionsData]);
                  },
                  child: Container(
                    padding: EdgeInsets.all(sizeW10),
                    decoration: BoxDecoration(
                      color: whitecolor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(sizeW20),
                        bottomRight: Radius.circular(sizeW20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Get.width /2,
                              child: Text(item.value.title,
                              style: TextStyle(color: primaryColor,fontSize: sizeW16,fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,)),
                            SmoothStarRating(
                              allowHalfRating: false,
                              onRatingChanged: (v) {
                              },
                              starCount: 5,
                              rating: item.value.rateAvg,
                              size: sizeW15,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star,
                              color: primaryColor,
                              borderColor: primaryColor,
                              spacing:5.0
                            ),
                          ],
                        ),
                        SizedBox(height: sizeH10,),
                        sectionsData.type != 'halls' && sectionsData.type != 'photographers' ?Row(
                          children: [
                            FadeInDown(child:Image.asset('assets/icons/time.png',fit: BoxFit.fill,),),
                            SizedBox(width: sizeW10,),
                            Text('${item.value.fromTime} - ${item.value.toTime} ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                          ],
                        ):Container(),
                        SizedBox(height: sectionsData.type != 'halls' && sectionsData.type != 'photographers'?  sizeH10:0,),
                        sectionsData.type == 'photographers' || sectionsData.type == 'events' ? Column(
                          children: [
                            sectionsData.type == 'photographers' ? Row(
                              children: [
                                FadeInDown(child:Image.asset('assets/icons/camera.png',fit: BoxFit.fill,),),
                                SizedBox(width: sizeW10,),
                                Expanded(child: Text(item.value.categoryName,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),)),
                              ],
                            ):Container(),
                            SizedBox(height: sectionsData.type == 'photographers' ? sizeH10:0,),
                            Row(
                              children: [
                                FadeInDown(child:Image.asset('assets/icons/dollar-circle.png',fit: BoxFit.fill,),),
                                SizedBox(width: sizeW10,),
                                Text('${'price in'.tr} ${item.value.price} ${'SAR'.tr} ',style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),),
                              ],
                            ),
                            SizedBox(height: sizeH10,),
                          ],
                        ):Container(),
                        
                        sectionsData.isaddress && sectionsData.type != 'events'? Row(
                          children: [
                            FadeInDown(child:Image.asset('assets/icons/location.png',fit: BoxFit.fill,),),
                            SizedBox(width: sizeW10,),
                            Expanded(child: Text(item.value.locationText,
                            style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,)),
                          ],
                        ):Container(),
                        SizedBox(height: sectionsData.isaddress && sectionsData.type != 'events'?sizeH10:0,),
                        Row(
                          children: [
                            sectionsData.ispersoncount?FadeInDown(child:Image.asset('assets/icons/profile-2user.png',fit: BoxFit.fill,),):Container(),
                            SizedBox(width: sectionsData.ispersoncount?sizeW10:0,),
                            sectionsData.ispersoncount?Text(item.value.personCount,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),):Container(),
                            SizedBox(width: sectionsData.ispersoncount?sizeW20:0,),
                            sectionsData.isprice?FadeInDown(child:Image.asset('assets/icons/dollar-circle.png',fit: BoxFit.fill,),):Container(),
                            SizedBox(width: sectionsData.isprice?sizeW10:0,),
                            sectionsData.isprice?Text(item.value.price,style: TextStyle(color: blackolor,fontSize: sizeW14,fontWeight: FontWeight.w400),):Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: sizeH10,),
        ],
      );
    }).toList();
    return imageSliders;
  }

  @override
  void onClose() {
    searchForm.dispose();
    super.onClose();
  }
}
