part of 'trending_recipe_bloc.dart';

abstract class TrendingRecipeState extends Equatable {
  const TrendingRecipeState();

  @override
  List<Object> get props => [];
}

class TrendingRecipeInitial extends TrendingRecipeState {}

class TrendingRecipeLoading extends TrendingRecipeState {}

class TrendingRecipeLoaded extends TrendingRecipeState {
  final TrendingRecipeResulEntity trendingRecipeResult;

  const TrendingRecipeLoaded({required this.trendingRecipeResult});

  @override
  List<Object> get props => [trendingRecipeResult];
}

class TrendingRecipeFailure extends TrendingRecipeState {
  final String message;

  const TrendingRecipeFailure(this.message);
}
