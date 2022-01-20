import 'package:dartz/dartz.dart';
import 'package:recipeal/core/error/failure.dart';
import 'package:recipeal/domain/entities/favorite_recipe_entity_for_db.dart';

abstract class FirestoreRepository {
  Future<Either<Failure, void>> addToFavourites({
    required int id,
    required String title,
    required String image,
  });

  Future<Either<Failure, List<FavoriteRecipeEntityForDb>>> readFavourites();
}
