// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TxtFormWidget extends StatefulWidget {
  TextEditingController txtController;
  TxtFormWidget({super.key, required this.txtController});

  @override
  State<TxtFormWidget> createState() => _TxtFormWidgetState();
}

class _TxtFormWidgetState extends State<TxtFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: TextFormField(
          controller: widget.txtController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Boş Bırakılamaz';
            }
            return null;
          },
          textAlign: TextAlign.center,
          cursorColor: HexColor('4A55A2'),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              borderSide: BorderSide(
                color: HexColor('4A55A2'),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: HexColor('7895CB'),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: HexColor('7895CB'),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
