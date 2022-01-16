import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/random_recipe_result_entity.dart';
import '../../../domain/usecases/get_trending_recipe.dart';

part 'trending_recipe_event.dart';
part 'trending_recipe_state.dart';

class TrendingRecipeBloc
    extends Bloc<TrendingRecipeEvent, TrendingRecipeState> {
  final GetTrendingRecipeUseCase trendingRecipeUseCase;

  TrendingRecipeBloc(this.trendingRecipeUseCase)
      : super(TrendingRecipeInitial()) {
    on<TrendingRecipeEvent>((event, emit) async {
      final _eitherResult = await trendingRecipeUseCase.call(const NoParams());

      _eitherResult.fold(
        (l) => emit(
          const TrendingRecipeFailure('Error'),
        ),
        (r) => emit(
          TrendingRecipeLoaded(trendingRecipeResult: r),
        ),
      );
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'server failrue';

    case CachedFailure:
      return 'cache failure';

    case NetworkFailure:
      return 'check your connection';
    default:
      return 'Unexpected Error';
  }
}
