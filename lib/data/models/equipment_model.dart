import 'package:recipeal/data/models/temperature_model.dart';
import 'package:recipeal/domain/entities/equipment_entity.dart';

class EquipmentModel extends EquipmentEntity {
  int? id;
  String? name;
  String? localizedName;
  String? image;
  TemperatureModel? temperature;

  EquipmentModel(
      {this.id, this.name, this.localizedName, this.image, this.temperature})
      : super(
          id: id,
          name: name,
          localizedName: localizedName,
          image: image,
        );

  factory EquipmentModel.fromJson(Map<String, dynamic> json) {
    return EquipmentModel(
      id: json['id'],
      name: json['name'],
      localizedName: json['localizedName'],
      image: json['image'],
      temperature: json['temperature'] != null
          ? TemperatureModel.fromJson(json['temperature'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['localizedName'] = this.localizedName;
    data['image'] = this.image;
    if (this.temperature != null) {
      data['temperature'] = this.temperature!.toJson();
    }
    return data;
  }
}
