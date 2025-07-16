import 'package:bit_mascot_assessment/core/constants/endpoints.dart';
import 'package:bit_mascot_assessment/data/remote/featurs/home/models/photo_model.dart';
import 'package:bit_mascot_assessment/data/remote/helper/api_client_service.dart';
import 'package:bit_mascot_assessment/data/remote/helper/api_exception.dart';

class HomeRepositories {
  Future<List<PhotoModel>> getPhotos({
    required int page,
    required int limit,
    required List<PhotoModel> favoriteIds,
  }) async {
    try {
      final response = await ApiClientService.get(
        endpoint: '${Endpoints.photos}?_page=$page&_limit=$limit',
      );
      return response.map<PhotoModel>((json) {
        final model = PhotoModel.fromJson(json);
        // Check if this photo is in the favorite list
        final isFav = favoriteIds.any((fav) => fav.id == model.id);
        model.isFavorite.value = isFav;
        return model;
      }).toList();
    } catch (e) {
      if (e is ApiException) {
        throw ApiException(e.message);
      }
      throw ApiException(e.toString());
    }
  }
}
