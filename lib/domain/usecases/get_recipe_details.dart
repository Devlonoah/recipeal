import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failure.dart';
import '../../core/usecases/base_usecase.dart';
import '../entities/recipe_entity.dart';
import '../repository/recipe_repository.dart';

class GetRecipeDetailsUsecase implements BaseUsecase<RecipesEntity, Params> {
  final RecipeRepository repository;

  GetRecipeDetailsUsecase(this.repository);

  @override
  Future<Either<Failure, RecipesEntity>> call(Params params) async {
    return await repository.getRecipeDetails(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params(this.id);

  @override
  List<Object?> get props => [id];
}
