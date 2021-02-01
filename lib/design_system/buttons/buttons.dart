import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';

class Buttons {
  static Widget button1 = SizedBox(
    height: 60,
    width: 343,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.blue1,
      textColor: Colors.white,
      child: Text(
        "Buy now".toUpperCase(),
        style: TextStyle(fontSize: 14),
      ),
    ),
  );
}
