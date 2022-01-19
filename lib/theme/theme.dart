import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = TextTheme(
  headline1: GoogleFonts.rambla(
      fontSize: 102,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: Colors.black),
  headline2: GoogleFonts.rambla(
      fontSize: 64,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: Colors.black),
  headline3: GoogleFonts.rambla(
      fontSize: 51, fontWeight: FontWeight.w400, color: Colors.black),
  headline4: GoogleFonts.rambla(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.black),
  headline5: GoogleFonts.rambla(
      fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
  headline6: GoogleFonts.rambla(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.black),
  subtitle1: GoogleFonts.rambla(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: Colors.black),
  subtitle2: GoogleFonts.rambla(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.black),
  bodyText1: GoogleFonts.rambla(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Colors.black),
  bodyText2: GoogleFonts.rambla(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.black),
  button: GoogleFonts.rambla(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: Colors.black),
  caption: GoogleFonts.rambla(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: Colors.black),
  overline: GoogleFonts.rambla(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: Colors.black),
);

final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.black,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white, foregroundColor: Colors.black),
    textTheme: textTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.pink,
    ));
final darkTheme = ThemeData.dark();
