import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final Function onPressed;
  final String brandName;
  final String image;

  const BrandCard({Key key, this.onPressed, this.brandName, this.image})
      : super(key: key);
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
                height: MediaQuery.of(context).size.height * 0.130,
                width: MediaQuery.of(context).size.height * 0.130,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Color(0x90707070),
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: NetworkImage(image),
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
