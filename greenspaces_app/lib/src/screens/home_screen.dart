// File: lib/screens/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> cleanupEvents = [
    {'name': 'Cleanup at Park A', 'date': 'Dec 1, 2023', 'distance': '2 km'},
    {'name': 'Cleanup at Park B', 'date': 'Dec 5, 2023', 'distance': '3 km'},
    {'name': 'Cleanup at Park C', 'date': 'Dec 10, 2023', 'distance': '5 km'},
  ];

  String _sortOption = 'Nearest';

  Future<void> _refreshList() async {
    // Simulate fetching data from backend
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // Update the list if necessary
    });
  }

  void _openSortOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              title: Text('Sort by Nearest'),
              onTap: () {
                setState(() {
                  _sortOption = 'Nearest';
                  // Sort the list accordingly
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sort by Date'),
              onTap: () {
                setState(() {
                  _sortOption = 'Date';
                  // Sort the list accordingly
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _openSearch() {
    showSearch(context: context, delegate: CleanupSearchDelegate());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshList,
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Upcoming Cleanups',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _openSearch,
                ),
                IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: _openSortOptions,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cleanupEvents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.event,
                    color: Colors.green[700],
                  ),
                  title: Text(cleanupEvents[index]['name']),
                  subtitle: Text(
                      '${cleanupEvents[index]['date']} • ${cleanupEvents[index]['distance']} away'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(context, '/event_details');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CleanupSearchDelegate extends SearchDelegate<String> {
  final List<String> searchResults = [
    'Cleanup at Park A',
    'Cleanup at Park B',
    'Cleanup at Park C',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          tooltip: 'Clear',
          icon: Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = searchResults.where((event) {
      return event.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final event = results[index];
        return ListTile(
          title: Text(event),
          onTap: () {
            Navigator.pushNamed(context, '/event_details');
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = searchResults.where((event) {
      return event.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final event = suggestions[index];
        return ListTile(
          title: Text(event),
          onTap: () {
            Navigator.pushNamed(context, '/event_details');
          },
        );
      },
    );
  }
}
