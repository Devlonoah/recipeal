import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipeal/data/models/recipe_model.dart';
import 'package:recipeal/domain/entities/recipe_entity.dart';
import '../../../domain/usecases/get_recipe_details.dart';

part 'recipe_details_event.dart';
part 'recipe_details_state.dart';

class RecipeDetailsBloc extends Bloc<RecipeDetailsEvent, RecipeDetailsState> {
  final GetRecipeDetailsUsecase recipeDetailsUsecase;

  RecipeDetailsBloc(this.recipeDetailsUsecase) : super(RecipeDetailsInitial()) {
    on<GetRecipeDetails>((event, emit) async {
      final _eitherResult = await recipeDetailsUsecase.call(Params(event.id));

      _eitherResult.fold(
        (l) {
          emit(RecipeDetailsFailure());
        },
        (r) {
          emit(RecipeDetailsLoaded(r));
        },
      );
    });
  }
}
