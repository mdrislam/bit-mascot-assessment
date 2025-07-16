import 'package:bit_mascot_assessment/core/routes/app_routes.dart';
import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';

import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:bit_mascot_assessment/features/home/controllers/home_controller.dart';
import 'package:bit_mascot_assessment/global_widgets/photo_card.dart';
import 'package:bit_mascot_assessment/global_widgets/photos_loader_effect.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_text_styles.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Photos List'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.favorite);
            },
            icon: Icon(
              Icons.favorite,
              color: AppColors.error,
              size: AppResponsiveInfo.icon(AppSizes.iconSmall),
            ),
          ),
          SizedBox(width: AppResponsiveInfo.spacingSmall),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.photos.isEmpty) {
          return PhotosLoaderEffect();
        } else if (controller.photos.isEmpty) {
          return Center(
            child: Text(
              'No photos available',
              style: AppTextStyles.headline1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          );
        }
        return ListView.separated(
          controller: controller.scrollController,
          itemCount: controller.photos.length + 1,
          separatorBuilder: (context, index) => Padding(
            padding: AppResponsiveInfo.paddingSymmetric(
              horizontal: 10,
              vertical: 3,
            ),
            child: Divider(color: AppColors.divider, height: 1, thickness: 1),
          ),
          itemBuilder: (context, index) {
            if (index < controller.photos.length) {
              return PhotoCard(
                photo: controller.photos[index],

                onFavorite: () =>
                    controller.toggleFavorite(controller.photos[index]),
                onTap: () {},
              );
            } else {
              return controller.isLoading.value
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox();
            }
          },
        );
      }),
    );
  }
}
