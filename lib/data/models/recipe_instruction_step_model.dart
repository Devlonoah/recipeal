import 'package:recipeal/data/models/equipment_model.dart';
import 'package:recipeal/data/models/ingredient_model.dart';
import 'package:recipeal/data/models/temperature_model.dart';
import 'package:recipeal/domain/entities/recipe_instruction_step_entity.dart';

class RecipeInstructionStepModel extends RecipeInstructionStepEntity {
  int? number;
  String? step;
  List<IngredientsModel>? ingredients;
  List<EquipmentModel>? equipment;
  TemperatureModel? length;

  RecipeInstructionStepModel(
      {this.number, this.step, this.ingredients, this.equipment, this.length})
      : super(
          equipment: equipment,
          length: length,
          ingredients: ingredients,
          step: step,
          number: number,
        );

  RecipeInstructionStepModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = <IngredientsModel>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(IngredientsModel.fromJson(v));
      });
    }
    if (json['equipment'] != null) {
      equipment = <EquipmentModel>[];
      json['equipment'].forEach((v) {
        equipment!.add(EquipmentModel.fromJson(v));
      });
    }
    length = json['length'] != null
        ? TemperatureModel.fromJson(json['length'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = this.number;
    data['step'] = this.step;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    if (this.equipment != null) {
      data['equipment'] = this.equipment!.map((v) => v.toJson()).toList();
    }
    if (this.length != null) {
      data['length'] = this.length!.toJson();
    }
    return data;
  }
}
