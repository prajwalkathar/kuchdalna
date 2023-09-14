import 'package:flutter/material.dart';

TextField textFieldFunc(String text, Color color, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: color,
      style: TextStyle(color: color),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(icon, color: Color.fromARGB(97, 79, 8, 8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 4, 96, 165),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: color,
          ),
        ),
      ));
}
