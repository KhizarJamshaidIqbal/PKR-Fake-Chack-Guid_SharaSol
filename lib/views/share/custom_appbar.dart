// ignore_for_file: unused_element, prefer_const_constructors

import 'package:cruency_note_app/views/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("10 Rupee"),
      backgroundColor: const Color(0xff1C6758),
      leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }
}

//  