import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/logos/spinel_light_logo_widget.dart';
import 'package:operations/screens/splash/controller/splash_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'dart:math' as math;

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.toLoginScreen();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                transform: GradientRotation(math.pi / 4),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0.02,
              0.14,
              0.25,
              0.37,
              0.67,
              0.90,
              1.0,
            ],
                colors: [
              CustomColors.tuna,
              CustomColors.gravel,
              CustomColors.liver,
              CustomColors.darkTaupe,
              CustomColors.lion,
              CustomColors.lightTan,
              CustomColors.lightTan,
            ])),
        child: const Center(
          child: SpinelLogoWidget(),
        ),
      ),
    );
  }
}
