import 'measures_model.dart';

class ExtendedIngredientsModel {
  ExtendedIngredientsModel({
    required this.aisle,
    required this.amount,
    required this.consitency,
    required this.id,
    required this.image,
    required this.measures,
    required this.meta,
    required this.name,
    required this.original,
    required this.originalName,
    required this.unit,
  });
  late final String aisle;
  late final int? amount;
  late final String consitency;
  late final int id;
  late final String image;
  late final MeasuresModel measures;
  late final List<String> meta;
  late final String name;
  late final String original;
  late final String originalName;
  late final String unit;

  ExtendedIngredientsModel.fromJson(Map<String, dynamic> json) {
    aisle = json['aisle'];
    amount = json['amount'];
    consitency = json['consitency'];
    id = json['id'];
    image = json['image'];
    measures = MeasuresModel.fromJson(json['measures']);
    meta = List.castFrom<dynamic, String>(json['meta']);
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['aisle'] = aisle;
    _data['amount'] = amount;
    _data['consitency'] = consitency;
    _data['id'] = id;
    _data['image'] = image;
    _data['measures'] = measures.toJson();
    _data['meta'] = meta;
    _data['name'] = name;
    _data['original'] = original;
    _data['originalName'] = originalName;
    _data['unit'] = unit;
    return _data;
  }
}
