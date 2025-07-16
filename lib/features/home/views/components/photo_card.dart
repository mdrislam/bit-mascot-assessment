import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:bit_mascot_assessment/data/remote/featurs/home/models/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoCard extends StatelessWidget {
  final PhotoModel photo;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  const PhotoCard({
    super.key,
    required this.photo,
    required this.onFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageSize = AppResponsiveInfo.screenWidth * AppSizes.imageHeightRatio;

    return Card(
      margin: AppResponsiveInfo.paddingSymmetric(
        horizontal: AppSizes.paddingMedium,
        vertical: AppSizes.paddingSmall,
      ),
      elevation: AppSizes.cardElevationZero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.surface,
      child: ListTile(
        contentPadding: AppResponsiveInfo.paddingSymmetric(
          horizontal: AppSizes.paddingMedium,
          vertical: AppSizes.paddingSmall,
        ),
        leading: ClipRRect(
          borderRadius: AppResponsiveInfo.borderRadiusAll(
            AppSizes.paddingSmall,
          ),
          child: Image.network(
            photo.thumbnailUrl,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                width: imageSize,
                height: imageSize,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) =>
                FlutterLogo(size: imageSize),
          ),
        ),
        title: Text(
          photo.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textPrimary,
            height: 1.3,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              '7.5',
              style: AppTextStyles.body.copyWith(
                height: 1.3,
                color: AppColors.textSecondary,
              ),
            ),
            Icon(Icons.star,
                color: AppColors.warning, size: AppResponsiveInfo.icon(AppSizes.iconSmall)),
          ],
        ),
        trailing: Obx(
          () => IconButton(
            onPressed: onFavorite,
            icon: Icon(
              photo.isFavorite.value ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: AppResponsiveInfo.icon(AppSizes.iconSmall),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
