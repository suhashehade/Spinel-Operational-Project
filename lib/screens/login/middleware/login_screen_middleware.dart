import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/routes.dart';

class LoginScreenMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (PrefsService.to.getString(Consts.tokenKey) != null ||
        PrefsService.to.getString(Consts.clientTokenKey) != null) {
      return RouteSettings(name: Routes.dashboard);
    }

    return null;
  }
}
