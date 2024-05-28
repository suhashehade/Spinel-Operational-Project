import 'package:get/get_rx/src/rx_types/rx_types.dart';

class OperatingClientProcess {
  int? detailsID;
  int? processID;
  String? processName;
  String? startDateTime;
  String? endDateTime;
  int? supervisorID;
  String? supervisorNameEn;
  String? supervisorNameAr;
  String? description;
  RxDouble? progress;
  RxBool isOpened;

  OperatingClientProcess(
    this.detailsID,
    this.processID,
    this.processName,
    this.startDateTime,
    this.endDateTime,
    this.supervisorID,
    this.supervisorNameEn,
    this.supervisorNameAr,
    this.description,
    double? progress,
  )   : isOpened = false.obs,
        progress = (progress ?? 0.0).obs;

  factory OperatingClientProcess.fromJson(json) {
    return OperatingClientProcess(
      json['detailsID'],
      json['processID'],
      json['processName'],
      json['startDateTime'],
      json['endDateTime'],
      json['supervisorID'],
      json['supervisorNameEn'],
      json['supervisorNameAr'],
      json['description'],
      json['progress'],
    );
  }
}
