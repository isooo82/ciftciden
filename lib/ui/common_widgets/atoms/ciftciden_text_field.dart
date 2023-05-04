import 'package:flutter/material.dart';

class CiftcidenTextField extends StatelessWidget {
  final String text;
  final IconData icon;

  const CiftcidenTextField({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: text,
        hintStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 20,
          height: 1.15,
          color: Color(0xFFA6A6A6),
        ),
      ),
    )
    ;
  }
}
