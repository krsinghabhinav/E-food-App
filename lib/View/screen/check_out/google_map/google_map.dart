import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../../providers/check_out_provider.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({Key? key}) : super(key: key);

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  GoogleMapController? _mapController;
  Location _location = Location();

  final LatLng _initialCameraPosition =
      LatLng(25.1463, 82.5714); // Mirzapur Coordinates

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    // Request location permission

    _location.onLocationChanged.listen((event) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(event.latitude!, event.longitude!),
            zoom: 15.0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final checkOutProvider =
        Provider.of<CheckOutProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialCameraPosition,
                  zoom: 10,
                ),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                // Add myLocationButtonEnabled to show the button
                myLocationButtonEnabled: true,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      right: 60, left: 10, bottom: 30, top: 40),
                  child: MaterialButton(
                    onPressed: () async {
                      await _location.getLocation().then((newValue) {
                        setState(() {
                          checkOutProvider.setLocation = newValue;
                          Get.back();
                        });
                      });
                    },
                    color: Colors.yellow,
                    child: Text('Set Location'),
                    shape: const StadiumBorder(),
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
