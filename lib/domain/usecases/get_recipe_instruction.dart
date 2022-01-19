import 'package:recipeal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:recipeal/core/usecases/base_usecase.dart';
import 'package:recipeal/domain/entities/recipe_instruction_entity.dart';
import 'package:recipeal/domain/repository/recipe_repository.dart';
import 'package:recipeal/domain/usecases/get_recipe_details.dart';

class GetRecipeInstructionUsecase
    implements BaseUsecase<RecipeInstructionEntity, Params> {
  final RecipeRepository recipeRepository;

  GetRecipeInstructionUsecase(this.recipeRepository);
  @override
  Future<Either<Failure, RecipeInstructionEntity>> call(Params params) async {
    return await recipeRepository.getRecipeInstruction(params.id);
  }
}
