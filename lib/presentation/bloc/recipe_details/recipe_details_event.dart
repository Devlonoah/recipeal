part of 'recipe_details_bloc.dart';

abstract class RecipeDetailsEvent extends Equatable {
  const RecipeDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetRecipeDetails extends RecipeDetailsEvent {
  final int id;

  const GetRecipeDetails(this.id);

  @override
  List<Object> get props => [id];
}
