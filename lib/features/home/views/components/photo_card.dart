import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:bit_mascot_assessment/data/remote/featurs/home/models/photo_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth * 0.15; // 15% of screen width

    return Card(
      margin: AppResponsiveInfo.paddingSymmetric(
        horizontal: AppSizes.paddingMedium,
        vertical: AppSizes.paddingSmall,
      ),
      child: ListTile(
        contentPadding: AppResponsiveInfo.paddingSymmetric(
          horizontal: AppSizes.paddingMedium,
          vertical: AppSizes.paddingSmall,
        ),
        leading: CachedNetworkImage(
          imageUrl: photo.thumbnailUrl,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.cover,
          placeholder: (context, url) => SizedBox(
            width: imageSize,
            height: imageSize,
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: AppSizes.loadingIndicatorStock,
              ),
            ),
          ),
          errorWidget: (context, url, error) => FlutterLogo(size: imageSize),
        ),
        title: Text(
          photo.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyLarge,
        ),
        subtitle: Text(
          'Album ID: ${photo.albumId}',
          style: AppTextStyles.bodySmall,
        ),
        trailing: IconButton(
          icon: Obx(
            () => Icon(
              photo.isFavorite.value ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: screenWidth * 0.06,
            ),
          ),
          onPressed: onFavorite,
        ),
        onTap: onTap,
      ),
    );
  }
}
