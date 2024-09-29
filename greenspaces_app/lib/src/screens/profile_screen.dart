// File: lib/screens/profile_screen.dart

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  void _navigateToSettings(BuildContext context) {
    Navigator.pushNamed(context, '/settings');
  }

  void _navigateToMyEvents(BuildContext context) {
    Navigator.pushNamed(context, '/my_events');
  }

  void _logout(BuildContext context) {
    // Implement logout functionality
    // For now, just show a message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logged out')),
    );
    // Navigate back to login screen or initial screen
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.green[700],
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'User Name',
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 8.0),
          Text(
            'user@example.com',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          SizedBox(height: 24.0),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('My Events'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => _navigateToMyEvents(context),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
