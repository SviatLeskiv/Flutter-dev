// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class MyImages {
  static const logo_main = 'images/logo_main.png';
  static const logo = 'images/logo.png';
  static const avatar = 'images/avatar.png';
  static const mainAvatar = 'images/main_avatar.jpeg';
}

abstract class MyFonts {
  static const onBlack = TextStyle(color: Colors.orange, fontSize: 16);
}

abstract class MyButtons {
   static final fillOrange = ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50)),
      backgroundColor: MaterialStateProperty.all(Colors.orange),
      foregroundColor: MaterialStateProperty.all(Colors.black),
    );
}

abstract class MyTextField {
  static  InputDecoration textFieldDecor(final String VariableCheck) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
      hintStyle: TextStyle(color: Colors.orange[700]),
      hintText: VariableCheck,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}