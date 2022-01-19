import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipeal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:recipeal/core/usecases/base_usecase.dart';
import 'package:recipeal/data/models/favorite_recipe_model_for_db.dart';
import 'package:recipeal/domain/entities/favorite_recipe_entity_for_db.dart';
import 'package:recipeal/domain/repository/firestore_repository.dart';
import 'package:recipeal/domain/usecases/get_trending_recipe.dart';

class GetFavoriteRecipeUsecase extends BaseUsecase<dynamic, NoParams> {
  final FirestoreRepository repository;

  GetFavoriteRecipeUsecase(this.repository);
  @override
  Future<Either<Failure, List<FavoriteRecipeEntityForDb>>> call(
      NoParams params) async {
    return await repository.readFavourites();
  }
}
