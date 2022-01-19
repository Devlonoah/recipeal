import 'package:recipeal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:recipeal/core/usecases/base_usecase.dart';
import 'package:recipeal/domain/repository/firestore_repository.dart';

class AddToSaveFavoriteUsecase implements BaseUsecase<void, RecipeParams> {
  final FirestoreRepository repository;

  AddToSaveFavoriteUsecase(this.repository);
  @override
  Future<Either<Failure, void>> call(RecipeParams recipeParams) async {
    return await repository.addToFavourites(
      id: recipeParams.id,
      title: recipeParams.title,
      image: recipeParams.image,
    );
  }
}

class RecipeParams {
  final int id;
  final String title;
  final String image;

  RecipeParams({
    required this.id,
    required this.title,
    required this.image,
  });
}
