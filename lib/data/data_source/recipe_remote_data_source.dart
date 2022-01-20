import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:recipeal/core/error/failure.dart';
import 'package:recipeal/data/models/recipe_instruction_model.dart';
import 'package:recipeal/data/models/recipe_search_result_model.dart';
import 'package:recipeal/data/models/similar_recipe_model.dart';
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
  /// Throws [exception] for server -caused error [402  and others]
  Future<RecipesModel> getRecipeDetails(int id);

  Future<RecipeInstructionModel> getRecipeInstruction(int id);

  Future<List<SimilarRecipeModel>> getSimilarRecipe(int id);

  Future<RecipeSearchResultModel> searchRecipe(String queryValue);
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
        "${ApiConstants.BASE_URL}/recipes/random?limitLicense=true&number=10&apiKey=${ApiConstants.API_KEY}");

    final response = await client.get(
      _parsedUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      return TrendingRecipeResultModel.fromJson(decodedResponse);
    }

    if (response.statusCode == 404) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<RecipeInstructionModel> getRecipeInstruction(int id) async {
    final _header = {'Content-Type': 'application/json'};

    final _parsedUrl = Uri.parse(
        "${ApiConstants.BASE_URL}/recipes/$id/analyzedInstructions?stepBreakdown=false&apiKey=${ApiConstants.API_KEY}");

    final result = await client.get(
      _parsedUrl,
      headers: _header,
    );
    if (result.statusCode == 200) {
      return RecipeInstructionModel.fromJson(
          Map.castFrom(jsonDecode(result.body)[0]));
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<List<SimilarRecipeModel>> getSimilarRecipe(int id) async {
    final _header = {'Content-Type': 'application/json'};

    final _parsedUrl = Uri.parse(
        "${ApiConstants.BASE_URL}/recipes/$id//similar?number=10&limitLicense=true&apiKey=${ApiConstants.API_KEY}");

    final response = await client.get(_parsedUrl, headers: _header);

    if (response.statusCode == 200) {
      List<SimilarRecipeModel> list = <SimilarRecipeModel>[];
      final cappedList = List.from(jsonDecode(response.body)).toList();

      for (var element in cappedList) {
        list.add(SimilarRecipeModel.fromMap(element));
      }
      return list;
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<RecipeSearchResultModel> searchRecipe(String queryValue) async {
    final _parsedUrl = Uri.parse(
        "${ApiConstants.BASE_URL}/recipes/complexSearch?number=20&query=$queryValue&apiKey=${ApiConstants.API_KEY}");

    final _response = await http.get(_parsedUrl);

    if (_response.statusCode == 200) {
      print(_response.body);
      return RecipeSearchResultModel.fromJson(jsonDecode(_response.body));
    } else {
      throw GeneralException();
    }
  }
}
