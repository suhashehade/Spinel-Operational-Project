import 'package:get/get.dart';
import 'package:operations/models/level/level.dart';

class Order extends Translations {
  String customerNameAr;
  String customerNameEn;
  String date;
  bool status;
  double percent;
  List<Level> levels;

  Order(
    this.customerNameAr,
    this.customerNameEn,
    this.date,
    this.status,
    this.percent,
    this.levels,
  );

  // factory Order.fromjson(json) {
  //   return Order(
  //     json['customerNameAr'].toString(),
  //     json['customerNameEn'].toString(),
  //     json['date'].toString(),
  //     json['status'] as bool,
  //     json['percent'] as double,

  //   );
  // }

  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {'cusomerName': customerNameAr},
        'en': {'cusomerName': customerNameEn}
      };
}
