import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/recipe_instruction_entity.dart';
import '../../../domain/usecases/get_recipe_details.dart';
import '../../../domain/usecases/get_recipe_instruction.dart';

part 'recipe_instruction_event.dart';
part 'recipe_instruction_state.dart';

class RecipeInstructionBloc
    extends Bloc<RecipeInstructionEvent, RecipeInstructionState> {
  final GetRecipeInstructionUsecase usecase;
  RecipeInstructionBloc(this.usecase) : super(RecipeInstructionInitial()) {
    on<RecipeInstructionEvent>((event, emit) async {
      final _eitherREsult = await usecase.call(Params(event.id));

      _eitherREsult.fold(
        (l) => emit(const RecipeInstructionFailure('error')),
        (r) => emit(RecipeInstructionLoaded(r)),
      );
    });
  }
}
