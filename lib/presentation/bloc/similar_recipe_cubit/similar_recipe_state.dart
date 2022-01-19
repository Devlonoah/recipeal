part of 'similar_recipe_cubit.dart';

abstract class SimilarRecipeState extends Equatable {
  const SimilarRecipeState();

  @override
  List<Object> get props => [];
}

class SimilarRecipeInitial extends SimilarRecipeState {}

class SimilarRecipeLoading extends SimilarRecipeState {}

class SimilarRecipeLoaded extends SimilarRecipeState {
  final List<SimilarRecipeEntity> entity;

  const SimilarRecipeLoaded(this.entity);

  @override
  List<Object> get props => [entity];
}

class SimilarRecipeFailed extends SimilarRecipeState {}
