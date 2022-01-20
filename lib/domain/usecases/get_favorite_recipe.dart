import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../core/usecases/base_usecase.dart';
import '../../data/models/favorite_recipe_model_for_db.dart';
import '../entities/favorite_recipe_entity_for_db.dart';
import '../repository/firestore_repository.dart';
import 'get_trending_recipe.dart';

class GetFavoriteRecipeUsecase extends BaseUsecase<dynamic, NoParams> {
  final FirestoreRepository repository;

  GetFavoriteRecipeUsecase(this.repository);
  @override
  Future<Either<Failure, List<FavoriteRecipeEntityForDb>>> call(
      NoParams params) async {
    return await repository.readFavourites();
  }
}
