import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/random_recipe_result_entity.dart';
import '../../../domain/usecases/get_recommended.dart';
import '../../../domain/usecases/get_trending_recipe.dart';

part 'recommended_recipe_event.dart';
part 'recommended_recipe_state.dart';

class RecommendedRecipeBloc
    extends Bloc<RecommendedRecipeEvent, RecommendedRecipeState> {
  final GetRecommendedUsecase usecase;
  RecommendedRecipeBloc(this.usecase) : super(RecommendedRecipeInitial()) {
    on<RecommendedRecipeEvent>((event, emit) async {
      emit(RecommendedRecipeLoading());

      final _eitherResult = await usecase.call(const NoParams());

      _eitherResult.fold((l) => emit(RecommendedRecipeFailure()),
          (r) => emit(RecommendedRecipeLoaded(r)));
    });
  }
}
