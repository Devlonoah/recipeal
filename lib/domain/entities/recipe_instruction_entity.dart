import 'package:recipeal/domain/entities/recipe_instruction_step_entity.dart';

class RecipeInstructionEntity {
  final String? name;
  final List<RecipeInstructionStepEntity>? instructionSteps;

  RecipeInstructionEntity({
    this.name,
    this.instructionSteps,
  });
}
