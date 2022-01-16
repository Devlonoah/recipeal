import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../core/usecases/base_usecase.dart';
import '../entities/random_recipe_result_entity.dart';
import '../entities/recipe_entity.dart';
import '../repository/recipe_repository.dart';

class GetTrendingRecipeUseCase
    implements BaseUsecase<TrendingRecipeResulEntity, NoParams> {
  final RecipeRepository repository;

  GetTrendingRecipeUseCase(this.repository);

  @override
  Future<Either<Failure, TrendingRecipeResulEntity>> call(
      NoParams noParams) async {
    return await repository.getTrendingRecipe();
  }
}

class NoParams {
  const NoParams();
}
