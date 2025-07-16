import 'package:get/get_rx/src/rx_types/rx_types.dart';

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
      albumId: json['albumId'] ?? 0,
      id: json['id'],
      title: json['title'],
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl'],
      isFavorite: RxBool(false), // restoring
    );
  }

  Map<String, dynamic> toJson() => {
    'albumId': albumId,
    'id': id,
    'title': title,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
    'isFavorite': isFavorite.value, // storing
  };
}
