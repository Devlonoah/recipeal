import 'package:recipeal/domain/entities/equipment_entity.dart';
import 'package:recipeal/domain/entities/ingredient_entity.dart';
import 'package:recipeal/domain/entities/temperature_entity.dart';

class RecipeInstructionStepEntity {
  int? number;
  String? step;
  final List<IngredientsEntity>? ingredients;
  final List<EquipmentEntity>? equipment;
  final TemperatureEntity? length;

  RecipeInstructionStepEntity({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });
}
