// ignore_for_file: prefer_const_constructors

// import 'package:cruency_note_app/views/Screens/homepage.dart';
import 'package:cruency_note_app/views/Screens/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pakistan Note Info',
      home: splashscreen(),
    );
  }
}
