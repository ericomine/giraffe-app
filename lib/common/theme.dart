import 'package:flutter/material.dart';

final giraffeTextTheme = TextTheme(
  headline5: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
  headline6: TextStyle(fontSize: 18),
  bodyText2: TextStyle(fontSize: 14),
);

final giraffeTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Color.fromARGB(0xFF, 0xFF, 0xA7, 0x37),
    accentColor: Color.fromARGB(0xFF, 0xFF, 0xCB, 0x37),
    backgroundColor: Colors.white30,
    fontFamily: "Inter Sans",
    textTheme: giraffeTextTheme);
