import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: ListView.builder(
            shrinkWrap:
                true, // Ensures the ListView only occupies the space it needs.
            itemCount: 5, // The total number of items in the list.
            itemBuilder: (context, index) {
              // Build a list tile for each notification.
              return ListTile(
                title: Text('notification ${index + 1}'),
                subtitle: const Text('This is a notification'),
              );
            },
          )),
    );
  }
}
