// To parse this JSON data, do
//
//     final similarRecipeModel = similarRecipeModelFromMap(jsonString);

import 'dart:convert';

import 'package:recipeal/domain/entities/similar_recipe_entity.dart';

class SimilarRecipeModel extends SimilarRecipeEntity {
  SimilarRecipeModel({
    required this.id,
    required this.title,
    required this.imageType,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
  }) : super(
          id: id,
          title: title,
          imageType: imageType,
          readyInMinutes: readyInMinutes,
          servings: servings,
          sourceUrl: sourceUrl,
        );

  int id;
  String title;
  String imageType;
  int readyInMinutes;
  int servings;
  String sourceUrl;

  factory SimilarRecipeModel.fromJson(String str) =>
      SimilarRecipeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SimilarRecipeModel.fromMap(Map<String, dynamic> json) =>
      SimilarRecipeModel(
        id: json["id"],
        title: json["title"],
        imageType: json["imageType"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "imageType": imageType,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
      };
}
