class OtherCostBody {
  int? processID;

  double? amount;
  String? description;

  OtherCostBody(
    this.processID,
    this.amount,
    this.description,
  );

  factory OtherCostBody.fromJson(json) {
    return OtherCostBody(
      json['processID'],
      json['amount'],
      json['description'],
    );
  }

  toJson() {
    Map<String, dynamic> map = {
      "processID": processID,
      "amount": amount,
      "description": description,
    };

    return map;
  }
}
