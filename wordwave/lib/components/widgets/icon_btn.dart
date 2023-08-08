// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class IconBtn extends StatefulWidget {
  Function? isClicked;
  IconBtn({super.key, required this.isClicked});

  @override
  State<IconBtn> createState() => _IconBtnState();
}

class _IconBtnState extends State<IconBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: IconButton(
        onPressed: () {
          widget.isClicked!();
        },
        icon: Icon(
          Icons.send,
          color: HexColor('6528F7'),
        ),
      ),
    );
  }
}
