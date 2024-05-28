import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:operations/screens/dashboard/bindings/dashboard_screen_bindings.dart';
import 'package:operations/screens/dashboard/views/dashboard_view.dart';
import 'package:operations/screens/installation/bindings/installation_screen_bindings.dart';
import 'package:operations/screens/installation/views/installation_view.dart';
import 'package:operations/screens/login/bindings/login_screen_bindings.dart';
import 'package:operations/screens/login/middleware/login_screen_middleware.dart';
import 'package:operations/screens/login/views/login_view.dart';
import 'package:operations/screens/installation_details/bindings/installation_details_screen_bindings.dart';
import 'package:operations/screens/installation_details/views/installation_details_view.dart';
import 'package:operations/screens/operating/bindings/operating_screen_bindings.dart';
import 'package:operations/screens/operating/views/operating_view.dart';
import 'package:operations/screens/operating_details/bindings/operating_details_screen_bindings.dart';
import 'package:operations/screens/operating_details/views/operating_details_view.dart';
import 'package:operations/screens/registration/bindings/registration_screen_binding.dart';
import 'package:operations/screens/registration/views/registration_view.dart';
import 'package:operations/screens/splash/bindings/splash_screen_bindings.dart';
import 'package:operations/screens/splash/views/splash_view.dart';

class Routes {
  static String splashScreen = '/';
  static String loginScreen = '/login';
  static String registrationScreen = '/registration';
  static String dashboard = '/dashboard';
  static String mainScreen = '/main';
  static String installationDetailsScreen = '/installationDetailsScreen';
  static String levelDetailsScreen = '/levelDetailsScreen';
  static String levelsScreen = '/levelsScreen';
  static String installationScreen = '/installationScreen';
  static String operatingScreen = '/operatingScreen';
  static String operatingDetailsScreen = '/operatingDetailsScreen';

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBindings(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      transition: Transition.downToUp,
      curve: Curves.elasticOut,
      transitionDuration: const Duration(milliseconds: 200),
      binding: LoginControllerBindings(),
      middlewares: [LoginScreenMiddleWare()],
    ),
    GetPage(
      name: registrationScreen,
      page: () => RegistrationScreen(),
      transition: Transition.downToUp,
      curve: Curves.elasticOut,
      transitionDuration: const Duration(milliseconds: 200),
      binding: RegistrationControllerBindings(),
    ),
    GetPage(
      name: dashboard,
      page: () => DashboardScreen(),
      binding: DashboardControllerBindings(),
    ),
    GetPage(
      name: installationScreen,
      page: () => InstallationScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 150),
      binding: InstallationControllerBindings(),
    ),
    // GetPage(
    //   name: levelDetailsScreen,
    //   page: () => LevelDetailsScreen(),
    //   transition: Transition.rightToLeft,
    //   curve: Curves.easeInOut,
    //   transitionDuration: const Duration(milliseconds: 150),
    //   binding: LevelDetailsControllerBindings(),
    // ),
    GetPage(
      name: installationDetailsScreen,
      page: () => InstallationDetailsScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 150),
      binding: InstallationDetailsControllerBindings(),
    ),
    GetPage(
      name: operatingScreen,
      page: () => OperatingScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 150),
      binding: OperatingControllerBindings(),
    ),
    GetPage(
      name: operatingDetailsScreen,
      page: () => OperatingDetailsScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 150),
      binding: OperatingDetailsControllerBindings(),
    ),
  ];
}
