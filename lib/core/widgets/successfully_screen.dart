import 'package:flutter/material.dart';

class SuccessfullScreen extends StatelessWidget {

  final String title;

  final String subtitle;

  final String message;

  const SuccessfullScreen({Key? key, required this.title, required this.subtitle, required this.message}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Design Successfull Screen'),
      ),
    );
  }
}
