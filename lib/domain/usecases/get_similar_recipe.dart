import 'package:recipeal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:recipeal/core/usecases/base_usecase.dart';
import 'package:recipeal/domain/entities/similar_recipe_entity.dart';
import 'package:recipeal/domain/repository/recipe_repository.dart';
import 'package:recipeal/domain/usecases/get_recipe_details.dart';

class GetSimilarRecipeUsecase
    implements BaseUsecase<List<SimilarRecipeEntity>, Params> {
  final RecipeRepository repository;

  GetSimilarRecipeUsecase(this.repository);
  @override
  Future<Either<Failure, List<SimilarRecipeEntity>>> call(Params params) {
    return repository.getSimilarRecipe(params.id);
  }
}
