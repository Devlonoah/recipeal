import '../../data/models/extending_ingredient_model.dart';

import 'measures_entity.dart';

class ExtendedIngredientsEntity {
  ExtendedIngredientsEntity(
      {required this.aisle,
      required this.amount,
      required this.consitency,
      required this.id,
      required this.image,
      required this.measures,
      required this.meta,
      required this.name,
      required this.original,
      required this.originalName,
      required this.unit});

  final String aisle;
  final double? amount;
  final String consitency;
  final int id;
  final String image;
  final MeasuresEntity measures;
  final List<String> meta;
  final String name;
  final String original;
  final String originalName;
  final String unit;
}
