import 'package:flutter/material.dart';
import 'package:saydo/design_system/buttons/white_buttons/white_button1.dart';
import 'package:saydo/design_system/buttons/white_buttons/white_button2.dart';
import 'package:saydo/design_system/buttons/white_buttons/white_button3.dart';
import 'package:saydo/design_system/colors/colors.dart';

import 'blue_buttons/button1.dart';
import 'blue_buttons/button2.dart';
import 'blue_buttons/button3.dart';
import 'light_blue_buttons/light_blue_button1.dart';
import 'light_blue_buttons/light_blue_button2.dart';
import 'light_blue_buttons/light_blue_button3.dart';

class Buttons {
  // -----------------------------------------

  // Blue Buttons
  static Widget button1 = Button1();

  static Widget button2 = Button2();

  static Widget button3 = Button3();

  // -----------------------------------------

  // lightBlue Buttons
  static Widget lightButton1 = LightButton1();

  static Widget lightButton2 = LightButton2();

  static Widget lightButton3 = LightButton3();

  // -----------------------------------------

  // white Buttons
  static Widget whiteButton1 = WhiteButton1();

  static Widget whiteButton2 = WhiteButton2();

  static Widget whiteButton3 = WhiteButton3();

  // -----------------------------------------

  // Disabled Buttons

  // -----------------------------------------

  // Disable Blue Buttons
  static Widget disabledButton1 = SizedBox(
    height: 60,
    width: 343,
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.black2,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  static Widget disabledButton2 = SizedBox(
    height: 60,
    width: 243,
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.black2,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  static Widget disabledButton3 = SizedBox(
    height: 60,
    width: 143,
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.black2,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  // -----------------------------------------

  // Disable lightBlue Buttons

  static Widget disabledLightButton1 = SizedBox(
    height: 60,
    width: 343,
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.black3,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20, color: MyColors.black2),
      ),
    ),
  );

  static Widget disabledLightButton2 = SizedBox(
    height: 60,
    width: 243,
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.black3,
      textColor: MyColors.black2,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  static Widget disabledLightButton3 = SizedBox(
    height: 60,
    width: 143,
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.black3,
      textColor: MyColors.black2,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  // -----------------------------------------

  // Disable white Buttons
  static Widget disabledWhiteButton1 = SizedBox(
    height: 60,
    width: 343,
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: MyColors.black3),
      ),
      onPressed: () {},
      color: Colors.white,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20, color: MyColors.black2),
      ),
    ),
  );

  static Widget disabledWhiteButton2 = SizedBox(
    height: 60,
    width: 243,
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: MyColors.black3),
      ),
      onPressed: () {},
      color: Colors.white,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20, color: MyColors.black2),
      ),
    ),
  );

  static Widget disabledWhiteButton3 = SizedBox(
    height: 60,
    width: 143,
    child: RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: MyColors.black3),
      ),
      onPressed: () {},
      color: Colors.white,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20, color: MyColors.black2),
      ),
    ),
  );
}
