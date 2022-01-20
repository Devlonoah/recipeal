import '../../domain/entities/metric_entity.dart';

class MetricModel extends MetricEntity {
  MetricModel({
    required this.amount,
    required this.unitLong,
    required this.unitShort,
  }) : super(
          amount: amount,
          unitLong: unitLong,
          unitShort: unitShort,
        );
  late final double? amount;
  late final String unitLong;
  late final String unitShort;

  MetricModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
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
