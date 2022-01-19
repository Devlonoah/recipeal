part of 'recipe_instruction_bloc.dart';

class RecipeInstructionEvent extends Equatable {
  final int id;
  const RecipeInstructionEvent(this.id);

  @override
  List<Object> get props => [id];
}
