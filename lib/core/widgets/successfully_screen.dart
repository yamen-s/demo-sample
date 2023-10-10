import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_constants.dart';
import '../constants/app_globals.dart';
import '../constants/assets_path.dart';

class SuccessfullScreen extends StatelessWidget {
  final String title;

  final String subtitle;

  final String message;

  const SuccessfullScreen({Key? key, required this.title, required this.subtitle, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(MediaQuery.of(context).size.width, 50),
                bottomRight: Radius.elliptical(MediaQuery.of(context).size.width, 50),
              ),
            ),
            child: Column(
              children: [
                const Spacer(flex: 2),
                const Icon(
                  FontAwesomeIcons.circleCheck,
                  color: whiteColor,
                  size: 120,
                ),
                const Spacer(flex: 1),
                Text(
                  title,
                  style: buttonTextDarkBgStyle,
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Spacer(flex: 3),
                Text(title, style: textStyle2Black),
                const Spacer(flex: 1),
                Text(subtitle, style: textStyle3Black),
                const Spacer(flex: 1),
                Text(message, style: textStyle3DarkGrey, textAlign: TextAlign.center),
                const Spacer(flex: 3),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Image.asset(appLogo),
                ),
                const Spacer(flex: 3),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: whiteColor,
        shape: const CircleBorder(),
        elevation: 5,
        child: const Icon(FontAwesomeIcons.xmark, size: 35),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
