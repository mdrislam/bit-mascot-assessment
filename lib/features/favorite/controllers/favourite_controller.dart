import 'package:bit_mascot_assessment/data/local/app_local_storage.dart';
import 'package:bit_mascot_assessment/data/remote/featurs/home/models/photo_model.dart';
import 'package:bit_mascot_assessment/global_widgets/snakbar_utils.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<PhotoModel> favoritePhotos = <PhotoModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    loadFavorites();

    super.onInit();
  }

  Future<void> loadFavorites() async {
    if (isLoading.value) return;

    isLoading.value = true;
    try {
      final stored = AppLocalStorage.getFavoritePhotos();
      favoritePhotos.assignAll(stored);
    } catch (e) {
      SnackbarUtil.show('Failed to load photos', type: SnackbarType.error);
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(PhotoModel photo) {
    if (photo.isFavorite.value) {
      removeFavorite(photo);
    } else {
      addFavorite(photo);
    }
  }

  void addFavorite(PhotoModel photo) {
    if (!favoritePhotos.any((p) => p.id == photo.id)) {
      photo.isFavorite.value = true;
      favoritePhotos.add(photo);
      AppLocalStorage.saveFavoritePhotos(favoritePhotos.toList());
      // SnackbarUtil.show('Added to favorites', type: SnackbarType.success);
    }
  }

  void removeFavorite(PhotoModel photo) {
    photo.isFavorite.value = false;
    favoritePhotos.removeWhere((p) => p.id == photo.id);
    AppLocalStorage.saveFavoritePhotos(favoritePhotos.toList());
    // SnackbarUtil.show('Removed from favorites', type: SnackbarType.success);
  }

  bool isFavorite(int id) => favoritePhotos.any((p) => p.id == id);
}
