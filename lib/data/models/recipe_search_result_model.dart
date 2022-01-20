import 'result_model.dart';
import '../../domain/entities/recipe_search_result_entity.dart';

class RecipeSearchResultModel extends RecipeSearchResulEntity {
  List<ResultsModel>? results;
  int? offset;
  int? number;
  int? totalResults;

  RecipeSearchResultModel({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  }) : super(
          results: results,
          number: number,
          offset: offset,
          totalResults: totalResults,
        );

  RecipeSearchResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ResultsModel>[];
      json['results'].forEach((v) {
        results!.add(ResultsModel.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    data['number'] = this.number;
    data['totalResults'] = this.totalResults;
    return data;
  }
}
