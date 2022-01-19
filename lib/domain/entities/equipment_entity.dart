import 'package:recipeal/domain/entities/temperature_entity.dart';

class EquipmentEntity {
  final int? id;
  final String? name;
  final String? localizedName;
  final String? image;
  final TemperatureEntity? temperature;

  EquipmentEntity({
    this.id,
    this.name,
    this.localizedName,
    this.image,
    this.temperature,
  });
}
