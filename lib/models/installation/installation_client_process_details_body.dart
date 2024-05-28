import 'package:operations/models/installation/installation_process_details_item.dart';

class InstallationClientProcessDetailsBody {
  int clientProcessID;
  List<InstallationProcessDetailsItem> operationInstallationProcessChecklist;

  InstallationClientProcessDetailsBody(
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
