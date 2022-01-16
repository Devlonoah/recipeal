import 'dart:convert';

import '../../core/api_constants.dart';
import '../../core/error/exception.dart';
import '../models/recipe_model.dart';
import '../models/trending_recipe_result_model.dart';
import 'package:http/http.dart' as http;

abstract class RecipeRemoteDataSource {
  /// Get trending [trending] recipes [max no: 10]
  Future<TrendingRecipeResultModel> getTrendingRecipe();

  /// Get detailed information for the recipe
  ///
  /// Throws [exception] for all server code
  Future<RecipesModel> getRecipeDetails(int id);
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final http.Client client;

  RecipeRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<RecipesModel> getRecipeDetails(int id) async {
    final _header = {'Content-Type': 'application/json'};
    final _parsedUrl = Uri.parse(
        "${ApiConstants.BASE_URL}/recipes/$id/information?includeNutrition=false&apiKey=${ApiConstants.API_KEY}");
    final result = await client.get(_parsedUrl, headers: _header);

    if (result.statusCode == 200) {
      return RecipesModel.fromJson(jsonDecode(result.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TrendingRecipeResultModel> getTrendingRecipe() async {
    final _parsedUrl = Uri.parse(
        "${ApiConstants.BASE_URL}/recipes/random?limitLicense=true&tags=rice&number=10");

    final response = await client.get(
      _parsedUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return TrendingRecipeResultModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
