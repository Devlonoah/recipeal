import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../core/usecases/base_usecase.dart';
import '../../data/repository/recipe_repository_impl.dart';
import '../entities/recipe_search_result_entity.dart';
import '../repository/recipe_repository.dart';
import 'get_recipe_details.dart';

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
