import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/recipe_search_result_entity.dart';
import '../../../domain/usecases/search_recipe.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRecipeUsecase usecase;
  SearchBloc(this.usecase) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event.searchQuery.isNotEmpty) {
        emit(SearchLoading());
        final _eitherResult =
            await usecase.call(SearchParams(event.searchQuery));

        _eitherResult.fold(
          (l) {
            emit(SearchFailure());
          },
          (r) => emit(SearchLoaded(r)),
        );
      } else {
        emit(SearchInitial());
      }
    });
  }
}
