part of 'recommended_recipe_bloc.dart';

abstract class RecommendedRecipeState extends Equatable {
  const RecommendedRecipeState();

  @override
  List<Object> get props => [];
}

class RecommendedRecipeInitial extends RecommendedRecipeState {}

class RecommendedRecipeLoading extends RecommendedRecipeState {}

class RecommendedRecipeLoaded extends RecommendedRecipeState {
  final TrendingRecipeResulEntity trendingRecipeResulEntity;

  const RecommendedRecipeLoaded(this.trendingRecipeResulEntity);

  @override
  List<Object> get props => [trendingRecipeResulEntity];
}

class RecommendedRecipeFailure extends RecommendedRecipeState {}
