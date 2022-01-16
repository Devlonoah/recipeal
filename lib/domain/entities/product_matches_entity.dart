import 'package:equatable/equatable.dart';

class ProductMatchesEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final double averageRating;
  final int ratingCount;
  final double score;
  final String link;

  const ProductMatchesEntity(
      this.id,
      this.title,
      this.description,
      this.price,
      this.imageUrl,
      this.averageRating,
      this.ratingCount,
      this.score,
      this.link);

  @override
  List<Object?> get props => [id, title, description];

  @override
  bool? get stringify => true;
}
