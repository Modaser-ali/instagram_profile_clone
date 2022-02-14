import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
  );
}
