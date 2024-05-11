import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/logo_widget.dart';
import 'package:operations/screens/splash_screen/controller/splash_screen_controller.dart';
import 'package:operations/utils/colors.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.toLoginScreen();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              CustomColors.black,
              CustomColors.pacificBlue,
            ])),
        child: const Center(
          child: LogoWidget(),
        ),
      ),
    );
  }
}
