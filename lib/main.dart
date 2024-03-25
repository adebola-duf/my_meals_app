import 'package:flutter/material.dart';
import 'package:my_meals_app/screens/tab_screen.dart';

import 'package:google_fonts/google_fonts.dart';

final kTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(
     MaterialApp(
      theme: kTheme,
      home: const TabScreen(),
    ),
  );
}
