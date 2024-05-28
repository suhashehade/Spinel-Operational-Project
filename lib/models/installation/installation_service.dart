class InstallationService {
  int? detailsID;
  int? itemID;
  String? itemName;
  int? unitID;
  String? unitName;
  double? quantity;

  InstallationService(
    this.detailsID,
    this.itemID,
    this.itemName,
    this.unitID,
    this.unitName,
    this.quantity,
  );

  factory InstallationService.fromJson(json) {
    return InstallationService(
      json['detailsID'],
      json['itemID'],
      json['itemName'],
      json['unitID'],
      json['unitName'],
      json['quantity'],
    );
  }
}
