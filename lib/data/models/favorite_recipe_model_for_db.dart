import 'dart:convert';

import 'package:recipeal/domain/entities/favorite_recipe_entity_for_db.dart';

class FavoriteRecipeModelForDb extends FavoriteRecipeEntityForDb {
  final int id;
  final String title;
  final String image;
  FavoriteRecipeModelForDb({
    required this.id,
    required this.title,
    required this.image,
  }) : super(
          id: id,
          title: title,
          image: image,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }

  factory FavoriteRecipeModelForDb.fromMap(Map<String, dynamic> map) {
    return FavoriteRecipeModelForDb(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteRecipeModelForDb.fromJson(String source) =>
      FavoriteRecipeModelForDb.fromMap(json.decode(source));
}
