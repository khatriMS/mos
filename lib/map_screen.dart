import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map_scren extends StatefulWidget {
  Map_scren({super.key});

  @override
  State<Map_scren> createState() => _Map_screnState();
}

class _Map_screnState extends State<Map_scren> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(18.197621, -16.3035809);

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    // final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in [1, 2, 3, 4, 5]) {
        final marker = Marker(
          markerId: MarkerId("office.name ${office}"),
          position: LatLng(18.197621 + office, -16.3035809 + office),
          infoWindow: InfoWindow(
            title: "cli",
            snippet: "office.address",
          ),
        );
        _markers["office.name ${office}"] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 18.0,
      ),
      markers: _markers.values.toSet(),
    ));
  }
}
