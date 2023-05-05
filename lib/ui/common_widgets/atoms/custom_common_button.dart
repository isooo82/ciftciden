import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomCommonButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            // You can also specify other border properties here
          ),
          side: const BorderSide(
            width: 2.0,
            color: Colors.black,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(text, style: const TextStyle(color: Colors.black)),
        ));
  }
}
