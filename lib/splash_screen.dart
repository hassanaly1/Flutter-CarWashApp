import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_carwash/utilities/constants.dart';
import 'package:flutter_carwash/view/auth/phone_loginscreen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Get.to(PhoneLoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      body: Center(
        child: Image(
          width: 140,
          height: 180,
          image: AssetImage("assets/images/applogo.png"),
        ),
      ),
    );
  }
}
