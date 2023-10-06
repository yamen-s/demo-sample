import 'package:flutter/material.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  const MessageDisplayWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      color: Colors.red,
      child: (message.endsWith('\n')) ? Text(
        message.substring(0, message.length - 1),
        style: const TextStyle(
          color: Colors.white
        ),
      ) : Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}