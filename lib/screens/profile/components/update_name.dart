import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saydo/design_system/button_widgets/buttons/blue_buttons/button1.dart';

import '../../../home.dart';

class UpdateName extends StatelessWidget {
  String name;
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
                  'Update your name',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  'Your name makes it easy for us to interact with you offline.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    // maxLength: 6,
                    onChanged: (value) {
                      name = value;
                      print('name: $name');
                    },
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Full Name',
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
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
        child: Button1(
          label: 'Update',
          onPressed: () {
            DocumentReference documentReference = FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser.uid);
            print('=========> RANDOM LOG HAHAHAHAHA');
            Map<String, String> categories = {
              "name": name,
            };
            print("=======> Firestore Mapping");
            print(categories.toString());
            documentReference.set(categories).whenComplete(
              () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('SUCCESS'),
                      content: Text('$name Added Successfully'),
                    );
                  },
                );
              },
            );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
