import 'package:operations/models/installation/installation_process_details_item.dart';

class OperatingClientProcessDetailsBody {
  int clientProcessID;
  List<InstallationProcessDetailsItem> operationInstallationProcessChecklist;

  OperatingClientProcessDetailsBody(
    this.clientProcessID,
    this.operationInstallationProcessChecklist,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'clientProcessID': clientProcessID,
      'operationInstallationClientProcessChecklist':
          operationInstallationProcessChecklist.map((i) => i.toJson()).toList(),
    };
    return map;
  }
}
