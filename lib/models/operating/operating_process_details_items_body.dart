import 'package:operations/models/operating/operating_process_details_item.dart';

class OperatingProcessDetailsItemsBody {
  int processID;
  List<OperatingProcessDetailsItem> operationOperatingProcessChecklist;

  OperatingProcessDetailsItemsBody(
    this.processID,
    this.operationOperatingProcessChecklist,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'processID': processID,
      'operationOperatingProcessChecklist':
          operationOperatingProcessChecklist.map((i) => i.toJson()).toList(),
    };
    return map;
  }
}
