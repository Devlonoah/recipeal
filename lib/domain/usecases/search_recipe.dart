import 'package:recipeal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:recipeal/core/usecases/base_usecase.dart';
import 'package:recipeal/data/repository/recipe_repository_impl.dart';
import 'package:recipeal/domain/entities/recipe_search_result_entity.dart';
import 'package:recipeal/domain/repository/recipe_repository.dart';
import 'package:recipeal/domain/usecases/get_recipe_details.dart';

class SearchRecipeUsecase
    extends BaseUsecase<RecipeSearchResulEntity, SearchParams> {
  final RecipeRepository repository;

  SearchRecipeUsecase(this.repository);
  @override
  Future<Either<Failure, RecipeSearchResulEntity>> call(
      SearchParams params) async {
    return await repository.searchRecipe(params.valueQuery);
  }
}

class SearchParams {
  final String valueQuery;

  SearchParams(this.valueQuery);
}
