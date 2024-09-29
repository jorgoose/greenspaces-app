// File: lib/screens/map_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<LatLng> cleanupLocations = [
    LatLng(51.5, -0.09),
    LatLng(51.51, -0.1),
    LatLng(51.49, -0.08),
  ];

  final MapController _mapController = MapController();
  final PopupController _popupController = PopupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: LatLng(51.5, -0.09),
          zoom: 13.0,
          onTap: (_, __) => _popupController.hideAllPopups(),
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}{r}.png',
            subdomains: ['a', 'b', 'c', 'd'],
          ),
          MarkerLayer(
            markers: cleanupLocations
                .map(
                  (latLng) => Marker(
                    point: latLng,
                    width: 40.0,
                    height: 40.0,
                    builder: (ctx) => GestureDetector(
                      onTap: () {
                        _popupController.togglePopup(
                          Marker(
                            point: latLng,
                            builder: (_) => Container(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.event,
                        color: Colors.green[700],
                        size: 30.0,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          PopupMarkerLayerWidget(
            options: PopupMarkerLayerOptions(
              popupController: _popupController,
              markers: cleanupLocations
                  .map(
                    (latLng) => Marker(
                      point: latLng,
                      builder: (_) => Container(),
                    ),
                  )
                  .toList(),
              popupBuilder: (BuildContext context, Marker marker) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event_details');
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Cleanup Event\nTap for details',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement search functionality if needed
        },
        child: Icon(Icons.search),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}
