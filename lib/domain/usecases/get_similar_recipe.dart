import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../core/usecases/base_usecase.dart';
import '../entities/similar_recipe_entity.dart';
import '../repository/recipe_repository.dart';
import 'get_recipe_details.dart';

class GetSimilarRecipeUsecase
    implements BaseUsecase<List<SimilarRecipeEntity>, Params> {
  final RecipeRepository repository;

  GetSimilarRecipeUsecase(this.repository);
  @override
  Future<Either<Failure, List<SimilarRecipeEntity>>> call(Params params) {
    return repository.getSimilarRecipe(params.id);
  }
}
