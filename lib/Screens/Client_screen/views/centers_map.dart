import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

var centersCollection = FirebaseFirestore.instance.collection('centers');

class CentersMap extends StatefulWidget {
  const CentersMap({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<CentersMap> {
  late double longitude;
  bool isLoading = false;
  bool isDone = false;
  late Uint8List markerIcon;

  late double altitude;
  getCurrentPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        /*  Get.to(HomePageAdmin());*/
      }
    } else {
      var position = await Geolocator.getCurrentPosition();

      getBytesFromAsset("images/marker.png", 100).then((value) {
        setState(() {
          longitude = position.longitude;
          altitude = position.altitude;
          markerIcon = value;
        });
      });
    }
  }

  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<bool> avoidRteurnButton() async {
    Get.back();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: avoidRteurnButton,
        child: Scaffold(
            body: StreamBuilder<QuerySnapshot>(
          stream: centersCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var listOfCenters = snapshot.data!.docs.toList();
              Set<Marker> markers = {};
              for (var data in listOfCenters) {
                markers.add(Marker(
                    onTap: () async {
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                              data.get("latitude"), data.get("langitude"));
                      Get.closeCurrentSnackbar();
                      Get.snackbar(
                          "Campino",
                          "Nom :${data.get("name")}\n"
                              "Adresse : ${placemarks[0].country}-${placemarks[0].administrativeArea}-${placemarks[0].name}\n GSM:${data.get("Gsm")}",
                          borderRadius: 20,
                          duration: Duration(seconds: 10),
                          icon:
                              Icon(Icons.location_on, color: Colors.blueAccent),
                          snackPosition: SnackPosition.TOP,
                          mainButton: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Icon(Icons.close)));
                    },
                    markerId: MarkerId(data.id),
                    position:
                        LatLng(data.get('latitude'), data.get('langitude'))));
              }
              return Container(
                child: Stack(
                  children: [
                    GoogleMap(
                      markers: markers,
                      trafficEnabled: true,
                      myLocationEnabled: true,
                      scrollGesturesEnabled: true,
                      initialCameraPosition: CameraPosition(
                        zoom: 6.7,
                        target: LatLng(36.820719, 9.776173),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )),
      ),
    );
  }
}
