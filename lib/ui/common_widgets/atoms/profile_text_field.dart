import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatefulWidget {
  final String text;
  final IconData icon;
  final IconData setting_icon;
  final TextEditingController textEditingController;

  const ProfileTextField(
      {Key? key,
      required this.textEditingController,
      required this.text,
      required this.icon,
      required this.setting_icon})
      : super(key: key);

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
            onChanged: (String value) {
              widget.textEditingController.text = value;
            },
            style: const TextStyle(fontSize: 16),
            controller: widget.textEditingController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              filled: true,
              fillColor: const Color.fromRGBO(29, 27, 32, 0.08),
              labelText: widget.text,
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
              onPressed: () {
                setState(() {
                  isEnabled = !isEnabled;
                });
              },
              icon: Icon(widget.setting_icon)),
        ),
      ],
    );
  }
}
