import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wordwave/view/homepage.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      loaderColor: HexColor('4A55A2'),
      logo: Image.asset('assets/images/wordwave.png'),
      loadingText: Text(
        'Version 1.0.0',
        style: GoogleFonts.balooDa2(),
      ),
      durationInSeconds: 4,
      navigator: const HomePage(),
    );
  }
}
