class Level {
  String name;
  String description;
  String startDate;
  String endDate;
  String admin;
  String notes;
  String customerName;
  String secondaryPartner;
  String comments;
  String details;
  bool intergration;
  double percent;

  Level(
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.admin,
    this.notes,
    this.customerName,
    this.secondaryPartner,
    this.comments,
    this.details,
    this.intergration,
    this.percent,
  );

  // factory Level.fromJson(json){
  //   return Level(json['description'], json['startDate'], json['endDate'], json['admin'], notes, customerName, secondaryPartner, comments, details, intergration)
  // }
}
