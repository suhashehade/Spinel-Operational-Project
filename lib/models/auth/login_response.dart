import 'package:get/get.dart';

class LoginResponse implements Translations {
  String? token;
  String? nameEn;
  String? userName;
  int? securityGroupID;
  bool? status;
  int? entityId;
  List? lstError;
  List? lstWarnings;

  LoginResponse(
    this.token,
    this.nameEn,
    this.userName,
    this.securityGroupID,
    this.status,
    this.entityId,
    this.lstError,
    this.lstWarnings,
  );

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
      json['token'],
      json['nameEn'],
      json['userName'],
      json['securityGroupID'],
      json['status'],
      json['entityId'],
      json['lstError'],
      json['lstWarnings'],
    );
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'name': nameEn!,
        },
        'ar': {
          'name': nameEn!,
        },
      };
}
