import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';

class Button3 extends StatelessWidget {
  final String label;
  const Button3({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          label,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
