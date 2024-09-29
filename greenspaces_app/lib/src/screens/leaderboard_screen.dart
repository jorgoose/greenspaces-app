// File: lib/screens/leaderboard_screen.dart

import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  static const routeName = '/leaderboard';

  final List<Map<String, dynamic>> leaderboardData = [
    {'rank': 1, 'name': 'Alice', 'points': 150},
    {'rank': 2, 'name': 'Bob', 'points': 120},
    {'rank': 3, 'name': 'Charlie', 'points': 100},
    {'rank': 4, 'name': 'David', 'points': 80},
    {'rank': 5, 'name': 'Eve', 'points': 70},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: leaderboardData.length,
      itemBuilder: (context, index) {
        final user = leaderboardData[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green[700],
            child: Text(
              user['rank'].toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text(user['name']),
          trailing: Text('${user['points']} pts'),
        );
      },
    );
  }
}
