// ignore_for_file: prefer_const_constructors, unused_import, avoid_unnecessary_containers, deprecated_member_use, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sistem_akademik/UI/dashboard.dart';
import 'package:sistem_akademik/UI/splash.dart';

import 'UI/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Poppins-Black'),
      home: Dashboard(),
    );
  }
}
