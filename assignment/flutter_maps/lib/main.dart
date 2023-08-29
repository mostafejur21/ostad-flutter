import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Map Tracking App',
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  LatLng _currentLocation = const LatLng(23.87454675242255, 90.38737193117785);
  final List<LatLng> _polylineCoordinates = [];
  final Set<Polyline> _polyline = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _polylineCoordinates.add(_currentLocation);
      _updatePolyline();
    });

    // Update the location every 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      _getCurrentLocation();
    });
  }

  void _updatePolyline() {
    _polyline.clear();
    _polyline.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.blue,
        width: 5,
        points: _polylineCoordinates,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Tracking App'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 15.0,
        ),
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        polylines: _polyline,
        markers: {
          Marker(
            markerId: const MarkerId('current_location'),
            position: _currentLocation,
            onTap: () {
              // Display an info window when marker is tapped
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('My current location'),
                    content: Text(
                      'Latitude: ${_currentLocation.latitude}, Longitude: ${_currentLocation.longitude}',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        },
      ),
    );
  }
}
