import 'package:flutter/material.dart';

const Color blueLight = Color(0xFF0066DA);
const Color whiteDark = Color(0xFFDCDCDC);
const Color whiteLight = Color(0xFFF0F0F0);
const Color blackDark = Color(0xFF141414);
const Color blackLight = Color(0xFF1F1F1F);

const String productSans = 'Product Sans';

const TextStyle bodyText12 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
  fontFamily: productSans,
);

const TextStyle bodyText16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  fontFamily: productSans,
);

const TextStyle bodyText18 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.normal,
  fontFamily: productSans,
);

const TextStyle buttonText20 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: productSans,
);

TextStyle headlineText24(Color color) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: productSans,
    color: color,
  );
}

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: productSans,
    colorScheme: const ColorScheme.light(
      primary: blueLight,
      onPrimary: whiteDark,
      secondary: blueLight,
      onSecondary: blackDark,
      surface: whiteDark,
      onSurface: blackDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteDark,
      foregroundColor: blackDark,
    ),
    textTheme: TextTheme(
      bodySmall: bodyText12.copyWith(color: blackDark),
      bodyMedium: bodyText16.copyWith(color: blackDark),
      bodyLarge: bodyText18.copyWith(color: blackDark),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: blueLight,
        textStyle: buttonText20,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blueLight,
        foregroundColor: whiteDark,
        textStyle: buttonText20.copyWith(fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: blueLight,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        side: const BorderSide(color: blueLight),
        textStyle: buttonText20.copyWith(fontFamily: productSans),
      ),
    ),
    cardTheme: const CardTheme(
      color: whiteLight,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: productSans,
    colorScheme: const ColorScheme.dark(
      primary: blueLight,
      onPrimary: whiteDark,
      secondary: blueLight,
      onSecondary: blackLight,
      surface: blackLight,
      onSurface: whiteDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: blackLight,
      foregroundColor: whiteDark,
    ),
    textTheme: TextTheme(
      bodySmall: bodyText12.copyWith(color: whiteDark),
      bodyMedium: bodyText16.copyWith(color: whiteDark),
      bodyLarge: bodyText18.copyWith(color: whiteDark),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: blueLight,
        textStyle: buttonText20,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blueLight,
        foregroundColor: whiteDark,
        textStyle: buttonText20.copyWith(fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: whiteDark,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        side: const BorderSide(color: whiteDark),
        textStyle: buttonText20.copyWith(fontFamily: productSans),
      ),
    ),
    cardTheme: const CardTheme(
      color: blackDark,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
  );
}
