import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  static const routeName = '/to-gmap';
  final int lat;
  final int long;

  GMap(this.lat, this.long);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Map'),
      ),
      body: GoogleMap(
        markers: {
          Marker(
            markerId: MarkerId('marker1'),
            position: LatLng(
              widget.lat.toDouble(),
              widget.long.toDouble(),
            ),
          )
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat.toDouble(), widget.long.toDouble()),
          zoom: 15,
        ),
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
