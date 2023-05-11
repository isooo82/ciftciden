import 'package:flutter/material.dart';

class CustomSnackBar<Snackbar> extends StatelessWidget {
  final String text;
  const CustomSnackBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );;
  }
}
