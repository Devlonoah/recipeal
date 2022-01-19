part of 'recipe_instruction_bloc.dart';

abstract class RecipeInstructionState extends Equatable {
  const RecipeInstructionState();

  @override
  List<Object> get props => [];
}

class RecipeInstructionInitial extends RecipeInstructionState {}

class RecipeInstructionLoaded extends RecipeInstructionState {
  final RecipeInstructionEntity recipeInstructionEntity;

  const RecipeInstructionLoaded(this.recipeInstructionEntity);

  @override
  List<Object> get props => [recipeInstructionEntity];
}

class RecipeInstructionFailure extends RecipeInstructionState {
  final String errorMessage;

  const RecipeInstructionFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
