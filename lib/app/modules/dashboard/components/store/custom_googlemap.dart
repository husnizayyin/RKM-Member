import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatelessWidget {
  const CustomGoogleMap({
    Key? key,
    required this.lat,
    required this.long,
    required this.markers,
    this.onMapCreated,
  }) : super(key: key);

  final double lat;
  final double long;
  final void Function(GoogleMapController)? onMapCreated;
  final Set<Marker>? markers;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(lat, long),
        zoom: 13,
      ),
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
      onMapCreated: onMapCreated,
      markers: markers ?? const {},
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      buildingsEnabled: true,
      indoorViewEnabled: true,
      mapToolbarEnabled: true,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: true,
    );
  }
}
