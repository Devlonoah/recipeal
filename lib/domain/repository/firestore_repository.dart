import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:recipeal/core/error/failure.dart';
import 'package:recipeal/data/models/favorite_recipe_model_for_db.dart';
import 'package:recipeal/domain/entities/favorite_recipe_entity_for_db.dart';

abstract class FirestoreRepository {
  Future<Either<Failure, void>> addToFavourites({
    required int id,
    required String title,
    required String image,
  });

  Future<Either<Failure, List<FavoriteRecipeEntityForDb>>> readFavourites();
}
