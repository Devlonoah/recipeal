part of 'recipe_details_bloc.dart';

abstract class RecipeDetailsState extends Equatable {
  const RecipeDetailsState();

  @override
  List<Object> get props => [];
}

class RecipeDetailsInitial extends RecipeDetailsState {}

class RecipeDetailsLoaded extends RecipeDetailsState {
  final RecipesEntity recipesModel;

  const RecipeDetailsLoaded(this.recipesModel);

  @override
  List<Object> get props => [recipesModel];
}

class RecipeDetailsFailure extends RecipeDetailsState {}
