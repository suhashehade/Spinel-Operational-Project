import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/locale/locale.dart';
import 'package:operations/locale/locale_controller.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PrefsService prefsService = Get.put(PrefsService());
  await prefsService.init();
  LocaleController localeController = Get.put(LocaleController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    translations: MyLocale(),
    locale: localeController.initialLang,
    theme: ThemeData(
      useMaterial3: true,
    ),
    getPages: Routes.routes,
  ));
}
