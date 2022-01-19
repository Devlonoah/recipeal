import 'package:recipeal/domain/entities/measures_entity.dart';

import 'metric_model.dart';
import 'us_model.dart';

class MeasuresModel extends MeasuresEntity {
  MeasuresModel({
    required this.metric,
    required this.us,
  }) : super(metric: metric, us: us);
  final MetricModel metric;
  final UsModel us;

  factory MeasuresModel.fromJson(Map<String, dynamic> json) {
    return MeasuresModel(
        metric: MetricModel.fromJson(
          json['metric'],
        ),
        us: UsModel.fromJson(json['us']));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['metric'] = metric.toJson();
    _data['us'] = us.toJson();
    return _data;
  }
}
