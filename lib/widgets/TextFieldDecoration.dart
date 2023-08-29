import 'package:flutter/material.dart';

InputDecoration textFieldDecoration() {
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 4, 96, 165),
            width: 2,
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
          )));
}
