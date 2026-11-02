import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/main_page.dart';

class KantinApp extends StatelessWidget {
  const KantinApp({super.key});

  static const Color green = Color(0xFF285B46);
  static const Color cream = Color(0xFFFAF8F1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantin Kita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: green,
          primary: green,
          surface: cream,
        ),
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: cream,
          foregroundColor: const Color(0xFF202820),
          titleTextStyle: GoogleFonts.plusJakartaSans(
            color: const Color(0xFF202820),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}
