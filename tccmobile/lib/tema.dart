import 'package:flutter/material.dart';
import 'package:tccmobile/main.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Cores.azul,
    primary: Cores.azulFundo,
    primaryContainer: Cores.blue,
    secondary: Cores.brancoAzul,
    secondaryContainer: Color.fromARGB(255, 39, 55, 77),
    tertiary: Cores.azulFundo2,
    tertiaryContainer: Cores.cinza,
    outlineVariant: Cores.vermelho
    
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 39, 55, 77),
    primary: Cores.azul,
    primaryContainer: Color.fromARGB(255, 54, 153, 231),
    secondary: Color.fromARGB(255, 39, 55, 77),
    secondaryContainer: Cores.azul,
    tertiary: Color.fromARGB(255, 39, 55, 77),
    tertiaryContainer: Color.fromARGB(255, 175, 175, 175),
    outlineVariant: Color.fromARGB(255, 233, 69, 96)
  )
);