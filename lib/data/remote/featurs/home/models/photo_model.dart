import 'package:get/get.dart';

class PhotoModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  final RxBool isFavorite;

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    required this.isFavorite,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
      isFavorite: RxBool(false),
    );
  }
}
