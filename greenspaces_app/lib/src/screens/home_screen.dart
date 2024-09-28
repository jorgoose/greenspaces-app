import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    MapView(),
    ListViewScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToSettings() {
    Navigator.pushNamed(context, '/settings');
  }

  void _navigateToFlagLocation() {
    Navigator.pushNamed(context, '/flag_location');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GreenUp'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _navigateToSettings,
          ),
        ],
      ),
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToFlagLocation,
        child: Icon(Icons.add),
        tooltip: 'Flag a location',
        backgroundColor: Colors.green[700],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green[700],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
      ),
    );
  }
}

class MapView extends StatelessWidget {
  final List<LatLng> flaggedLocations = [
    LatLng(51.5, -0.09),
    LatLng(51.51, -0.1),
    LatLng(51.49, -0.08),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}{r}.png',
              subdomains: ['a', 'b', 'c', 'd'],
              // Since 'attributionBuilder' is not available, we can omit it or handle attribution manually
            ),
            // Optional: Overlay layer to highlight green spaces (if applicable)
            // TileLayer(
            //   urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
            //   subdomains: ['a', 'b', 'c'],
            // ),
            MarkerLayer(
              markers: flaggedLocations
                  .map(
                    (latLng) => Marker(
                      width: 40.0,
                      height: 40.0,
                      point: latLng,
                      builder: (ctx) => Icon(
                        Icons.eco,
                        color: Colors.green[700],
                        size: 30.0,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        // Manually add attribution if needed
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
    );
  }
}

class ListViewScreen extends StatelessWidget {
  final List<Map<String, dynamic>> flaggedLocations = [
    {'name': 'Park A', 'distance': '2 km'},
    {'name': 'Park B', 'distance': '3 km'},
    {'name': 'Park C', 'distance': '5 km'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: flaggedLocations.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(flaggedLocations[index]['name']),
          subtitle: Text('${flaggedLocations[index]['distance']} away'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pushNamed(context, '/event_details');
          },
        );
      },
    );
  }
}
