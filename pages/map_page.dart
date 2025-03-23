import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_database/firebase_database.dart';

// Function to send data to Firebase
Future<void> sendData(double latitude, double longitude) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();

  try {
    print("Attempting to send data: $latitude and $longitude");

    await database.child('Location').push().set({
      "latitude": latitude,
      "longitude": longitude,
      "timestamp": DateTime.now().toString(),
    });

    print("Data sent successfully!");
  } catch (error) {
    print("Error sending data: $error");
  }
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location _locationController = Location();
  GoogleMapController? _mapController;

  // Predefined Locations
  static const LatLng _Iphone = LatLng(33.753746, -84.386330);
  static const LatLng _Destination = LatLng(33.797028, -84.323242);

  LatLng? _currentP;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentP == null
          ? const Center(child: Text("Loading..."))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentP ?? _Iphone,
                zoom: 13,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("_CurrentLocation"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueCyan),
                  position: _currentP ?? _Iphone,
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
            ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
          if (_mapController != null) {
            _mapController!.animateCamera(CameraUpdate.newLatLng(_currentP!));
          }
        });

        // Send data to Firebase
        sendData(currentLocation.latitude!, currentLocation.longitude!);
      }
    });
  }
}
