import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/application.dart';
import 'package:flutter_base_by_minhnv/data/local/database/app_database/app_database.dart';
import 'package:flutter_base_by_minhnv/ui/main/add_person/add_person.dart';
import 'package:flutter_base_by_minhnv/ui/main/home.dart';
import 'package:flutter_base_by_minhnv/ui/main/view_person/view_person.dart';
import 'package:flutter_base_by_minhnv/ui/onborading/onborading.dart';
import 'package:flutter_base_by_minhnv/ui/splash/splash.dart';
import 'package:flutter_base_by_minhnv/ui/template/login.dart';
import 'package:flutter_base_by_minhnv/utils/constant/constant.dart';
import 'package:flutter_base_by_minhnv/utils/localize/AppLocalization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        AppConstant.onBoardingScreen: (BuildContext context) =>
            new OnBoardingScreen(),
        AppConstant.loginScreen: (BuildContext context) => new LoginScreen(),
        AppConstant.homeScreen: (BuildContext context) => HomeScreen(),
        AppConstant.addPerson: (BuildContext context) => AddPerson(),
        AppConstant.viewPerson: (BuildContext context) => ViewPerson(),

      },
      supportedLocales: [Locale("vi", "VN"), Locale("en", "US")],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == (locale!.languageCode) &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
