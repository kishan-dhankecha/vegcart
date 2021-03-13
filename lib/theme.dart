import 'constants.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorDarkTheme,
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: kContentColorDarkTheme,
          iconTheme: IconThemeData(color: kContentColorLightTheme),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kContentColorLightTheme,
              ),
        ),
    iconTheme: IconThemeData(color: kContentColorLightTheme),
    textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'ConcertOne',
          bodyColor: kContentColorLightTheme,
        ),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
    ),
    cardColor: kContentColorDarkTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: kContentColorLightTheme,
          iconTheme: IconThemeData(color: kContentColorDarkTheme),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kContentColorDarkTheme,
              ),
        ),
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'ConcertOne',
          bodyColor: kContentColorDarkTheme,
        ),
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
    ),
    cardColor: Color(0xFF00112b),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}
