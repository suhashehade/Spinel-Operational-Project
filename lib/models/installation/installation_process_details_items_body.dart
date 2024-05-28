import 'package:operations/models/installation/installation_process_details_item.dart';

class InstallationProcessDetailsItemsBody {
  int processID;
  List<InstallationProcessDetailsItem> operationInstallationProcessChecklist;

  InstallationProcessDetailsItemsBody(
    this.processID,
    this.operationInstallationProcessChecklist,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'processID': processID,
      'operationInstallationProcessChecklist':
          operationInstallationProcessChecklist.map((i) => i.toJson()).toList(),
    };
    return map;
  }
}
