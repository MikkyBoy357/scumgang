import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final Function onPressed;
  final String brandName;

  const BrandCard({Key key, this.onPressed, this.brandName}) : super(key: key);
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        elevation: 4.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0x90707070)),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Color(0x90707070),
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: AssetImage('images/image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Image(
                //   image: AssetImage('images/image.png'),
                // ),
              ),
              Container(
                height: 10,
              ),
              Text(
                brandName,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
