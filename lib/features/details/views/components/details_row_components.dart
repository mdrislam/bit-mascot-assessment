import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:flutter/material.dart';

class DetailsRowComponents extends StatelessWidget {
  const DetailsRowComponents( {
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppResponsiveInfo.paddingAll(AppSizes.paddingSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppResponsiveInfo.w(AppSizes.detailsScreenImagewidth),
            child: Text(title, style: AppTextStyles.bodySmall),
          ),
          SizedBox(width: AppResponsiveInfo.spacingSmall),
          Expanded(child: Text(value, style: AppTextStyles.bodyLarge)),
        ],
      ),
    );
  }
}
