import 'package:equatable/equatable.dart';
import 'extended_ingredient_entity.dart';
import 'wine_pairing_entity.dart';

class RecipesEntity extends Equatable {
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
    required this.whole30,
    required this.weightWatcherSmartPoints,
    required this.dishTypes,
    // required this.extendedIngredients,
    required this.summary,
    // required this.winePairing,
  });

  int id;
  String title;
  String image;
  String imageType;
  int servings;
  int readyInMinutes;
  String license;
  String sourceName;
  String sourceUrl;
  String spoonacularSourceUrl;
  int aggregateLikes;
  double healthScore;
  double spoonacularScore;
  double pricePerServing;
  List<dynamic> analyzedInstructions;
  bool cheap;
  String creditsText;
  List<dynamic> cuisines;
  bool dairyFree;
  List<dynamic> diets;
  String gaps;
  bool glutenFree;
  String instructions;
  bool ketogenic;
  bool lowFodmap;
  List<dynamic> occasions;
  bool sustainable;
  bool vegan;
  bool vegetarian;
  bool veryHealthy;
  bool veryPopular;
  bool whole30;
  int weightWatcherSmartPoints;
  List<String> dishTypes;
  //  List<ExtendedIngredientsEntity> extendedIngredients;
  String summary;
  //  WinePairingEntity winePairing;

  @override
  List<Object?> get props => [
        id,
        title,
      ];

  @override
  bool? get stringify => true;
}
