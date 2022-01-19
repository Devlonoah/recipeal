// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:recipeal/domain/entities/favorite_recipe_entity_for_db.dart';
import 'package:recipeal/domain/entities/recipe_entity.dart';
import 'package:recipeal/domain/usecases/add_to_favorite.dart';
import 'package:recipeal/domain/usecases/get_favorite_recipe.dart';
import 'package:recipeal/domain/usecases/get_trending_recipe.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AddToSaveFavoriteUsecase addToSaveFavoriteUsecase;

  final GetFavoriteRecipeUsecase getFavoriteRecipeUsecase;
  FavoriteBloc({
    required this.addToSaveFavoriteUsecase,
    required this.getFavoriteRecipeUsecase,
  }) : super(FavoriteState.initial()) {
    on<FavouriteAdded>((event, emit) async {
      final _eitherResult = await addToSaveFavoriteUsecase.call(RecipeParams(
          id: event.recipesEntity.id,
          title: event.recipesEntity.title,
          image: event.recipesEntity.image));

      // print('crete/adding duccesfull: ${_eitherResult.isRight()}');
      _eitherResult.fold((l) => emit(state.copyWith()), (r) {
        emit(state);
      });
    });
    on<FavoriteFetched>((event, emit) async {
      print('fecth favorite event emmited');
      final _eitherResult =
          await getFavoriteRecipeUsecase.call(const NoParams());

      _eitherResult.fold((l) => print('failed'), (r) {
        emit(state.copyWith(
          isFailed: false,
          isInitial: false,
          recipes: r,
        ));
      });
    });
  }
}
