import 'package:flutter/material.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsView({Key? key, required this.controller}) : super(key: key);

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: controller.themeMode == ThemeMode.dark,
            onChanged: (value) {
              controller
                  .updateThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
          ),
          // Add other settings options here
        ],
      ),
    );
  }
}
