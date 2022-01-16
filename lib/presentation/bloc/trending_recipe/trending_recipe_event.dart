part of 'trending_recipe_bloc.dart';

abstract class TrendingRecipeEvent extends Equatable {
  const TrendingRecipeEvent();

  @override
  List<Object> get props => [];
}

class GetTrendingRecipe extends TrendingRecipeEvent {}
