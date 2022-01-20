import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/similar_recipe_entity.dart';
import '../../../domain/usecases/get_recipe_details.dart';
import '../../../domain/usecases/get_similar_recipe.dart';

part 'similar_recipe_state.dart';

class SimilarRecipeCubit extends Cubit<SimilarRecipeState> {
  final GetSimilarRecipeUsecase usecase;
  SimilarRecipeCubit(this.usecase) : super(SimilarRecipeInitial());

  void getSimilarRecipe(int id) async {
    emit(SimilarRecipeLoading());

    final _eitherResult = await usecase.call(
      Params(id),
    );

    _eitherResult.fold((l) => emit(SimilarRecipeFailed()),
        (r) => emit(SimilarRecipeLoaded(r)));
  }
}
