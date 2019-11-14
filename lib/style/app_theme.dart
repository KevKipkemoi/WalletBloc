import 'package:flutter/material.dart';

class AppTheme {
  static const darkBlue = Color(0xFF292787);
  static const blue = Color(0xFF3E3C93);
  static const tealAccent = Color(0xFF10EDC5);
  static const darkGreen = Color(0xFF1B5E20);
  static const pinkAccent = Color(0xFFED1946);
  static const brightPink = Color(0xFFFF4081);
  static const blueGrey = Color(0xFF9A9AAC);
  static const brightGreen = Color(0xFF00FF00);
  static const white = Colors.white;
  static const black = Colors.black;
  static const facebookColor = Color(0xFF3B5998);
  static const googleColor = Color(0xFFDB4437);
  static const transparent = Colors.transparent;
  static const lightBlue = Colors.lightBlue;
  static const red = Colors.red;
  static const soulRed = Color(0xFFA80112);
  static const fadedRed = Color(0xa0d66a69);

  static const _bgLeftColor = Color(0xFF330867);
  static const _bgRightColor = Color(0xFF30cfd0);

  static ThemeData appTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: MaterialColor(0xFF292787, <int, Color>{
      50: Color(0xff9493c3),
      100: Color(0xff7e7db7),
      200: Color(0xff6967ab),
      300: Color(0xff53529f),
      400: Color(0xff3e3c93),
      500: Color(0xff292787),
      600: Color(0xff242379),
      700: Color(0xff201f6c),
      800: Color(0xff1c1b5e),
      900: Color(0xff181751),
    }),
    primaryColor: white,
    primaryColorDark: Color(0xFF181751),
    accentColor: tealAccent,
    canvasColor: Colors.white,
    textTheme: TextTheme(
      display1: TextStyle(color: Colors.white),
      display2: TextStyle(color: Colors.white),
      display3: TextStyle(color: Colors.white),
      display4: TextStyle(color: Colors.white),
      headline: TextStyle(color: Colors.white),
      button: TextStyle(color: Colors.white),
      body1: TextStyle(color: Colors.white),
      body2: TextStyle(color: Colors.white),
      title: TextStyle(color: Colors.white),
      caption: TextStyle(color: Colors.white),
      subhead: TextStyle(color: Colors.white),
    ),
    primaryTextTheme: TextTheme(
      display1: TextStyle(color: blueGrey),
      display2: TextStyle(color: blueGrey),
      display3: TextStyle(color: blueGrey),
      display4: TextStyle(color: blueGrey),
      headline: TextStyle(color: blueGrey),
      button: TextStyle(color: blueGrey),
      body1: TextStyle(color: blueGrey),
      body2: TextStyle(color: blueGrey),
      title: TextStyle(color: blueGrey),
      caption: TextStyle(color: blueGrey),
      subhead: TextStyle(color: blueGrey),
    ),
    primaryIconTheme: IconThemeData(
      color: white,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder> {
          TargetPlatform.android : _MyWalletPageTransitionBuilder(),
          TargetPlatform.iOS : _MyWalletPageTransitionBuilder()
        }
    ),
  );
}