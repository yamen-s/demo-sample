import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';

class SkipAndBackButtonWidget extends StatelessWidget {

  final Widget child;

  const SkipAndBackButtonWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.5,
      shadowColor: secondaryColor.withOpacity(0.25),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: secondaryColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}