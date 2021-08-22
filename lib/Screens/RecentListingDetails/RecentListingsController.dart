import 'dart:async';
import 'package:dail_box/AppUtils.dart/LogsUtils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecentListnigsController extends GetxController {
  final listofrecentListings = [].obs;
  final listoflistingsProduct = [].obs;
  final listofProductServices = [].obs;

  var lat = 0.0.obs;
  var lng = 0.0.obs;
  Completer<GoogleMapController> mapcontroller = Completer();
  var kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  ).obs;
  var isload = false.obs;
  late Set<Marker> marker = {};

  getLocationData() async {
    List<Location> locations =
        await locationFromAddress("Gronausestraat 710, Enschede");
    locations.forEach((element) {
      Location location = element;
      lat.value = location.latitude;
      lng.value = location.longitude;
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
        zoom: 14.4746,
      );
      printlog('isloaded');
      isload.value = true;
    });
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
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    isload.value = false;
    marker = {};
    super.dispose();
  }

  final listgetlistingrating = [].obs;
}
