import 'dart:async';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecentListnigsController extends GetxController {
  final listofrecentListings = [].obs;
  final listoflistingsProduct = [].obs;
  final listofProductServices = [].obs;
  final listofallSubCat = [].obs;
  final listofFaq = [].obs;

  var lat = 0.0.obs;
  var lng = 0.0.obs;
  Completer<GoogleMapController> mapcontroller = Completer();
  var kGooglePlex = CameraPosition(
    target: LatLng(33.721491, -6.058594),
    zoom: 14.4746,
  ).obs;
  var isload = false.obs;
  late Set<Marker> marker = {};
  var loadMap = false.obs;

  getLocationData() async {
    marker.add(Marker(
      position: LatLng(
        lat.value,
        lng.value,
      ),
      markerId: MarkerId('abc'),
    ));
    kGooglePlex.value = CameraPosition(
      target: LatLng(
        lat.value,
        lng.value,
      ),
      zoom: 13.4746,
    );
    printlog('isloaded');
    isload.value = true;
    loadMap.value = true;
    // try {
    //   List<Location> locations = await locationFromAddress(
    //       "${listofrecentListings[0]['area']} Pakistan");
    //   locations.forEach((element) {
    //     Location location = element;
    //     lat.value = location.latitude;
    //     lng.value = location.longitude;
    //     marker.add(Marker(
    //       position: LatLng(
    //         lat.value,
    //         lng.value,
    //       ),
    //       markerId: MarkerId('abc'),
    //     ));
    //     kGooglePlex.value = CameraPosition(
    //       target: LatLng(
    //         lat.value,
    //         lng.value,
    //       ),
    //       zoom: 13.4746,
    //     );
    //     printlog('isloaded');
    //     isload.value = true;
    //     loadMap.value = true;
    //   });
    // } catch (e) {
    //   List<Location> locations = await locationFromAddress(
    //     "Islamabad Pakistan",
    //   );
    //   locations.forEach((element) {
    //     Location location = element;
    //     lat.value = location.latitude;
    //     lng.value = location.longitude;
    //     marker.add(Marker(
    //       position: LatLng(
    //         lat.value,
    //         lng.value,
    //       ),
    //       markerId: MarkerId('abc'),
    //     ));
    //     kGooglePlex.value = CameraPosition(
    //       target: LatLng(
    //         lat.value,
    //         lng.value,
    //       ),
    //       zoom: 13.4746,
    //     );
    //     printlog('isloaded');
    //     isload.value = true;
    //     loadMap.value = true;
    //   });
    //}
  }

  var ratingPoints = 0.obs;

  @override
  void dispose() {
    lat.value = 0.0;
    lng.value = 0.0;
    ratingPoints.value = 0;
    listofrecentListings.value = [];
    listoflistingsProduct.value = [];
    listofProductServices.value = [];
    kGooglePlex.value = CameraPosition(
      target: LatLng(33.721491, -6.058594),
      zoom: 14.4746,
    );
    isload.value = false;
    marker = {};
    super.dispose();
  }

  final listgetlistingrating = [].obs;
}
