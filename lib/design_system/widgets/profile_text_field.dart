import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final Function onChanged;
  final String hintText;
  const ProfileTextField({
    Key key,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      onChanged: onChanged,
      decoration: InputDecoration.collapsed(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
      ),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
