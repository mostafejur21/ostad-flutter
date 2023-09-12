import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
  createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  final Location _location = Location();
  LocationData? currentLocation;
  final LatLng _sourceLocation =
      const LatLng(23.874108222537796, 90.39055357559128);
  final LatLng _destinationLocation =
      const LatLng(23.869629140134034, 90.39075068098418);
  final List<LatLng> _polylineCoordinates = [];
  final Set<Polyline> _polyline = {};

  void _getCurrentLocation() {
    Location location = Location();
    location.getLocation().then(
      (location) {
        setState(() {
          currentLocation = location;
        });
      },
    );
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // void _getCurrentLocation() async {
  //   final position = await Geolocator.getCurrentPosition();
  //   setState(() {
  //     _currentLocation = LatLng(position.latitude, position.longitude);
  //     _updatePolyline();
  //   });
  //
  //   _startLocationUpdates();
  // }

  void _startLocationUpdates() async {
    if (await _location.serviceEnabled()) {
      _location.changeSettings(interval: 10000);
      _location.enableBackgroundMode(enable: true);
    } else {
      bool serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
  }

  void _updatePolyline() {
    _polyline.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.blue,
        width: 5,
        points: [_sourceLocation, _destinationLocation],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Tracking App'),
      ),
      body: currentLocation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                zoom: 15.0,
              ),
              onMapCreated: (controller) {
                setState(() {
                  _controller = controller;
                });
              },
              polylines: <Polyline>{
                Polyline(
                  polylineId: const PolylineId('route'),
                  color: Colors.blue,
                  width: 5,
                  points: [_sourceLocation, _destinationLocation],
                ),
              },
              markers: {
                Marker(
                  markerId: const MarkerId('current_location'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                  ),
                  infoWindow: InfoWindow(
                      title: 'current location',
                      snippet:
                          '${_sourceLocation.latitude}, ${_sourceLocation.longitude}'),
                ),
                Marker(
                  markerId: const MarkerId('source_location'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: _sourceLocation,
                  infoWindow: InfoWindow(
                      title: 'source location',
                      snippet:
                          '${_sourceLocation.latitude}, ${_sourceLocation.longitude}'),
                ),
                Marker(
                  markerId: const MarkerId('destination_location'),
                  position: _destinationLocation,
                  infoWindow: InfoWindow(
                      title: 'destination location',
                      snippet:
                          '${_destinationLocation.latitude}, ${_destinationLocation.longitude}'),
                ),
              },
            ),
    );
  }
}
