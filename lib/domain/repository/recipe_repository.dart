import 'package:dartz/dartz.dart';
import '../entities/recipe_instruction_entity.dart';
import '../entities/recipe_search_result_entity.dart';
import '../entities/similar_recipe_entity.dart';

import '../../core/error/failure.dart';
import '../entities/random_recipe_result_entity.dart';
import '../entities/recipe_entity.dart';

abstract class RecipeRepository {
  //get trending recipe
  Future<Either<Failure, TrendingRecipeResulEntity>> getTrendingRecipe();

  Future<Either<Failure, RecipesEntity>> getRecipeDetails(int id);

  Future<Either<Failure, RecipeInstructionEntity>> getRecipeInstruction(int id);

  Future<Either<Failure, List<SimilarRecipeEntity>>> getSimilarRecipe(int id);

  Future<Either<Failure, RecipeSearchResulEntity>> searchRecipe(
      String queryValue);

  Future<Either<Failure, TrendingRecipeResulEntity>> getRecommendedRecipes();
}
