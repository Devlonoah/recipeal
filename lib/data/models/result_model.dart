import '../../domain/entities/result_entity.dart';

class ResultsModel extends ResultsEntity {
  int? id;
  String? title;
  String? image;
  String? imageType;

  ResultsModel({this.id, this.title, this.image, this.imageType})
      : super(
          id: id,
          title: title,
          image: image,
          imageType: imageType,
        );

  ResultsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    return data;
  }
}
