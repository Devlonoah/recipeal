import 'package:mockito/mockito.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:recipeal/core/error/exception.dart';
import 'package:recipeal/data/data_source/recipe_remote_data_source.dart';
import 'package:recipeal/data/models/trending_recipe_result_model.dart';

import '../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late RecipeRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();

    dataSource = RecipeRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get trending recipe', () {
    final tTrendingRecipeModel = TrendingRecipeResultModel.fromJson(
        jsonDecode(fixture('trending_recipe_cached.json')));

    test(
      """should perferom a GET request on a URL with application/json header""",
      () async {
        // arrange

        when(mockHttpClient.get(Uri.parse('https:google.com'))).thenAnswer(
            (realInvocation) async =>
                http.Response(fixture('trending_recipe_cached.json'), 200));

        // act

        await dataSource.getTrendingRecipe();
        // assert

        verify(
            mockHttpClient.get((Uri.parse('https:google.com')), headers: any));
      },
    );
  });

  test("""should return trndingrecipemodel when called""", () async {
    // arrange

    when(mockHttpClient.get(Uri.parse('https:google.com'))).thenAnswer(
        (_) async =>
            http.Response(fixture('trending_recipe_cached.json'), 200));

    // act

    final result = await dataSource.getTrendingRecipe();
    // assert

    expect(result, isA<TrendingRecipeResultModel>());
  });

  test(
      """should throw serverException when ther response code is 404 or other""",
      () async {
    // arrange

    when(mockHttpClient.get(Uri.parse('https:google.com'))).thenAnswer(
        (_) async => http.Response('trending_recipe_cached.json', 404));

    // act

    final call = await dataSource.getTrendingRecipe();
    // assert

    expect(() => call, throwsA(TypeMatcher<ServerException>()));
  });
}
