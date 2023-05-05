import 'package:flutter/material.dart';

class CustomBlueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomBlueButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            primary: Colors.white
            // backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
        ),
        child: Text(text, style: const TextStyle(fontSize: 24)));
  }
}
