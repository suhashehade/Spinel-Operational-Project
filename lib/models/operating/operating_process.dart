import 'package:get/get.dart';

class OperatingProcess {
  int? detailsID;
  int? processID;
  String? processName;
  String? startDateTime;
  String? endDateTime;
  RxDouble? progress;
  double? totalOtherCost;
  int? ready;
  RxBool isOpened;

  OperatingProcess(
    this.detailsID,
    this.processID,
    this.processName,
    this.startDateTime,
    this.endDateTime,
    double? progress,
    this.totalOtherCost,
    this.ready,
  )   : isOpened = false.obs,
        progress = (progress ?? 0.0).obs;

  factory OperatingProcess.fromJson(json) {
    return OperatingProcess(
      json['detailsID'],
      json['processID'],
      json['processName'],
      json['startDateTime'],
      json['endDateTime'],
      json['progress'],
      json['totalOtherCost'],
      json['ready'],
    );
  }
}
