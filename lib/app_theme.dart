import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        dividerColor: Colors.black54,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Color.fromARGB(255, 202, 186, 186)),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.amber,
            backgroundColor: Colors.grey,
            unselectedItemColor: Colors.white),
        inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey, width: 1))),
        popupMenuTheme: const PopupMenuThemeData(color: Colors.blueGrey)),

    //
    //

    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1))),
    ),
  };
}
