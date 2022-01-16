import 'dart:convert';

import '../../core/error/exception.dart';
import '../../core/keys/keys.dart';
import '../models/recipe_model.dart';
import '../models/trending_recipe_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RecipeLocalDataSource {
  /// Get the cached [TrendingRecipeResultModel]
  Future<TrendingRecipeResultModel> getLastTrendingRecipe();

  /// Get the cached [RecipesModel]
  Future<RecipesModel> getLastRecipeDetails();

  Future<void> cacheTrendingRecipe(
      TrendingRecipeResultModel trendingRecipeResultModel);

  Future<void> cacheRecipeDetail(
      TrendingRecipeResultModel trendingRecipeResultModel);
}

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  final SharedPreferences sharedPreferences;

  RecipeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<TrendingRecipeResultModel> getLastTrendingRecipe() async {
    final jsonString = sharedPreferences.getString(CACHED_TRENDING_RECIPE);

    if (jsonString != null) {
      return await Future.value(
        TrendingRecipeResultModel.fromJson(jsonDecode(jsonString)),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTrendingRecipe(
      TrendingRecipeResultModel trendingRecipeResultModel) async {
    await sharedPreferences.setString(
      CACHED_TRENDING_RECIPE,
      jsonEncode(trendingRecipeResultModel),
    );
  }

  @override
  Future<void> cacheRecipeDetail(
      TrendingRecipeResultModel trendingRecipeResultModel) {
    // TODO: implement cacheRecipeDetail
    throw UnimplementedError();
  }

  @override
  Future<RecipesModel> getLastRecipeDetails() {
    // TODO: implement getLastRecipeDetails
    throw UnimplementedError();
  }
}
