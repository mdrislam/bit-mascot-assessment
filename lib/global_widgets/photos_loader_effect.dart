import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PhotosLoaderEffect extends StatelessWidget {
  const PhotosLoaderEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: AppColors.grey300,
        highlightColor: AppColors.grey100,
        child: ListTile(
          leading: CircleAvatar(radius: AppSizes.shimmerItemRedius),
          title: Container(
            height: AppSizes.shimmerItemheight,
            color: AppColors.white,
          ),
          subtitle: Container(
            height: AppSizes.shimmerItemheight,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
