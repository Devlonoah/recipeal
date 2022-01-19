import 'package:recipeal/domain/entities/ingredient_entity.dart';

class IngredientsModel extends IngredientsEntity {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  IngredientsModel({this.id, this.name, this.localizedName, this.image})
      : super(
          id: id,
          name: name,
          localizedName: localizedName,
          image: image,
        );

  factory IngredientsModel.fromJson(Map<String, dynamic> json) {
    return IngredientsModel(
      id: json['id'],
      name: json['name'],
      localizedName: json['localizedName'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['localizedName'] = this.localizedName;
    data['image'] = this.image;
    return data;
  }
}
