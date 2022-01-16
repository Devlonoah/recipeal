import 'recipe_model.dart';
import '../../domain/entities/random_recipe_result_entity.dart';

class TrendingRecipeResultModel extends TrendingRecipeResulEntity {
  TrendingRecipeResultModel({
    required this.recipes,
  }) : super(recipes: recipes);

  late final List<RecipesModel> recipes;

  factory TrendingRecipeResultModel.fromJson(Map<String, dynamic> json) {
    return TrendingRecipeResultModel(
        recipes: List.from(json['recipes'])
            .map((e) => RecipesModel.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['recipes'] = recipes.map((e) => e.toJson()).toList();
    return _data;
  }
}
