import 'metric_model.dart';
import 'us_model.dart';

class MeasuresModel {
  MeasuresModel({
    required this.metric,
    required this.us,
  });
  late final MetricModel metric;
  late final UsModel us;

  MeasuresModel.fromJson(Map<String, dynamic> json) {
    metric = MetricModel.fromJson(json['metric']);
    us = UsModel.fromJson(json['us']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['metric'] = metric.toJson();
    _data['us'] = us.toJson();
    return _data;
  }
}
