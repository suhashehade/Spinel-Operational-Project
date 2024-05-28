class SubContractorOrderDetails {
  int? detailsID;
  String? description;
  double? amount;
  String? note;

  SubContractorOrderDetails(
    this.detailsID,
    this.description,
    this.amount,
    this.note,
  );
  factory SubContractorOrderDetails.fromJson(json) {
    return SubContractorOrderDetails(
      json['detailsID'],
      json['description'],
      json['amount'],
      json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "detailsID": detailsID,
      "description": description,
      "amount": amount,
      "note": note,
    };
    return map;
  }
}
