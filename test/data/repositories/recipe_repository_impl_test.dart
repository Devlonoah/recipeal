import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipeal/data/data_source/recipe_local_data_source.dart';
import 'package:recipeal/data/data_source/recipe_remote_data_source.dart';
import 'package:recipeal/data/models/trending_recipe_result_model.dart';
import 'package:recipeal/data/repository/recipe_repository_impl.dart';
import 'package:recipeal/domain/entities/random_recipe_result_entity.dart';

class MockRemoteDataSource extends Mock implements RecipeRemoteDataSource {}

class MockLocalDataSource extends Mock implements RecipeLocalDataSource {}

void main() {
  RecipeRepositoryImpl? recipeRepositoryImpl;
  MockRemoteDataSource? mockRemoteDataSource;
  MockLocalDataSource? mockLocalDataSource;

  final _trendingModel = TrendingRecipeResultModel(recipes: []);
  group(
    'fetching recipes',
    () {
      setUp(() {
        mockRemoteDataSource = MockRemoteDataSource();

        mockLocalDataSource = MockLocalDataSource();
        recipeRepositoryImpl = RecipeRepositoryImpl(
          remoteDataSource: mockRemoteDataSource!,
          localDataSource: mockLocalDataSource!,
        );
      });
      test(
        'should return remote data when cal to remote is succesfull',
        () {
//arrange
          when(mockRemoteDataSource?.getTrendingRecipe())
              .thenAnswer((realInvocation) async => _trendingModel);
//act
          final result = recipeRepositoryImpl?.getTrendingRecipe();
//assert
          verify(mockRemoteDataSource?.getTrendingRecipe());

          expect(result, isA<TrendingRecipeResulEntity>());
        },
      );
      test(
          'should cache the data locally whrn the call to remote data source is called',
          () async {
        //arrange
        when(mockRemoteDataSource?.getTrendingRecipe())
            .thenAnswer((_) async => _trendingModel);

        //act
        await recipeRepositoryImpl?.getTrendingRecipe();

        await mockLocalDataSource?.cacheTrendingRecipe(_trendingModel);

        //assert

        verify(mockRemoteDataSource?.getTrendingRecipe());

        verify(mockLocalDataSource?.cacheTrendingRecipe(_trendingModel));
      });
    },
  );
}
