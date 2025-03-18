import 'package:flutter/material.dart';

import '../constants.dart';

class AppTheme{

  static final ThemeData lightTheme = ThemeData(

    primaryColor: MyColors.lightprimary,
    colorScheme: ColorScheme.fromSeed(
        seedColor:  MyColors.lightprimary,
         primary:  MyColors.lightprimary,
      onPrimary: Colors.white

    ),
    scaffoldBackgroundColor: Color(0xffF4F7FC),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 32,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 32,
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: Colors.black
      ),
      headlineMedium: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Colors.black38
      ),
      bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black
      ),
      bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black87
      ),
      bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black38
      ),labelMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: MyColors.lightprimary
    )
    ),
    useMaterial3: false,
    cardTheme: const CardTheme(
      color: Colors.white
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: Colors.blueAccent,
      showSelectedLabels: true,
      selectedIconTheme: IconThemeData(
        size: 32
      ),
      unselectedIconTheme: IconThemeData(
        size: 25
      )




    )
  );




}