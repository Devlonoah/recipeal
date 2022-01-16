import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:recipeal/domain/entities/recipe_entity.dart';
import 'package:recipeal/domain/repository/recipe_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipeal/domain/usecases/get_recipe_details.dart';

class MockRecipeRepository extends Mock implements RecipeRepository {}

void main() {
  MockRecipeRepository mockRecipeRepository = MockRecipeRepository();
  GetRecipeDetailsUsecase usecase =
      GetRecipeDetailsUsecase(mockRecipeRepository);

  // setUp(() {
  //   MockRecipeRepository mockRecipeRepository = MockRecipeRepository();
  //   usecase = ;
  // });

  var tRecipeEntity = RecipesEntity(
    id: 0,
    title: 'title',
    image: 'image',
    imageType: 'imageType',
    servings: 1,
    readyInMinutes: 0,
    license: 'license',
    sourceName: 'sourceName',
    sourceUrl: 'sourceUrl',
    spoonacularSourceUrl: 'spoonacularSourceUrl',
    aggregateLikes: 0,
    healthScore: 2,
    spoonacularScore: 0,
    pricePerServing: 0.0,
    analyzedInstructions: const ['string'],
    cheap: true,
    creditsText: 'creditsText',
    cuisines: ['cuisines'],
    dairyFree: true,
    diets: ["diets"],
    gaps: 'gaps',
    glutenFree: true,
    instructions: 'instructions',
    ketogenic: true,
    lowFodmap: true,
    occasions: const ['occasions'],
    sustainable: true,
    vegan: true,
    vegetarian: true,
    veryHealthy: true,
    veryPopular: true,
    whole30: true,
    weightWatcherSmartPoints: 1,
    dishTypes: const ['DishTypes'],
    summary: 'summary',
  );

  var trendingRecipeResult = [
    tRecipeEntity,
    tRecipeEntity,
    tRecipeEntity,
  ];

  final valueId = 12989;
  test('should get trending recipes from repository', () async {
    //arrange
    when(mockRecipeRepository.getRecipeDetails(valueId))
        .thenAnswer((_) async => Right(tRecipeEntity));

    //act

    // final result = await usecase(Params(valueId));

    // //assert
    // expect(result, Right(tRecipeEntity));

    // verify(mockRecipeRepository.getTrendingRecipe());
  });
}
