import 'package:recipeal/data/models/recipe_model.dart';

import 'extended_ingredient_entity.dart';

class RecipesEntity {
  RecipesEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.servings,
    required this.readyInMinutes,
    required this.license,
    required this.sourceName,
    required this.sourceUrl,
    required this.spoonacularSourceUrl,
    required this.aggregateLikes,
    required this.healthScore,
    required this.spoonacularScore,
    required this.pricePerServing,
    required this.analyzedInstructions,
    required this.cheap,
    required this.creditsText,
    required this.cuisines,
    required this.dairyFree,
    required this.diets,
    required this.gaps,
    required this.glutenFree,
    required this.instructions,
    required this.ketogenic,
    required this.lowFodmap,
    required this.occasions,
    required this.sustainable,
    required this.vegan,
    required this.vegetarian,
    required this.veryHealthy,
    required this.veryPopular,
    // required this.whole30,
    required this.weightWatcherSmartPoints,
    required this.dishTypes,
    required this.extendedIngredients,
    required this.summary,
    // required this.winePairing,
  });

  final int id;
  final String title;
  final String image;
  final String imageType;
  final int servings;
  final int readyInMinutes;
  final String license;
  final String sourceName;
  final String sourceUrl;
  final String spoonacularSourceUrl;
  final int aggregateLikes;
  final double healthScore;
  final double spoonacularScore;
  final double pricePerServing;
  final List<dynamic> analyzedInstructions;
  final bool cheap;
  final String creditsText;
  final List<dynamic> cuisines;
  final bool dairyFree;
  final List<dynamic> diets;
  final String gaps;
  final bool glutenFree;
  final String instructions;
  final bool ketogenic;
  final bool lowFodmap;
  final List<dynamic> occasions;
  final bool sustainable;
  final bool vegan;
  final bool vegetarian;
  final bool veryHealthy;
  final bool veryPopular;
  //final  bool whole30;
  final int weightWatcherSmartPoints;
  final List<String> dishTypes;
  final List<ExtendedIngredientsEntity> extendedIngredients;
  final String summary;
  //  WinePairingEntity winePairing;

}
