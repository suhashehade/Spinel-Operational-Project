class OtherCost {
  int? detailsID;
  double? amount;
  String? description;
  String? note;

  OtherCost(this.detailsID, this.amount, this.description, this.note);

  factory OtherCost.fromJson(json) {
    return OtherCost(
      json['detailsID'],
      json['amount'],
      json['description'],
      json['note'],
    );
  }
}
