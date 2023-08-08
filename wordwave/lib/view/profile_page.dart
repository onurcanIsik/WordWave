import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordwave/color/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  dynamic skor;
  @override
  void initState() {
    super.initState();
    final scoreBox = Hive.box('score_box');
    skor = scoreBox.get('skor');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: GoogleFonts.balooDa2(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          if (skor != null)
            Card(
              child: ListTile(
                title: Text(
                  'En Yüksek Skorun',
                  style: GoogleFonts.balooDa2(fontSize: 22),
                ),
                trailing: Text(
                  '$skor',
                  style: GoogleFonts.balooDa2(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
