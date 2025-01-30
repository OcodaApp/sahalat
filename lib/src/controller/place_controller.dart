// ignore_for_file: avoid_print, empty_catches

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../../constance.dart';
import '../../http/request.dart';
import '../../http/url.dart';
import '../../utility/General.dart';
import 'lang_controller.dart';
import 'map_search_controller.dart';

class PlaceController extends GetxController {
  final LangController _langController = Get.put(LangController());
  final SeaConController searchController = Get.put(SeaConController());
  var googlePlace = GooglePlace("AIzaSyBRZxRd7JxXRaH7ltcC0xwhZi7855hl8YE");
  var lat = 24.647017.obs;
  var long = 46.710092.obs;
  var addressText = ''.obs;
  late DetailsResult detailsResult;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }


  List predictions = [].obs;
  var isSearch = false.obs;

  page1(BuildContext modalSheetContext) {
    isSearch.value = false;
    predictions.clear();
    return WoltModalSheetPage(
      navBarHeight : 1,
      topBar : Container(color: primaryColor.withOpacity(.1),),
      hasSabGradient: false,
      stickyActionBar: Container(
        padding: EdgeInsets.only(top: sizeH15,bottom: sizeH15),
        margin: EdgeInsets.only(right: sizeW15,left: sizeW15),
        decoration :  const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: grey3,
              width: 0.5,
            ),
          ),
        ),
        child:  Row(
          children: [
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Text(
                'Close'.tr,
                style:  TextStyle(
                  fontSize: sizeW16,
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  
                ),
              ),
            ),
          ],
        ),
      ),
      // topBarTitle: const Text('Pagination'),
      isTopBarLayerAlwaysVisible: false,
      child: SizedBox(
        height: Get.height / 2,
        child:  ListView(
          children:  [
            Container(
              padding:  EdgeInsets.only(top: sizeH40,right: sizeW15,left: sizeW15,bottom: sizeH20),
              color: primaryColor.withOpacity(.1),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    TextField(
                    autofocus: true,
                    enabled: true,
                    cursorColor : primaryColor,
                    onChanged: (word) async {
                      isSearch.value = false;
                      searchController.chacngeData(word).then((value) {
                        predictions = value;
                        isSearch.value = true;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'search'.tr,
                      contentPadding: const EdgeInsets.only(top: 0,bottom: 0,right: 0,left: 0,),
                      prefix: Padding(
                        padding:  EdgeInsets.only(right: _langController.appLocale =='ar'?0:  sizeW15,left: _langController.appLocale =='ar'?sizeW15:0),
                        child: Image.asset(
                          "assets/icons/marker.png",
                          color: primaryColor,
                          width: sizeW16,
                          height: sizeW18,
                        ),
                      ),
                      enabledBorder:  const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grey3,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder:  const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grey3,
                          width: 0.5,
                        ),
                      ),
                      border:  const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grey3,
                          width: 0.5,
                        ),
                      ),
                      hintStyle:  TextStyle(
                        fontSize: sizeW16,
                        color: primaryColor.withOpacity(0.3),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(height: sizeH10,),
                  GestureDetector(
                    onTap: (){
                      isSearch.value = false;
                      Get.back();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/marker.png",
                          color: primaryColor,
                          width: sizeW16,
                          height: sizeH18,
                        ),
                        SizedBox(width: sizeW15,),
                        Text(
                          'Choose on map'.tr,
                          style: TextStyle(fontSize: sizeW16,fontWeight: FontWeight.w500,color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sizeH25,),
            Obx(() => SizedBox(
              height: Get.height /5,
              child: !isSearch.value ?ListView(
                children: const [
                ],
              ):SizedBox(
                height: Get.height /5,
                child: ListView.builder(
                  itemCount: predictions.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async{
                        FocusManager.instance.primaryFocus!.unfocus();
                        var result = await googlePlace.details.get(
                            predictions[index]['place_id'],
                            language: _langController.appLocale,
                          );
                        if (result != null && result.result != null) {
                          detailsResult = result.result!;
                          lat.value = detailsResult.geometry!.viewport!.southwest!.lat!;
                          long.value = detailsResult.geometry!.viewport!.southwest!.lng!;
                          General().setlongitude(long.value);
                          General().setlatitude(lat.value);
                          General().getlatitude();
                          General().getlongitude();
                          General().getUserData().then((val){
                            Get.back();
                          });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: sizeW15, right: sizeW15,bottom: sizeH10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: sizeW15,
                              child: Image.asset(
                                "assets/icons/marker.png",
                                color: primaryColor,
                                width: sizeW16,
                                height: sizeH18,
                              ),
                            ),
                            
                            SizedBox(
                              width: sizeW5,
                            ),
                            Expanded(
                              child: Text(
                                predictions[index]['description'],
                                style: TextStyle(
                                  color: blackolor.withOpacity(0.6),
                                  fontSize: sizeW14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),),
            SizedBox(height: sizeH100,),
          ],
        ),
      ),
    );
  }

  void editUserData(lat,long,street) async {
    var data = {
      'latitude': lat,
      'longitude': long,
      'address_text': street,
    };
    Request request = Request(url: urlUserUpdate, body: data);
    request.postAuth().then((value) {
      
    }).catchError((onError) {
    });
  }
}
