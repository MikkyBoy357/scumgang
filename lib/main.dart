import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:saydo/screens/home/main_screen.dart';
import 'package:saydo/screens/language_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalizations.getAppLang();
  print(await AppLocalizations.getAppLang());
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saydo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      supportedLocales: [
        Locale('en', 'UK'),
        Locale('ku', 'IQ'),
        Locale('ar', 'SA'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      // home: LoginScreen(),
      home: buildHome(),
      builder: (context, child) {
        return Directionality(
          textDirection: AppLocalizations.userLocale == 'en'
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: child,
        );
      },
    );
  }

  buildHome() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          // print(snapshot);
          return MainScreen();
        } else {
          return LanguageScreen();
        }
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return LanguageScreen();
//   }
// }
