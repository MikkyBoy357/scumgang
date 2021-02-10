import 'package:flutter/material.dart';
import 'package:saydo/design_system/button_widgets/buttons/blue_buttons/button1.dart';
import 'package:saydo/design_system/colors/colors.dart';

import 'home/main_screen.dart';

class NumberVerification extends StatelessWidget {
  final phoneNumber;

  const NumberVerification({Key key, this.phoneNumber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(phoneNumber);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  'Please enter the verification code sent to',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                Text(
                  '+964 $phoneNumber',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  width: 200,
                  child: TextField(
                    maxLength: 6,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '000000',
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
                Container(
                  height: 50,
                ),
                Button1(
                  label: 'Log In',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainScreen();
                        },
                      ),
                    );
                  },
                ),
                Container(
                  height: 20,
                ),
                Text(
                  'Didn\'t receive your code?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  height: 5.0,
                ),
                GestureDetector(
                  child: Text(
                    'Press here to resend code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blue1,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
