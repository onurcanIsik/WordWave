// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wordwave/color/colors.dart';

import '../service/provider/dark_mode.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final scoreBox = Hive.box('score_box');
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<DarkThemeProvider>(context).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'Ayarlar',
          style: GoogleFonts.balooDa2(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            color: HexColor('#004866'),
            child: ListTile(
              title: Text(
                'Dark Mode',
                style: GoogleFonts.balooDa2(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              trailing: Switch(
                activeColor: Colors.green,
                onChanged: (value) {
                  Provider.of<DarkThemeProvider>(context, listen: false)
                      .toggleDarkMode();
                },
                value: isDarkMode,
              ),
            ),
          ),
          Card(
            color: HexColor('#004866'),
            child: ListTile(
              title: Text(
                'Delete Best Score',
                style: GoogleFonts.balooDa2(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  setState(() {
                    scoreBox.clear().whenComplete(
                          () => Fluttertoast.showToast(
                            msg: 'Done',
                            timeInSecForIosWeb: 3,
                          ),
                        );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
