class Client {
  String? clientNameID;
  String? clientName;

  Client(
    this.clientNameID,
    this.clientName,
  );

  factory Client.fromJson(json) {
    return Client(
      json['clientNameID'],
      json['clientName'],
    );
  }
}
