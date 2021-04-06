import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saydo/app_localizations.dart';
import 'package:saydo/design_system/button_widgets/buttons/blue_buttons/button1.dart';
import 'package:saydo/design_system/button_widgets/buttons/white_buttons/white_button1.dart';
import 'package:saydo/auth/login_screen.dart';
import 'package:saydo/design_system/const.dart';
import 'package:saydo/main.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  // List<bool> _selections = List.generate(3, (index) => false);
  goToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          AppLocalizations.getAppLang();
          print('${AppLocalizations.myLang}');
          return LoginScreen();
        },
      ),
    );
  }

  String language;

  void updateLanguage(BuildContext context, String lang) {
    language = lang;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid);
    print('=========> RANDOM LOG HAHAHAHAHA');
    Map<String, String> categories = {
      "language": language,
    };
    print("=======> Firestore Mapping");
    print(categories.toString());
    documentReference.update(categories).whenComplete(
      () {
        showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('SUCCESS'),
              content: Text('$language Added Successfully'),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 90.0),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User> snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('choose_language'),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  WhiteButton1(
                    label: 'کوردی',
                    onPressed: () {
                      if (!snapshot.hasData) {
                        AppLocalizations.changeStartUpLang('ku');
                        Const.appLang = 'ku';
                        print(Const.appLang);
                        goToLoginScreen();
                      } else {
                        AppLocalizations.changeStartUpLang('ku');
                        Const.appLang = 'ku';
                        print(Const.appLang);
                        updateLanguage(context, 'Kurdish');
                        Navigator.pop(context);
                      }
                    },
                  ),
                  WhiteButton1(
                    label: 'عربی',
                    onPressed: () {
                      if (!snapshot.hasData) {
                        AppLocalizations.changeStartUpLang('ar');
                        Const.appLang = 'ar';
                        print(Const.appLang);
                        goToLoginScreen();
                      } else {
                        AppLocalizations.changeStartUpLang('ar');
                        Const.appLang = 'ar';
                        print(Const.appLang);
                        updateLanguage(context, 'Arabic');
                        Navigator.pop(context);
                      }
                    },
                  ),
                  Button1(
                    label: 'English',
                    onPressed: () {
                      if (!snapshot.hasData) {
                        AppLocalizations.changeStartUpLang('en');
                        Const.appLang = 'en';
                        print(Const.appLang);
                        goToLoginScreen();
                      } else {
                        AppLocalizations.changeStartUpLang('en');
                        Const.appLang = 'en';
                        print(Const.appLang);
                        updateLanguage(context, 'English');
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
