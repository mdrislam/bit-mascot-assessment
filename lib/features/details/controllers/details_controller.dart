

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsController extends GetxController {
  final isLoading = false.obs;
  // Dummy data to test the UI without API
  final moviee = {
    "title": "Inception",
    "overview":
        "A thief who steals corporate secrets through use of dream-sharing technology is given the inverse task of planting an idea.",
    "backdrop_path": "/s3TBrRGB1iav7gFOCNx3H31MoES.jpg",
    "poster_path": "/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg",
    "vote_average": 8.8,
    "release_date": "2010-07-16",
    "genres": [
      {"name": "Action"},
      {"name": "Science Fiction"},
      {"name": "Adventure"},
    ],
    "status": "Released",
    "budget": 160000000,
    "revenue": 825532764,
    "runtime": 148,
    "credits": {
      "cast": [
        {
          "name": "Leonardo DiCaprio",
          "character": "Dom Cobb",
          "profile_path": "/wo2hJpn04vbtmh0B9utCFdsQhxM.jpg",
        },
        {
          "name": "Joseph Gordon-Levitt",
          "character": "Arthur",
          "profile_path": "/4U9G4YwTlIEbSUjQW5wGMjAKOUN.jpg",
        },
        {
          "name": "Elliot Page",
          "character": "Ariadne",
          "profile_path": "/k0l5VOzZsQ7tT8xVAfflf5FhPQc.jpg",
        },
      ],
    },
  };

  @override
  void onInit() {
    // fetchPhotos();

    super.onInit();
  }

  // Future<void> fetchPhotos() async {
  //   if (isLoading.value) return;

  //   isLoading.value = true;
  //   try {} catch (e) {
  //     SnackbarUtil.show('Failed to load photos', type: SnackbarType.error);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  String formatDate(String? date) {
    if (date == null || date.isEmpty) return 'Unknown';
    final parsedDate = DateTime.tryParse(date);
    return parsedDate != null
        ? DateFormat.yMMMMd().format(parsedDate)
        : 'Unknown';
  }

  String formatRuntime(int? minutes) {
    if (minutes == null) return 'Unknown';
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}m';
  }

  String formatCurrency(int? amount) {
    if (amount == null) return 'Unknown';
    return NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(amount);
  }
}
