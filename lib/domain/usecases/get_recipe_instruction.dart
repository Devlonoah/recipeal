import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../core/usecases/base_usecase.dart';
import '../entities/recipe_instruction_entity.dart';
import '../repository/recipe_repository.dart';
import 'get_recipe_details.dart';

class GetRecipeInstructionUsecase
    implements BaseUsecase<RecipeInstructionEntity, Params> {
  final RecipeRepository recipeRepository;

  GetRecipeInstructionUsecase(this.recipeRepository);
  @override
  Future<Either<Failure, RecipeInstructionEntity>> call(Params params) async {
    return await recipeRepository.getRecipeInstruction(params.id);
  }
}
