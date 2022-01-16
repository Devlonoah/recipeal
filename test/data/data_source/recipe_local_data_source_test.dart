import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipeal/core/error/exception.dart';
import 'package:recipeal/core/keys/keys.dart';
import 'package:recipeal/data/data_source/recipe_local_data_source.dart';
import 'package:recipeal/data/models/trending_recipe_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fixtures/fixture_reader.dart';
import 'package:matcher/matcher.dart';

class MockSharedPrefences extends Mock implements SharedPreferences {}

void main() {
  MockSharedPrefences? mockSharedPrefences;
  RecipeLocalDataSourceImpl? dataSource;

  setUp(() {
    mockSharedPrefences = MockSharedPrefences();

    dataSource =
        RecipeLocalDataSourceImpl(sharedPreferences: mockSharedPrefences!);
  });

  group('get last trending recipe', () {
    final tTrendingRecipeModel = TrendingRecipeResultModel.fromJson(
        jsonDecode(fixture('trending_recipe_cached.json')));
    test(
      'should get last trending recipes from sharedpreferences when theri s one in the cache',
      () async {
        // arrange

        when(mockSharedPrefences?.getString(CACHED_TRENDING_RECIPE))
            .thenReturn(fixture('trending_recipe_cached.json'));

        // act

        final result = await dataSource?.getLastTrendingRecipe();

        // assert

        verify(mockSharedPrefences?.getString(CACHED_TRENDING_RECIPE));

        expect(result, isA<TrendingRecipeResultModel>());
      },
    );

    test(
      'should throw an exception  [CacheException] when there is no data in the cache [return [null]]',
      () async {
        // arrange

        when(mockSharedPrefences?.getString(CACHED_TRENDING_RECIPE))
            .thenReturn(null);

        // act

        final call = await dataSource?.getLastTrendingRecipe();

        // assert

        // verify(mockSharedPrefences?.getString(CACHED_TRENDING_RECIPE));

        expect(call, throwsA(isA<CacheException>()));
      },
    );
  });

  group('cache data', () {
    final tTrendingRecipeModel = TrendingRecipeResultModel.fromJson(
        jsonDecode(fixture('trending_recipe_cached.json')));

    final _responseBool = true;

    test(
      'should  call SharedPreference to cache the data',
      () async {
        // act

        dataSource!.cacheTrendingRecipe(tTrendingRecipeModel);

        // assert
        verify(mockSharedPrefences!.setString(
            CACHED_TRENDING_RECIPE, jsonEncode(tTrendingRecipeModel)));
      },
    );

    // test('should call SharedPreference to cache the data', () {
    //   when(mockSharedPrefences?.setString(
    //       CACHED_TRENDING_RECIPE, tTrendingRecipeModel.toString()));
    // });
  });
}
