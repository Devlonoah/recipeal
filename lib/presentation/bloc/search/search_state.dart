part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final RecipeSearchResulEntity result;

  const SearchLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class SearchFailure extends SearchState {}
