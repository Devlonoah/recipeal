import 'package:recipeal/domain/entities/temperature_entity.dart';

class TemperatureModel extends TemperatureEntity {
  double? number;
  String? unit;

  TemperatureModel({this.number, this.unit})
      : super(
          number: number,
          unit: unit,
        );

  TemperatureModel.fromJson(Map<String, dynamic> json) {
    number = json['number']?.toDouble() ?? 0.0;
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = this.number;
    data['unit'] = this.unit;
    return data;
  }
}
