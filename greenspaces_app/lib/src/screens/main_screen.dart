// File: lib/screens/main_screen.dart

import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'map_screen.dart';
import 'report_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = [
      HomeScreen(),
      MapScreen(),
      ReportScreen(),
      LeaderboardScreen(),
      ProfileScreen(),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToSettings() {
    Navigator.pushNamed(context, '/settings');
  }

  void _openSearch() {
    // Implement search functionality
    showSearch(context: context, delegate: CleanupSearchDelegate());
  }

  AppBar _buildAppBar() {
    switch (_currentIndex) {
      case 0: // Home
        return AppBar(
          title: Text('Home'),
          backgroundColor: Colors.green[700],
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _openSearch,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _navigateToSettings,
            ),
          ],
        );
      case 1: // Map
        return AppBar(
          title: Text('Map'),
          backgroundColor: Colors.green[700],
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _openSearch,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _navigateToSettings,
            ),
          ],
        );
      case 2: // Report
        return AppBar(
          title: Text('Report Pollution'),
          backgroundColor: Colors.green[700],
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _navigateToSettings,
            ),
          ],
        );
      case 3: // Leaderboard
        return AppBar(
          title: Text('Leaderboard'),
          backgroundColor: Colors.green[700],
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _navigateToSettings,
            ),
          ],
        );
      case 4: // Profile
        return AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.green[700],
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _navigateToSettings,
            ),
          ],
        );
      default:
        return AppBar(
          title: Text('GreenUp'),
          backgroundColor: Colors.green[700],
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _navigateToSettings,
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define the text styles for the labels
    const labelStyle = TextStyle(fontSize: 10); // Reduce font size to 10

    return Scaffold(
      appBar: _buildAppBar(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
