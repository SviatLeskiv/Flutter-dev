// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:v_temi/widgets/auth/auth_widget.dart';
import 'package:v_temi/widgets/pages/my_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
    '/auth': (context) => const AuthMenu(),
    '/myPage': (context) => MainWidget(),
     },
     initialRoute: '/auth',
      );
  }
} 