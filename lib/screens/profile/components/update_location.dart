import 'package:flutter/material.dart';
import 'package:saydo/design_system/button_widgets/buttons/blue_buttons/button1.dart';

class UpdateLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Update your location',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  'Your location makes it easy for us to deliver you items.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    maxLength: 6,
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Store name',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Text(
                'Press the map to select where your property is located',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              elevation: 4.0,
              child: Container(
                height: MediaQuery.of(context).size.height / 4.9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Color(0x90707070),
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                      image: AssetImage('images/map.png'), scale: 0.5
                      // fit: BoxFit.cover,
                      ),
                ),
                // child: Image(
                //   image: AssetImage('images/image.png'),
                // ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
        child: Button1(
          label: 'Update',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
