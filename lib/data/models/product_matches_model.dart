class ProductMatchesModel {
  ProductMatchesModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.averageRating,
    required this.ratingCount,
    required this.score,
    required this.link,
  });
  late final int id;
  late final String title;
  late final String description;
  late final String price;
  late final String imageUrl;
  late final double averageRating;
  late final int ratingCount;
  late final double score;
  late final String link;

  ProductMatchesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    averageRating = json['averageRating'];
    ratingCount = json['ratingCount'];
    score = json['score'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['price'] = price;
    _data['imageUrl'] = imageUrl;
    _data['averageRating'] = averageRating;
    _data['ratingCount'] = ratingCount;
    _data['score'] = score;
    _data['link'] = link;
    return _data;
  }
}
