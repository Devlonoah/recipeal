import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/random_recipe_result_entity.dart';
import '../entities/recipe_entity.dart';

abstract class RecipeRepository {
  //get trending recipe
  Future<Either<Failure, TrendingRecipeResulEntity>> getTrendingRecipe();

  Future<Either<Failure, RecipesEntity>> getRecipeDetails(int id);
}
