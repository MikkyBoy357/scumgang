import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saydo/design_system/button_widgets/buttons/blue_buttons/button1.dart';

class UpdatePhoneNumber extends StatefulWidget {
  @override
  _UpdatePhoneNumberState createState() => _UpdatePhoneNumberState();
}

class _UpdatePhoneNumberState extends State<UpdatePhoneNumber> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _countryCodeController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  var phoneNumber;

  void updatePhoneNumber(BuildContext context) {
    phoneNumber =
        '+${_countryCodeController.text}${_phoneNumberController.text}';
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid);
    print('=========> RANDOM LOG HAHAHAHAHA');
    Map<String, String> categories = {
      "phoneNumber": phoneNumber,
    };
    print(phoneNumber);
    print("=======> Firestore Mapping");
    print(categories.toString());
    documentReference.update(categories).whenComplete(
      () {
        showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('SUCCESS'),
              content: Text('Phone number Added Successfully'),
            );
          },
        );
      },
    );
  }

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
                    Text(
                      '+',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      width: 50,
                      child: TextField(
                        controller: _countryCodeController,
                        decoration: InputDecoration(
                          hintText: '964',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500],
                          ),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      width: 30,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500],
                          ),
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
            updatePhoneNumber(context);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
