// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ListData extends StatefulWidget {
  List<Widget> childrenWidget;
  double height;
  double width;
  ListData({
    super.key,
    required this.childrenWidget,
    required this.height,
    required this.width,
  });

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: HexColor('6528F7'),
          ),
        ),
        height: widget.height,
        width: widget.width,
        child: ListView(children: widget.childrenWidget),
      ),
    );
  }
}
