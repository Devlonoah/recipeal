import 'measures_entity.dart';

class ExtendedIngredientsEntity {
  ExtendedIngredientsEntity(
      this.aisle,
      this.amount,
      this.consitency,
      this.id,
      this.image,
      this.measures,
      this.meta,
      this.name,
      this.original,
      this.originalName,
      this.unit);

  final String aisle;
  final int? amount;
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
