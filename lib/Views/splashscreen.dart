// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../Views/home.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          PageTransition(child: const Home(), type: PageTransitionType.fade));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            child: Image.asset(
              "assets/bak.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: LottieBuilder.asset("assets/splash.json"),
          ),
        ],
      ),
    );
  }
}
