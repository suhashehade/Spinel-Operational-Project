import 'package:get/get.dart';

class Installation extends Translations {
  int? id;
  String? clientNameID;
  String? clientName;
  int? cityID;
  String? cityName;
  String? buildingName;
  String? fullAddress;
  String? requestDate;
  String? buildingFloor;
  RxDouble? totalProgress;
  String? mobile;
  int? governateID;
  String? governateName;
  RxBool isOpened;

  Installation(
    this.id,
    this.clientNameID,
    this.clientName,
    this.cityID,
    this.cityName,
    this.buildingName,
    this.fullAddress,
    this.requestDate,
    this.buildingFloor,
    double? totalProgress,
    this.mobile,
    this.governateID,
    this.governateName,
  )   : isOpened = false.obs,
        totalProgress = (totalProgress ?? 0.0).obs;

  factory Installation.fromJson(json) {
    return Installation(
      json['id'],
      json['clientNameID'],
      json['clientName'],
      json['cityID'],
      json['cityName'],
      json['buildingName'],
      json['fullAddress'],
      json['requestDate'],
      json['buildingFloor'],
      json['totalProgress'],
      json['mobile'],
      json['governateID'],
      json['governateName'],
    );
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {'clientName': clientName!},
        'en': {'clientName': clientName!}
      };
}
