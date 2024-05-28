class SubContractorOrder {
  int? detailsID;
  double? amount;

  SubContractorOrder(
    this.detailsID,
    this.amount,
  );

  factory SubContractorOrder.fromJson(json) {
    return SubContractorOrder(
      json['detailsID'],
      json['amount'],
    );
  }


}
