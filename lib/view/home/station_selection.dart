import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationSelectionPage extends StatefulWidget {
  const StationSelectionPage({
    super.key,
  });

  @override
  State<StationSelectionPage> createState() => _StationSelectionPageState();
}

class _StationSelectionPageState extends State<StationSelectionPage> {
  final LatLng initialCameraPosition = const LatLng(24.9615977, 67.1129883);
  List<Map<String, double>> locations = [
    {'latitude': 40.7128, 'longitude': -74.0060}, // New York City, USA
    {'latitude': 34.0522, 'longitude': -118.2437}, // Los Angeles, USA
    {'latitude': 51.5074, 'longitude': -0.1278}, // London, UK
    {'latitude': 48.8566, 'longitude': 2.3522}, // Paris, France
    {'latitude': 35.682839, 'longitude': 139.759455}, // Tokyo, Japan
  ];

  int selectedCardIndex = 0;
  late GoogleMapController mapController;

  void onCardChange(int index, CarouselPageChangedReason reason) {
    setState(() {
      selectedCardIndex = index;
      updateCameraPosition();
    });
  }

  void updateCameraPosition() {
    final LatLng target = LatLng(
      locations[selectedCardIndex]['latitude']!,
      locations[selectedCardIndex]['longitude']!,
    );

    final CameraUpdate cameraUpdate = CameraUpdate.newLatLng(target);

    mapController.animateCamera(cameraUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialCameraPosition,
                zoom: 13,
              ),
              onMapCreated: (controller) {
                mapController = controller;
                updateCameraPosition(); // Set the initial camera position
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  onPageChanged: onCardChange,
                ),
                items: locations.map((location) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: context.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: Text(
                          'Latitude: ${location['latitude']}, Longitude: ${location['longitude']}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
