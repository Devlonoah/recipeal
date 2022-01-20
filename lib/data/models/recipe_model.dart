import 'extending_ingredient_model.dart';

import '../../domain/entities/recipe_entity.dart';

class RecipesModel extends RecipesEntity {
  RecipesModel({
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
  }) : super(
          id: id,
          title: title,
          image: image,
          imageType: imageType,
          servings: servings,
          readyInMinutes: readyInMinutes,
          license: license,
          sourceName: sourceName,
          sourceUrl: sourceUrl,
          spoonacularSourceUrl: spoonacularSourceUrl,
          aggregateLikes: aggregateLikes,
          healthScore: healthScore,
          spoonacularScore: spoonacularScore,
          pricePerServing: pricePerServing,
          analyzedInstructions: analyzedInstructions,
          cheap: cheap,
          creditsText: creditsText,
          cuisines: cuisines,
          dairyFree: dairyFree,
          diets: diets,
          gaps: gaps,
          glutenFree: glutenFree,
          instructions: instructions,
          ketogenic: ketogenic,
          lowFodmap: lowFodmap,
          occasions: occasions,
          sustainable: sustainable,
          vegan: vegan,
          vegetarian: vegetarian,
          veryHealthy: veryHealthy,
          veryPopular: veryPopular,
          // whole30: whole30,

          weightWatcherSmartPoints: weightWatcherSmartPoints,
          dishTypes: dishTypes,
          extendedIngredients: extendedIngredients,
          summary: summary,
          // winePairing: winePairing,
        );

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
  //  final bool whole30;
  final int weightWatcherSmartPoints;
  final List<String> dishTypes;
  final List<ExtendedIngredientsModel> extendedIngredients;
  final String summary;
  //  final WinePairingModel winePairing;

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
      id: json['id'],
      title: json['title'] ?? "",
      image: json['image'] ?? "",
      imageType: json['imageType'] ?? "",
      servings: json['servings'] ?? 0,
      readyInMinutes: json['readyInMinutes'].toInt() ?? 0,
      license: json['license'] ?? '',
      sourceName: json['sourceName'] ?? "",
      sourceUrl: json['sourceUrl'] ?? "",
      spoonacularSourceUrl: json['spoonacularSourceUrl'],
      aggregateLikes: json['aggregateLikes'],
      healthScore: (json['healthScore'])?.toDouble() ?? 0.0,
      spoonacularScore: json['spoonacularScore']?.toDouble() ?? 0.0,
      pricePerServing: json['pricePerServing']?.toDouble() ?? 0.0,
      analyzedInstructions:
          List.castFrom<dynamic, dynamic>(json['analyzedInstructions']),
      cheap: json['cheap'],
      creditsText: json['creditsText'] ?? "",
      cuisines: List.castFrom<dynamic, dynamic>(json['cuisines']),
      dairyFree: json['dairyFree'],
      diets: List.castFrom<dynamic, dynamic>(json['diets']),
      gaps: json['gaps'],
      glutenFree: json['glutenFree'],
      instructions: json['instructions'],
      ketogenic: json['ketogenic'] ?? false,
      lowFodmap: json['lowFodmap'],
      occasions: List.castFrom<dynamic, dynamic>(json['occasions']),
      sustainable: json['sustainable'],
      vegan: json['vegan'],
      vegetarian: json['vegetarian'],
      veryHealthy: json['veryHealthy'],
      veryPopular: json['veryPopular'],

      weightWatcherSmartPoints: json['weightWatcherSmartPoints']?.toInt() ?? 0,
      dishTypes: List.castFrom<dynamic, String>(json['dishTypes']),
      extendedIngredients: List.from(json['extendedIngredients'])
          .map((e) => ExtendedIngredientsModel.fromJson(e))
          .toList(),
      summary: json['summary'],
      // winePairing = WinePairingModel.fromJson(json['winePairing']);
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['image'] = image;
    _data['imageType'] = imageType;
    _data['servings'] = servings;
    _data['readyInMinutes'] = readyInMinutes;
    _data['license'] = license;
    _data['sourceName'] = sourceName;
    _data['sourceUrl'] = sourceUrl;
    _data['spoonacularSourceUrl'] = spoonacularSourceUrl;
    _data['aggregateLikes'] = aggregateLikes;
    _data['healthScore'] = healthScore;
    _data['spoonacularScore'] = spoonacularScore;
    _data['pricePerServing'] = pricePerServing;
    _data['analyzedInstructions'] = analyzedInstructions;
    _data['cheap'] = cheap;
    _data['creditsText'] = creditsText;
    _data['cuisines'] = cuisines;
    _data['dairyFree'] = dairyFree;
    _data['diets'] = diets;
    _data['gaps'] = gaps;
    _data['glutenFree'] = glutenFree;
    _data['instructions'] = instructions;
    _data['ketogenic'] = ketogenic;
    _data['lowFodmap'] = lowFodmap;
    _data['occasions'] = occasions;
    _data['sustainable'] = sustainable;
    _data['vegan'] = vegan;
    _data['vegetarian'] = vegetarian;
    _data['veryHealthy'] = veryHealthy;
    _data['veryPopular'] = veryPopular;
    // _data['whole30'] = whole30;
    _data['weightWatcherSmartPoints'] = weightWatcherSmartPoints;
    _data['dishTypes'] = dishTypes;
    _data['extendedIngredients'] =
        extendedIngredients.map((e) => e.toJson()).toList();
    _data['summary'] = summary;
    // _data['winePairing'] = winePairing.toJson();
    return _data;
  }
}
