import 'package:flutter/material.dart';
import 'package:student_sphere/screens/first_page.dart';
import 'package:student_sphere/screens/getting_started.dart';
import 'package:student_sphere/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfff37979),
        ),
      ),
      initialRoute: "splash",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const GettingStarted(),
        'firstPage': (context) => const FirstPage(),
        'splash': (context) => const SplashScreen(),
      },
    ),
  );
}
