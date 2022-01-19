part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteUpdated extends FavoriteEvent {}

class FavouriteAdded extends FavoriteEvent {
  final RecipesEntity recipesEntity;

  const FavouriteAdded(this.recipesEntity);

  @override
  // TODO: implement props
  List<Object> get props => [recipesEntity];
}

class FavoriteFetched extends FavoriteEvent {}
