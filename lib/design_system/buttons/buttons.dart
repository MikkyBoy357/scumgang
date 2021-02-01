import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';

class Buttons {
  // -----------------------------------------

  // Blue Buttons
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
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  static Widget button2 = SizedBox(
    height: 60,
    width: 243,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.blue1,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  static Widget button3 = SizedBox(
    height: 60,
    width: 143,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.blue1,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  // -----------------------------------------

  // lightBlue Buttons
  static Widget lightButton1 = SizedBox(
    height: 60,
    width: 343,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.blue5,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20, color: MyColors.blue1),
      ),
    ),
  );

  static Widget lightButton2 = SizedBox(
    height: 60,
    width: 243,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.blue5,
      textColor: MyColors.blue1,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  static Widget lightButton3 = SizedBox(
    height: 60,
    width: 143,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        // side: BorderSide(color: Colors.red),
      ),
      onPressed: () {},
      color: MyColors.blue5,
      textColor: MyColors.blue1,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  // -----------------------------------------

  // white Buttons
  static Widget whiteButton1 = SizedBox(
    height: 60,
    width: 343,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: Color(0xFFE6E6E6)),
      ),
      onPressed: () {},
      color: Colors.white,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20, color: MyColors.blue1),
      ),
    ),
  );

  static Widget whiteButton2 = SizedBox(
    height: 60,
    width: 243,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: Color(0xFFE6E6E6)),
      ),
      onPressed: () {},
      color: Colors.white,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20, color: MyColors.blue1),
      ),
    ),
  );

  static Widget whiteButton3 = SizedBox(
    height: 60,
    width: 143,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: Color(0xFFE6E6E6)),
      ),
      onPressed: () {},
      color: Colors.white,
      textColor: Colors.white,
      child: Text(
        "Button",
        style: TextStyle(fontSize: 20, color: MyColors.blue1),
      ),
    ),
  );

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
