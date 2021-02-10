import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';
import 'package:saydo/design_system/text_styles/text_styles.dart';
import 'package:saydo/models/profile.dart';
import 'package:saydo/screens/profile/components/update_name.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: MyColors.black2,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 390,
                  child: ListView.builder(
                    itemCount: profileTiles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print('clicked');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return profileTiles[index].page;
                              },
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            '${profileTiles[index].title}',
                            style: MyTextStyles.titleStyle,
                          ),
                          subtitle: Text(
                            '${profileTiles[index].subtitle}',
                            style: MyTextStyles.subtitleStyle,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 10,
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // side: BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UpdateName();
                        },
                      ),
                    );
                  },
                  color: MyColors.red1,
                  textColor: Colors.white,
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
