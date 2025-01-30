// ignore_for_file: avoid_print, must_be_immutable, no_logic_in_create_state, prefer_typing_uninitialized_variables
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:shlat/utility/General.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../../constance.dart';
import '../../controller/place_controller.dart';
import '../home_view.dart';

class MapSearchView extends StatefulWidget {
  const MapSearchView({Key? key}) : super(key: key);
  @override
  State<MapSearchView> createState() => MapSearchViewState();
}
class MapSearchViewState extends State<MapSearchView> {
  final PlaceController controller = Get.put(PlaceController());
  LatLng startLocation = const LatLng(24.647017, 46.710092); 
  var textController = TextEditingController();
  var street = TextEditingController();
  double? lat,long;
  List predictions = [];
  late GoogleMapController mapController;
  MapPickerController mapPickerController = MapPickerController();
  CameraPosition cameraPosition =  const CameraPosition(
    target: LatLng(24.647017, 46.710092),
    zoom: 12.0,
  );
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageIndexNotifier = ValueNotifier(0);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          MapPicker(
            iconWidget: Image.asset(
              "assets/icons/marker.png",
            ),
            mapPickerController: mapPickerController,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              rotateGesturesEnabled : true,
              initialCameraPosition: CameraPosition( //innital position in map
                target: startLocation, //initial position
                zoom: 12.0, //initial zoom level
              ),
              onMapCreated: (controller) { //method called when map is created
                setState(() {
                  mapController = controller; 
                });
              },
              onCameraMoveStarted: () {
                mapPickerController.mapMoving!();
                textController.text = "checking ...";
              },
              onCameraMove: (cameraPosition) async{
                this.cameraPosition = cameraPosition;
              },
              onCameraIdle: () async {
                mapPickerController.mapFinishedMoving!();
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                  // localeIdentifier:  'en',
                );
                print(placemarks.first);
                setState(() {
                  textController.text ='${placemarks.first.country} , ${placemarks.first.locality}, ${placemarks.first.subLocality}, ${placemarks.first.thoroughfare}';
                  street.text = '${placemarks.first.street}';
                  lat = cameraPosition.target.latitude;
                  long = cameraPosition.target.longitude;
                });
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 25,
            width: MediaQuery.of(context).size.width - 0,
            child: Column(
              children: [
                FadeInUp(
                  child: GestureDetector(
                    onTap: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      WoltModalSheet.show<void>(
                        pageIndexNotifier: pageIndexNotifier,
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [
                            controller.page1(modalSheetContext),
                          ];
                        },
                        modalTypeBuilder: (context) {
                          return WoltModalType.bottomSheet();
                        },
                        onModalDismissedWithBarrierTap: () {
                          debugPrint('Closed modal omar oamr');
                          Navigator.of(context).pop();
                          mapController.animateCamera( 
                            CameraUpdate.newCameraPosition(
                              CameraPosition(target: LatLng(controller.lat.value,controller.long.value), zoom: 12) 
                            )
                          );
                          pageIndexNotifier.value = 0;
                        },
                        // maxDialogWidth: 560,
                        // minDialogWidth: 400,
                        // minPageHeight: 0.0,
                        // maxPageHeight: Get.height /2,
                      ).then((value) {
                        mapController.animateCamera( 
                          CameraUpdate.newCameraPosition(
                            CameraPosition(target: LatLng(controller.lat.value,controller.long.value), zoom: 12) 
                          )
                        );
                      });
                    },
                    child: Container(
                      width: Get.width / 1.1,
                      height: sizeH50,
                      padding:  EdgeInsets.only(right: sizeW15,left: sizeW15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(sizeW15),
                        color:  Colors.white,
                        border: Border.all(color: blackolor,width: 1.3)
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/search.png',width: sizeW25,height: sizeH25,),
                          SizedBox(width: sizeW10,),
                          Text(
                            'search'.tr,
                            style:  TextStyle(
                              fontSize: sizeW16,
                              color: greyOpacityColor,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: sizeH120,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width / 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/location-tick.png',width: sizeW25,height: sizeH25,),
                        SizedBox(width: sizeW10,),
                        Expanded(
                          child: Text(
                            textController.text,
                            style:  TextStyle(
                              fontSize: sizeW16,
                              color: blackolor,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: sizeH20,),
                  MaterialButton(
                    elevation: 0,
                    color: primaryColor,
                    minWidth: Get.width / 1.1,
                    height: sizeH50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(sizeW15),
                    ),
                    onPressed: (){
                      General().setlatitude(lat!);
                      General().setlongitude(long!);
                      General().setaddress(street.text);
                      General().getlatitude();
                      General().getlongitude();
                      if(General.token.trim() != ""){
                        controller.editUserData(lat!,long!,street.text);
                      }
                      General().getaddress().then((vv){
                        PageRouteTransition.effect = TransitionEffect.scale;
                        PageRouteTransition.pushReplacement(context,  const HomeView());
                      });
                      
                    },
                    child:  Text(
                      'Location confirmation'.tr,
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
        ],
      ),
    );
  }
}
