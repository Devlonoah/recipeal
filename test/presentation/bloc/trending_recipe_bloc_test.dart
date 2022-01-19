// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:recipeal/data/models/recipe_model.dart';
// import 'package:recipeal/data/models/trending_recipe_result_model.dart';
// import 'package:recipeal/domain/usecases/get_trending_recipe.dart';
// import 'package:recipeal/presentation/bloc/trending_recipe/trending_recipe_bloc.dart';

// import 'package:bloc_test/bloc_test.dart';

// class MockGetTrendingRecipeUsecase extends Mock
//     implements GetTrendingRecipeUseCase {}

// void main() {
//   MockGetTrendingRecipeUsecase? mockGetTrendingRecipeUsecase;

//   TrendingRecipeBloc? bloc;

//   setUp(() {
//     mockGetTrendingRecipeUsecase = MockGetTrendingRecipeUsecase();

//     bloc = TrendingRecipeBloc(mockGetTrendingRecipeUsecase!);
//   });

//   final recipeModel = RecipesModel(
//     id: 0,
//     title: 'title',
//     image: 'image',
//     imageType: 'imageType',
//     servings: 1,
//     readyInMinutes: 0,
//     license: 'license',
//     sourceName: 'sourceName',
//     sourceUrl: 'sourceUrl',
//     spoonacularSourceUrl: 'spoonacularSourceUrl',
//     aggregateLikes: 0,
//     healthScore: 2,
//     spoonacularScore: 0,
//     pricePerServing: 0.0,
//     analyzedInstructions: const ['string'],
//     cheap: true,
//     creditsText: 'creditsText',
//     cuisines: ['cuisines'],
//     dairyFree: true,
//     diets: ["diets"],
//     gaps: 'gaps',
//     glutenFree: true,
//     instructions: 'instructions',
//     ketogenic: true,
//     lowFodmap: true,
//     occasions: const ['occasions'],
//     sustainable: true,
//     vegan: true,
//     vegetarian: true,
//     veryHealthy: true,
//     veryPopular: true,
//     // whole30: true,
//     weightWatcherSmartPoints: 1,
//     dishTypes: const ['DishTypes'],
//     summary: 'summary',
//   );

//   final listOfRecipes = [
//     recipeModel,
//     recipeModel,
//   ];

//   final result = TrendingRecipeResultModel(recipes: listOfRecipes);

//   test(
//     'initial state should be [TrendingRecipeInitial]',
//     () async {},
//   );

//   test(
//     'should get data from the concrete usescase',
//     () async {
//       // arrange

//       when(mockGetTrendingRecipeUsecase!(const NoParams()))
//           .thenAnswer((_) async => Right(result));

//       // act

//       bloc!.add(GetTrendingRecipe());

//       await untilCalled(mockGetTrendingRecipeUsecase!(const NoParams()));

//       // assert

//       verify(mockGetTrendingRecipeUsecase!(NoParams()));

//       expectLater(
//           bloc!.state,
//           emitsInAnyOrder([
//             TrendingRecipeLoading(),
//             TrendingRecipeLoaded(trendingRecipeResult: result),
//           ]));
//     },
//   );
// }
