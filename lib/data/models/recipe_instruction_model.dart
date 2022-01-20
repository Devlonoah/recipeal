import 'recipe_instruction_step_model.dart';
import '../../domain/entities/recipe_instruction_entity.dart';

class RecipeInstructionModel extends RecipeInstructionEntity {
  String? name;
  List<RecipeInstructionStepModel>? instructionSteps;

  RecipeInstructionModel({this.name, this.instructionSteps})
      : super(
          instructionSteps: instructionSteps,
          name: name,
        );

  RecipeInstructionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    if (json['steps'] != null) {
      instructionSteps = <RecipeInstructionStepModel>[];
      json['steps'].forEach((v) {
        instructionSteps!.add(RecipeInstructionStepModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = Map<String, dynamic>();
    // data['name'] = this.name;
    // if (this.instructionSteps != null) {
    //   data['steps'] = this.instructionSteps!.map((v) => v.toJson()).toList();
    // }
    // return data;

    return {
      'name': name,
      'steps': List<dynamic>.from(instructionSteps!.map((e) => null))
    };
  }
}
