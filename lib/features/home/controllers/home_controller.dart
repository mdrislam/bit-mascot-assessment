import 'package:bit_mascot_assessment/data/local/app_local_storage.dart';
import 'package:bit_mascot_assessment/data/remote/featurs/home/models/photo_model.dart';
import 'package:bit_mascot_assessment/data/remote/featurs/home/repositories/home_repositories.dart';
import 'package:bit_mascot_assessment/global_widgets/snakbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({required HomeRepositories repository})
    : _repository = repository;

  final HomeRepositories _repository;
  final RxList<PhotoModel> photos = <PhotoModel>[].obs;
  List<PhotoModel> favoritePhotos = <PhotoModel>[];
  final isLoading = false.obs;
  final scrollController = ScrollController();
  int _page = 1;
  final int _limit = 10;

  @override
  void onInit() {
    fetchPhotos();
    _setupScrollController();
    loadFavorites();
    super.onInit();
  }

  void _setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchPhotos();
      }
    });
  }

  Future<void> fetchPhotos() async {
    if (isLoading.value) return;

    isLoading.value = true;
    try {
      final newPhotos = await _repository.getPhotos(
        page: _page,
        limit: _limit,
        favoriteIds: favoritePhotos,
      );
      photos.addAll(newPhotos);
      _page++;
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

  void loadFavorites() {
    final stored = AppLocalStorage.getFavoritePhotos();
    favoritePhotos.assignAll(stored);
  }
}
