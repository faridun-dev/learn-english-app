import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: "Sans Pro 3",
  scaffoldBackgroundColor: const Color(0xFFE6E6E6),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF205493),
    secondary: const Color(0xFFE6E6E6),
    surface: Colors.white,
    secondaryContainer: Colors.white70,
    shadow: const Color(0xFF808080).withOpacity(0.5),
    secondaryFixed: Colors.grey.shade700,
    tertiary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  fontFamily: "Sans Pro 3",
  scaffoldBackgroundColor: const Color.fromARGB(154, 230, 230, 230),
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    secondary: const Color(0xFFE6E6E6),
    surface: Colors.black,
    secondaryContainer: Colors.black38,
    shadow: const Color(0xFF808080).withOpacity(0.5),
    secondaryFixed: Colors.grey.shade700,
    tertiary: Colors.white,
  ),
);
