class Lookups {
  int value;
  String labelEn;
  String labelAr;

  Lookups(this.value, this.labelEn, this.labelAr);
  factory Lookups.fromJson(json) {
    return Lookups(
      json['value'],
      json['labelEn'],
      json['labelAr'],
    );
  }
}
