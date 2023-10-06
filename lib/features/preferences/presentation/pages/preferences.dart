import 'package:flutter/material.dart';

class PerferencesScreen extends StatelessWidget {
  const PerferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Allow Notifications'),
          value: true,
          onChanged: (bool? value) {
            
          },
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: false,
          onChanged: (bool? value) {
            
          },
        ),
        ListTile(
            title: Text("en"),
            onTap: () {
              
            }),
      ],
    );
  }
}
