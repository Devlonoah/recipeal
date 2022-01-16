import 'dart:io';

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
      final remoteTrendingRecipe = await remoteDataSource.getRecipeDetails(id);

      return Right(remoteTrendingRecipe);
    } on SocketException {
      return await _getCachedRecipeDetails(id);
    } on NetworkException {
      return await _getCachedRecipeDetails(id);
    }
  }

  @override
  Future<Either<Failure, TrendingRecipeResulEntity>> getTrendingRecipe() async {
    // ignore: unused_local_variable
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

  Future<Right<Failure, TrendingRecipeResulEntity>>
      _getCachedTrendingRecipe() async {
    final localTrendingRecipe = await localDataSource.getLastTrendingRecipe();

    return Right(localTrendingRecipe);
  }

  Future<Either<Failure, RecipesEntity>> _getCachedRecipeDetails(int id) async {
    final localRecipeDetail = await localDataSource.getLastRecipeDetails();

    if (localRecipeDetail != null) {
      return Right(localRecipeDetail);
    }

    return Left(CachedFailure());
  }
}
