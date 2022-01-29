import 'package:flutter/material.dart';
import 'package:my_town/constants/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    // primaryColor: kSecondaryColor,
    fontFamily: "CircularStd",
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kDarkColor),
    bodyText2: TextStyle(color: kDarkColor),
  );
}
