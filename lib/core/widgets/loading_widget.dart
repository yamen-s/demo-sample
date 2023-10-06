import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50), // Adjust the radius as needed
          child: const CircularProgressIndicator(
            // You can customize the colors and size of the CircularProgressIndicator here
            strokeWidth: 10,
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
        ),
        // const SizedBox(height: 15),
        // const Text('Loading...',style: headingStyle),
        // const SizedBox(height: 15),
        // const Text('Please wait...',style: descriptionStyle)
      ],
    );
  }
}
