import 'equipment_entity.dart';
import 'ingredient_entity.dart';
import 'temperature_entity.dart';

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
