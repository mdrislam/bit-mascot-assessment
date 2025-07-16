import 'package:bit_mascot_assessment/core/constants/app_strorage_key.dart';
import 'package:bit_mascot_assessment/data/remote/featurs/home/models/photo_model.dart';
import 'package:get_storage/get_storage.dart';

class AppLocalStorage {
  static final _box = GetStorage();

  // Save list of PhotoModel objects
  static void saveFavoritePhotos(List<PhotoModel> photos) {
    final jsonList = photos.map((photo) => photo.toJson()).toList();
    _box.write(AppStrorageKey.favorites, jsonList);
  }

  // Retrieve list of PhotoModel objects
  static List<PhotoModel> getFavoritePhotos() {
    final jsonList = _box.read(AppStrorageKey.favorites);
    if (jsonList == null) return [];
    return List<Map<String, dynamic>>.from(
      jsonList,
    ).map((json) => PhotoModel.fromJson(json)).toList();
  }
}
