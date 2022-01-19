import 'package:recipeal/domain/entities/us_entity.dart';

class UsModel extends UsEntity {
  UsModel({
    required this.amount,
    required this.unitLong,
    required this.unitShort,
  }) : super(amount: amount, unitLong: unitLong, unitShort: unitShort);
  late final double? amount;
  late final String unitLong;
  late final String unitShort;

  UsModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount']?.toDouble() ?? 0.0;
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['unitLong'] = unitLong;
    _data['unitShort'] = unitShort;
    return _data;
  }
}
