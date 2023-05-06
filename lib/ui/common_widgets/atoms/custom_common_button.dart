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
            borderRadius: BorderRadius.circular(30.0),
            // You can also specify other border properties here
          ),
          side: const BorderSide(
            width: 2.0,
            color: Colors.black,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.5.w),
          child: Text(text, style: TextStyle(color: Colors.black, fontSize: 14.sp)),
        ));
  }
}
