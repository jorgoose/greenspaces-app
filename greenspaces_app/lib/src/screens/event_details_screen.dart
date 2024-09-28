import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  static const routeName = '/event_details';

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  bool _isJoined = false;

  void _toggleJoin() {
    setState(() {
      _isJoined = !_isJoined;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(_isJoined
              ? 'You have joined the event!'
              : 'You have left the event.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cleanup Event'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Event at Park A',
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 8.0),
            Text('Date: December 1, 2023'),
            SizedBox(height: 8.0),
            Text('Time: 10:00 AM - 2:00 PM'),
            SizedBox(height: 8.0),
            Text('Volunteers Needed: 10'),
            SizedBox(height: 16.0),
            Text('Description:', style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: 4.0),
            Text(
                'Join us in cleaning up Park A. We will be collecting trash and recyclables to restore the park to its natural beauty.'),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _toggleJoin,
              child: Text(_isJoined ? 'Leave Event' : 'Join Event'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                primary: _isJoined ? Colors.grey : Colors.green[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
