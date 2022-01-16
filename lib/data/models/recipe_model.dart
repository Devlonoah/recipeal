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
    required this.whole30,
    required this.weightWatcherSmartPoints,
    required this.dishTypes,
    // required this.extendedIngredients,
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
          whole30: whole30,
          weightWatcherSmartPoints: weightWatcherSmartPoints,
          dishTypes: dishTypes,
          // extendedIngredients: extendedIngredients,
          summary: summary,
          // winePairing: winePairing,
        );

  late final int id;

  late final String title;
  late final String image;
  late final String imageType;
  late final int servings;
  late final int readyInMinutes;
  late final String license;
  late final String sourceName;
  late final String sourceUrl;
  late final String spoonacularSourceUrl;
  late final int aggregateLikes;
  late final double healthScore;
  late final double spoonacularScore;

  late final double pricePerServing;
  late final List<dynamic> analyzedInstructions;
  late final bool cheap;
  late final String creditsText;
  late final List<dynamic> cuisines;
  late final bool dairyFree;
  late final List<dynamic> diets;
  late final String gaps;
  late final bool glutenFree;
  late final String instructions;
  late final bool ketogenic;
  late final bool lowFodmap;
  late final List<dynamic> occasions;
  late final bool sustainable;
  late final bool vegan;
  late final bool vegetarian;
  late final bool veryHealthy;
  late final bool veryPopular;
  late final bool whole30;
  late final int weightWatcherSmartPoints;
  late final List<String> dishTypes;
  // late final List<ExtendedIngredientsModel> extendedIngredients;
  late final String summary;
  // late final WinePairingModel winePairing;

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      imageType: json['imageType'],
      servings: json['servings'],
      readyInMinutes: json['readyInMinutes'],
      license: json['license'],
      sourceName: json['sourceName'],
      sourceUrl: json['sourceUrl'],
      spoonacularSourceUrl: json['spoonacularSourceUrl'],
      aggregateLikes: json['aggregateLikes'],
      healthScore: (json['healthScore']),
      spoonacularScore: json['spoonacularScore']?.toDouble() ?? 0.0,
      pricePerServing: json['pricePerServing']?.toDouble() ?? 0.0,
      analyzedInstructions:
          List.castFrom<dynamic, dynamic>(json['analyzedInstructions']),
      cheap: json['cheap'],
      creditsText: json['creditsText'],
      cuisines: List.castFrom<dynamic, dynamic>(json['cuisines']),
      dairyFree: json['dairyFree'],
      diets: List.castFrom<dynamic, dynamic>(json['diets']),
      gaps: json['gaps'],
      glutenFree: json['glutenFree'],
      instructions: json['instructions'],
      ketogenic: json['ketogenic']?.toDouble() ?? 0.0,
      lowFodmap: json['lowFodmap'],
      occasions: List.castFrom<dynamic, dynamic>(json['occasions']),
      sustainable: json['sustainable'],
      vegan: json['vegan'],
      vegetarian: json['vegetarian'],
      veryHealthy: json['veryHealthy'],
      veryPopular: json['veryPopular'],
      whole30: json['whole30'],
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'],
      dishTypes: List.castFrom<dynamic, String>(json['dishTypes']),
      // extendedIngredients = List.from(json['extendedIngredients'])
      //     .map((e) => ExtendedIngredientsModel.fromJson(e))
      //     .toList();
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
    _data['whole30'] = whole30;
    _data['weightWatcherSmartPoints'] = weightWatcherSmartPoints;
    _data['dishTypes'] = dishTypes;
    // _data['extendedIngredients'] =
    //     extendedIngredients.map((e) => e.toJson()).toList();
    _data['summary'] = summary;
    // _data['winePairing'] = winePairing.toJson();
    return _data;
  }
}
