part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    required this.recipes,
    required this.isInitial,
    required this.isFailed,
  });
  final List<FavoriteRecipeEntityForDb> recipes;
  final bool isInitial;
  final bool isFailed;

  @override
  List<Object> get props => [
        recipes,
        isFailed,
        isInitial,
      ];

  static initial() {
    return const FavoriteState(recipes: [], isInitial: true, isFailed: false);
  }

  copyWith({
    List<FavoriteRecipeEntityForDb>? recipes,
    bool? isInitial,
    bool? isFailed,
  }) {
    return FavoriteState(
      isInitial: isInitial ?? this.isInitial,
      isFailed: isFailed ?? this.isFailed,
      recipes: recipes ?? this.recipes,
    );
  }
}
