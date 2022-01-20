import 'result_entity.dart';

class RecipeSearchResulEntity {
  final List<ResultsEntity>? results;
  final int? offset;
  final int? number;
  final int? totalResults;
  RecipeSearchResulEntity({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  });
}
