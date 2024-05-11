import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:operations/screens/level_details_screen/bindings/level_details_screen_bindings.dart';
import 'package:operations/screens/level_details_screen/views/levels_details_screen.dart';
import 'package:operations/screens/login_screen/bindings/login_screen_bindings.dart';
import 'package:operations/screens/login_screen/views/login_screen.dart';
import 'package:operations/screens/main_screen/bindings/main_screen_binding.dart';
import 'package:operations/screens/main_screen/views/main_screen.dart';
import 'package:operations/screens/order_details_screen/bindings/order_details_screen_bindings.dart';
import 'package:operations/screens/order_details_screen/views/order_details_screen.dart';
import 'package:operations/screens/registration_screen/bindings/registration_screen_binding.dart';
import 'package:operations/screens/registration_screen/views/registration_screen.dart';
import 'package:operations/screens/splash_screen/bindings/splash_screen_bindings.dart';
import 'package:operations/screens/splash_screen/views/splash_screen.dart';

class Routes {
  static String splashScreen = '/';
  static String loginScreen = '/login';
  static String registrationScreen = '/registration';
  static String mainScreen = '/main';
  static String orderDetailsScreen = '/orderDetailsScreen';
  static String levelDetailsScreen = '/levelDetailsScreen';
  static String levelsScreen = '/levelsScreen';

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBindings(),
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.downToUp,
      curve: Curves.elasticOut,
      transitionDuration: const Duration(seconds: 2),
      binding: LoginControllerBindings(),
    ),
    GetPage(
      name: registrationScreen,
      page: () => const RegistrationScreen(),
      // transition: Transition.downToUp,
      // curve: Curves.elasticOut,
      // transitionDuration: const Duration(seconds: 2),
      binding: RegistrationControllerBindings(),
    ),
    GetPage(
      name: mainScreen,
      page: () => MainScreen(),
      binding: MainControllerBindings(),
    ),
    // GetPage(
    //   name: levelsScreen,
    //   page: () => LevelsScreen(),
    //   transition: Transition.rightToLeft,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 800),
    //   binding: LevelsControllerBindings(),
    // ),
    GetPage(
      name: levelDetailsScreen,
      page: () => LevelDetailsScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 800),
      binding: LevelDetailsControllerBindings(),
    ),
    GetPage(
      name: orderDetailsScreen,
      page: () => OrderDetailsScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 800),
      binding: OrderDetailsControllerBindings(),
    ),
  ];
}
