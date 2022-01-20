import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../core/usecases/base_usecase.dart';
import '../entities/random_recipe_result_entity.dart';
import '../repository/recipe_repository.dart';
import 'get_trending_recipe.dart';

class GetRecommendedUsecase
    extends BaseUsecase<TrendingRecipeResulEntity, NoParams> {
  final RecipeRepository repository;

  GetRecommendedUsecase(this.repository);
  @override
  Future<Either<Failure, TrendingRecipeResulEntity>> call(params) async {
    return await repository.getRecommendedRecipes();
  }
}
