import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/favorite_recipe_entity_for_db.dart';

abstract class FirestoreRepository {
  Future<Either<Failure, void>> addToFavourites({
    required int id,
    required String title,
    required String image,
  });

  Future<Either<Failure, List<FavoriteRecipeEntityForDb>>> readFavourites();
}
