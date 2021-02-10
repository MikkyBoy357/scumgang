import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';

class WhiteButton1 extends StatelessWidget {
  final String label;
  const WhiteButton1({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          label,
          style: TextStyle(
            fontSize: 20,
            color: MyColors.black1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
