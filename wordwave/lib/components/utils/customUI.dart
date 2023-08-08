// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../color/colors.dart';
import '../../view/homepage.dart';

class CustomUI {
  final scoreBox = Hive.box('score_box');
  void customShowDialog(BuildContext context, int score) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            title: const Center(
              child: Text('Kaybettin'),
            ),
            actions: [
              Column(
                children: [
                  Center(
                    child: Text(
                      'Skorun: $score',
                      style: GoogleFonts.balooDa2(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bgColor,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Tekrar Oyna',
                          style: GoogleFonts.comfortaa(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bgColor,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                        ),
                        onPressed: () {
                          scoreBox
                              .put('skor', score)
                              .whenComplete(
                                () => Fluttertoast.showToast(
                                  msg: 'Kaydedildi',
                                  timeInSecForIosWeb: 3,
                                ),
                              )
                              .then(
                                (value) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                  (route) => false,
                                ),
                              );
                        },
                        child: Text(
                          'Kaydet',
                          style: GoogleFonts.comfortaa(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          );
        });
  }
}

class customListTile extends StatelessWidget {
  String txt;

  customListTile({
    required this.txt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(
          txt,
          style: GoogleFonts.balooDa2(
            fontWeight: FontWeight.bold,
            color: bgColor,
          ),
        ),
      ),
    );
  }
}
