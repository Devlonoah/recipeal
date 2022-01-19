class SimilarRecipeEntity {
  SimilarRecipeEntity({
    required this.id,
    required this.title,
    required this.imageType,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
  });

  int id;
  String title;
  String imageType;
  int readyInMinutes;
  int servings;
  String sourceUrl;
}
