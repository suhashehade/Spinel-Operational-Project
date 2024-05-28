import "dart:convert";

import "package:get/get.dart";
import "package:http/http.dart" as http;
import "package:operations/models/auth/login_response.dart";
import "package:operations/screens/login/controller/login_screen_controller.dart";
import "package:operations/services/shared_preferences_service.dart";
import "package:operations/utils/consts.dart";
import "package:operations/utils/routes.dart";
import "package:operations/utils/urls.dart";

class AuthAPI {
  static Future login(
      String username, String password, String loginType) async {
    LoginScreenController loginScreenController = Get.find();

    http.Response response;
    if (loginType == 'Client') {
      response = await http.get(Uri.parse(
          '${Urls.clientLoginUrl}?UserName=$username&Password=$password'));
    } else {
      response = await http.get(
          Uri.parse('${Urls.loginUrl}?UserName=$username&Password=$password'));
    }
    LoginResponse loginResponse =
        LoginResponse.fromJson(json.decode(response.body));
    if (loginResponse.status!) {
      if (loginType == 'Client') {
        PrefsService.to.setString(Consts.clientTokenKey, loginResponse.token!);
        print('token from login as client api ${loginResponse.token}');
      } else {
        PrefsService.to.setString(Consts.tokenKey, loginResponse.token!);
        print('token from login as admin api ${loginResponse.token}');
      }
      Get.offNamed(Routes.dashboard);
    } else {
      loginScreenController.errorMessage.value = loginResponse.lstError![0];
    }
    PrefsService.to.setString(Consts.userKey, loginType);
  }
}
