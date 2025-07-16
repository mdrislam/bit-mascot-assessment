import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';

import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:bit_mascot_assessment/features/favorite/controllers/favourite_controller.dart';

import 'package:bit_mascot_assessment/global_widgets/photo_card.dart';
import 'package:bit_mascot_assessment/global_widgets/photos_loader_effect.dart';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class FavoriteScreen extends GetView<FavouriteController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: const Text('Favorite Photos List')),
      body: Obx(() {
        if (controller.isLoading.value && controller.favoritePhotos.isEmpty) {
          return PhotosLoaderEffect();
        } else if (controller.favoritePhotos.isEmpty) {
          return Center(
            child: Text(
              'No favorite photos yet',
              style: AppTextStyles.headline1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          );
        }
        return ListView.separated(
          itemCount: controller.favoritePhotos.length,
          separatorBuilder: (context, index) => Padding(
            padding: AppResponsiveInfo.paddingSymmetric(
              horizontal: 10,
              vertical: 3,
            ),
            child: Divider(color: AppColors.divider, height: 1, thickness: 1),
          ),
          itemBuilder: (context, index) {
            return PhotoCard(
              photo: controller.favoritePhotos[index],
              forHome: false, 
              onFavorite: () =>
                  controller.toggleFavorite(controller.favoritePhotos[index]),
              onTap: () {},
            );
          },
        );
      }),
    );
  }
}
