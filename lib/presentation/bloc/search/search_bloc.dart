import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipeal/domain/entities/recipe_search_result_entity.dart';
import 'package:recipeal/domain/usecases/search_recipe.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRecipeUsecase usecase;
  SearchBloc(this.usecase) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      emit(SearchLoading());
      if (event.searchQuery.isNotEmpty) {
        final _eitherResult =
            await usecase.call(SearchParams(event.searchQuery));

        print("search eiterresult  is right: ${_eitherResult.isRight}");
        _eitherResult.fold(
          (l) {
            emit(SearchFailure());
          },
          (r) => emit(SearchLoaded(r)),
        );
      }
    });
  }
}
