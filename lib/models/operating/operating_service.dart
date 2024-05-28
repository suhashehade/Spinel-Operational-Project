class OperatingService {
  int? detailsID;
  int? itemID;
  String? itemName;
  int? unitID;
  String? unitName;
  double? quantity;

  OperatingService(
    this.detailsID,
    this.itemID,
    this.itemName,
    this.unitID,
    this.unitName,
    this.quantity,
  );

  factory OperatingService.fromJson(json) {
    return OperatingService(
      json['detailsID'],
      json['itemID'],
      json['itemName'],
      json['unitID'],
      json['unitName'],
      json['quantity'],
    );
  }
}
