import 'metric_entity.dart';
import 'us_entity.dart';

class MeasuresEntity {
  final MetricEntity metric;
  final UsEntity us;

  MeasuresEntity({
    required this.metric,
    required this.us,
  });
}
