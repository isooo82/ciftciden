import 'package:flutter/material.dart';

class CiftcidenTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType textInputType;
  final String? prefixText;

  const CiftcidenTextField(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.text,
      this.textInputType = TextInputType.text,
      this.isPassword = false,
      this.prefixText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value){
        print(value);

      },
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: text,
        prefixText: prefixText,
        hintStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 24,
          height: 1.15,
          color: Color(0xFFA6A6A6),
        ),
      ),
    );
  }
}
