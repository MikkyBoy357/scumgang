import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saydo/design_system/button_widgets/buttons/blue_buttons/button1.dart';

class UpdatePhoneNumber extends StatefulWidget {
  @override
  _UpdatePhoneNumberState createState() => _UpdatePhoneNumberState();
}

class _UpdatePhoneNumberState extends State<UpdatePhoneNumber> {
  TextEditingController _controller = TextEditingController();

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
                  'Update your mobile number',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  'We will confirm your number by sending you a code.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '+964',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      width: 30,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey[500]),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                ),
              ],
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
