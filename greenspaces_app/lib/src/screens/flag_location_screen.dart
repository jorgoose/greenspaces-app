import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlagLocationScreen extends StatefulWidget {
  static const routeName = '/flag_location';

  @override
  _FlagLocationScreenState createState() => _FlagLocationScreenState();
}

class _FlagLocationScreenState extends State<FlagLocationScreen> {
  LatLng? _selectedLocation;
  final _descriptionController = TextEditingController();

  void _submitReport() {
    if (_selectedLocation != null && _descriptionController.text.isNotEmpty) {
      // For MVP, we just show a confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location flagged successfully!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a location and enter a description'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flag a Location'),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    center: LatLng(51.5, -0.09),
                    zoom: 13.0,
                    onTap: (tapPosition, point) {
                      setState(() {
                        _selectedLocation = point;
                      });
                    },
                  ),
                  children: [
                    TileLayer(
                      // Using the same simplified tile layer as the HomeScreen
                      urlTemplate:
                          'https://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}{r}.png',
                      subdomains: ['a', 'b', 'c', 'd'],
                    ),
                    if (_selectedLocation != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _selectedLocation!,
                            width: 40.0,
                            height: 40.0,
                            builder: (ctx) => Icon(
                              Icons.eco,
                              color: Colors.green[700],
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    color: Colors.white70,
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      '© OpenStreetMap contributors',
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Describe the pollution',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitReport,
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    primary: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
