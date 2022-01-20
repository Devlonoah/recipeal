import 'dart:io';

import 'package:recipeal/data/models/recipe_instruction_model.dart';
import 'package:recipeal/domain/entities/recipe_search_result_entity.dart';
import 'package:recipeal/domain/entities/similar_recipe_entity.dart';

import '../../core/error/exception.dart';
import '../data_source/recipe_local_data_source.dart';
import '../data_source/recipe_remote_data_source.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/random_recipe_result_entity.dart';
import '../../domain/entities/recipe_entity.dart';
import '../../domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;
  final RecipeLocalDataSource localDataSource;

  RecipeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, RecipesEntity>> getRecipeDetails(int id) async {
    try {
      final _cachedResult = await _getCachedRecipeDetails(id);

      if (_cachedResult?.id != null) {
        if (_cachedResult?.id == id) {
          return Right(_cachedResult!);
        } else {
          return await getRecipeDetailFromApi(id);
        }
      } else {
        return await getRecipeDetailFromApi(id);
      }
    } on SocketException {
      return Left(NetworkFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      print('error is : $e');
      return Left(GeneralFailure());
    }
  }

  Future<Right<Failure, RecipesEntity>> getRecipeDetailFromApi(int id) async {
    final remoteTrendingRecipe = await remoteDataSource.getRecipeDetails(id);

    await localDataSource.cacheRecipeDetail(remoteTrendingRecipe);
    return Right(remoteTrendingRecipe);
  }

  @override
  Future<Either<Failure, TrendingRecipeResulEntity>> getTrendingRecipe() async {
    try {
      final remoteTrendingRecipe = await remoteDataSource.getTrendingRecipe();

      await localDataSource.cacheTrendingRecipe(remoteTrendingRecipe);

      return Right(remoteTrendingRecipe);
    } on SocketException {
      return await _getCachedTrendingRecipe();
    } on NetworkException {
      try {
        return await _getCachedTrendingRecipe();
      } on CacheException {
        return Left(CachedFailure());
      }
    }
  }

  Future<Either<Failure, TrendingRecipeResulEntity>>
      _getCachedTrendingRecipe() async {
    try {
      final localTrendingRecipe = await localDataSource.getLastTrendingRecipe();

      if (localTrendingRecipe != null) {
        return Right(localTrendingRecipe);
      } else {
        return Left(CachedFailure());
      }
    } catch (e) {
      return Left(GeneralFailure());
    }
  }

  Future<RecipesEntity?> _getCachedRecipeDetails(int id) async {
    final localRecipeDetail = await localDataSource.getLastRecipeDetails();

    return localRecipeDetail;
  }

  @override
  Future<Either<Failure, RecipeInstructionModel>> getRecipeInstruction(
      int id) async {
    try {
      final result = await remoteDataSource.getRecipeInstruction(id);
      return Right(result);
    } on SocketException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, List<SimilarRecipeEntity>>> getSimilarRecipe(
      int id) async {
    try {
      final result = await remoteDataSource.getSimilarRecipe(id);

      return Right(result);
    } catch (e) {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, RecipeSearchResulEntity>> searchRecipe(
      String queryValue) async {
    try {
      final response = await remoteDataSource.searchRecipe(queryValue);
      return await Right(response);
    } catch (e) {
      return Left(GeneralFailure());
    }
  }
}
