import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/ui/main/main.dart';
import 'package:flutter_base_by_minhnv/ui/on_broading/on_broading.dart';
import 'package:flutter_base_by_minhnv/ui/splash/splash.dart';
import 'package:flutter_base_by_minhnv/utils/localize/AppLocalization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/splash/splash.dart';
import 'utils/constant/constant.dart';

void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          onBoarding: (context) => OnBoarding(),
          mainScreen: (context) => MainScreen()
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
        /* light theme settings */
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          brightness: Brightness.light,
          accentColor: Colors.black,
          accentIconTheme: IconThemeData(color: Colors.white),
          dividerColor: Colors.white54,
          scaffoldBackgroundColor: Colors.white,
        ),

        /* Dark theme settings */
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          brightness: Brightness.dark,
          accentColor: Colors.white,
          accentIconTheme: IconThemeData(color: Colors.black),
          dividerColor: Colors.black12,
          scaffoldBackgroundColor: Color(0x341931),

        ),
        themeMode: ThemeMode.system,
        home: Splash(),
      ),
    );
  }
}
