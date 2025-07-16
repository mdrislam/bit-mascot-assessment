import 'package:bit_mascot_assessment/core/constants/app_strorage_key.dart';
import 'package:get_storage/get_storage.dart';

class AppLocalStorage {
  static final _box = GetStorage();

  static void saveFavorites(List<int> ids) {
    _box.write(AppStrorageKey.favorites, ids);
  }

  static List<int> getFavorites() {
    return List<int>.from(_box.read(AppStrorageKey.favorites) ?? []);
  }
}
